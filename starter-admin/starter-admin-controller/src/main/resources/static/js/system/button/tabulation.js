//JavaScript代码区域
layui.config({
    version: '1568076536509' //为了更新 js 缓存，可忽略
});

layui.use(['laypage', 'layer', 'table', 'element', 'ojbk'], function(){
    var laypage = layui.laypage //分页
        ,layer = layui.layer //弹层
        ,table = layui.table //表格
        ,element = layui.element //元素操作
        ,ojbk = layui.ojbk
        ,$ = layui.jquery//jquery
        ,postData = {}//分页传参
        ,totalNumber = 0//数据总数
        ,pageCurrent = 1//当前页数
        ,pageSize = 10
        ,formId = $('#formId').val();//获取url传参

    refresh();

    //执行一个 table 实例
    function renderTable() {
        table.render({
            elem: '#demo'
            , height: 'full-90'
            , cellMinWidth: 80
            , url: '/admin/button/query' //数据接口
            , contentType: 'application/json'
            , method: 'post'//post请求
            , where: postData
            , limit: pageSize
            , parseData: function (res) {
                totalNumber = res.recordsTotal;
                return {
                    "code": 0
                    , "msg": res.message
                    , "count": res.recordsTotal
                    , "data": res.data
                }
            }
            , done: function (res, curr, count) {
                //设置整个表格样式
                renderLaypage();
            }
            , title: '按钮表'
            , page: false //开启分页
            , toolbar: '#barDemo' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            , defaultToolbar: [{
                title: '刷新'
                , layEvent: 'refresh'
                , icon: 'layui-icon-refresh'
            }, 'filter', 'exports', 'print']
            , cols: [[ //表头
                {type: 'checkbox'}
                , {field: 'title', title: '按钮名称'}
                , {field: 'num', title: '显示顺序'}
                , {field: 'icon', title: '按钮图标'}
                , {field: 'className', title: '按钮样式'}
                , {field: 'description', title: '备注'}
            ]]
        });
    }

    /**
     * 处理post传参
     */
    function paginationParameters() {
        var page = {};
        page.current = pageCurrent;
        page.size = pageSize;

        var sorts = [];
        var defaultSort = {};
        defaultSort.field = 'id';
        defaultSort.isAsc = false;
        sorts.push(defaultSort);
        postData['formId'] = formId;
        postData['page'] = page;
        postData['sorts'] = sorts;
    }

    /**
     * 分页
     */
    function renderLaypage(){
        laypage.render({
            elem: 'pagesize'
            ,count: totalNumber
            ,limit: pageSize
            ,curr: pageCurrent //获取起始页。一定要写这个两个。否则你点击了页面，接口也是访问了指定页的内容，但是页面上效果是选中的还是第一个。
            ,hash: 'fenye' //自定义hash值
            ,layout: ['count', 'prev', 'page', 'next', 'limit', 'skip']
            ,jump: function(obj, first){
                if(!first){
                    //设置当前页数
                    pageSize = obj.limit;
                    pageCurrent = obj.curr;
                    paginationParameters();
                    renderTable();
                }
            }
        });
    }

    /**
     * 刷新表单
     */
    function refresh() {
        //设置页数为1，并渲染table和分页组件
        pageCurrent = 1;
        paginationParameters();
        renderTable();
        renderLaypage();
    }

    /**
     * 搜索按钮
     */
    $(".ojbk-search-btn").click(function () {
        //先获取搜索框的值
        var title = $("#searchTitle").val();
        var description = $("#searchDescription").val();
        if (ojbk.stringNoEmpty(title)){
            postData['title'] = title;
        } else {
            delete postData['title'];
        }
        if (ojbk.stringNoEmpty(description)){
            postData['description'] = description;
        } else {
            delete postData['description'];
        }
        refresh();
        layer.msg('搜索成功');
    });

    //监听头工具栏事件
    table.on('toolbar(test)', function(obj){
        var checkStatus = table.checkStatus(obj.config.id)
            ,data = checkStatus.data; //获取选中的数据
        eval(ojbk.getSwitchStr(buttons));
    });

    /**
     * 监听行双击事件
     */
    table.on('rowDouble(test)', function(obj){
        //obj 同上
        var id = obj.data.id; //获取选中的数据
        updateOperation(id);
    });

    /**
     * 抽出修改部分，方便双击修改
     * @param id
     */
    function updateOperation(id) {
        //跳转到修改页面
        var index = parent.layer.open({
            type: 2
            ,title: '修改按钮'
            ,content: '/admin/button/' + formId + '/' + id + '/update.html'
            ,maxmin: true
            ,area: ['550px', '550px']
            ,btn: ['确定', '取消']
            ,yes: function (index, layro) {
                var submit = layro.find('iframe').contents().find('#modifyBtn');
                submit.click();
                layer.msg('修改成功');
            }
        });
        //窗口默认最大化
        parent.layer.full(index);
    }

    /**
     * 给子页面定义函数
     */
    var _tools = {
        refresh: function(){
            refresh();
        }
    }
    window.tools = _tools;
});