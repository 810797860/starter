//JavaScript代码区域
layui.config({
    version: '1568076536509' //为了更新 js 缓存，可忽略
});

layui.use(['laypage', 'layer', 'table', 'element'], function(){
    var laypage = layui.laypage //分页
        ,layer = layui.layer //弹层
        ,table = layui.table //表格
        ,element = layui.element //元素操作
        ,$ = layui.jquery//jquery
        ,postData = {}//分页传参
        ,totalNumber = 0

    // refresh();
    renderTable();

    //执行一个 table 实例
    function renderTable() {
        table.render({
            elem: '#demo'
            , height: 'full-200'
            , cellMinWidth: 80
            , url: '/admin/demo/table/user/' //数据接口
            , method: 'get'//post请求
            , limit: 30
            , done: function (res, curr, count) {
                // renderLaypage();
            }
            , title: '用户表'
            , page: true //开启分页
            , toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            , totalRow: true //开启合计行
            , cols: [[ //表头
                {type:'checkbox'}
                , {field:'id', width:100, sort: true, title: 'ID'}
                , {field:'username', width:100, title: '用户名'}
                , {field:'sex', width:100, sort: true, title: '性别'}
                , {field:'sign', minWidth: 150, title: '签名'}
                , {field:'experience', sort: true, align: 'right', title: '积分'}
                , {field:'score', sort: true, minWidth: 100, align: 'right', title: '评分'}
            ]]
        });
    }

    /*/!**
     * 处理post传参
     * @param pageCurrent
     *!/
    function paginationParameters(pageCurrent) {
        var page = {};
        page.current = pageCurrent;
        page.size = 10;

        var sorts = [];
        var defaultSort = {};
        defaultSort.field = 'id';
        defaultSort.isAsc = false;
        sorts.push(defaultSort);
        postData['page'] = page;
        postData['sorts'] = sorts;
    }

    /!**
     * 分页
     *!/
    function renderLaypage(){
        laypage.render({
            elem: 'pagesize'
            ,count: totalNumber
            ,curr: location.hash.replace('#!fenye=', '') //获取起始页。一定要写这个两个。否则你点击了页面，接口也是访问了指定页的内容，但是页面上效果是选中的还是第一个。
            ,hash: 'fenye' //自定义hash值
            ,layout: ['count', 'prev', 'page', 'next',  'skip']
            ,jump: function(obj, first){
                if(!first){
                    paginationParameters(obj.curr);
                    renderTable();
                }
            }
        });
    }

    /!**
     * 刷新表单
     *!/
    function refresh() {

        //设置页数为1，并渲染table和分页组件
        paginationParameters(1);
        renderTable();
        renderLaypage();
    }

    /!**
     * 搜索按钮
     *!/
    $(".ojbk-search-btn").click(function () {
        //先获取搜索框的值
        var title = $("#searchTitle").val();
        var collection = $("#searchCollection").val();
        if (StringNoEmpty(title)){
            postData['title'] = title;
        } else {
            delete postData['title'];
        }
        if (StringNoEmpty(collection)){
            postData['collection'] = collection;
        } else {
            delete postData['collection'];
        }
        refresh();
    })

    /!**
     * str判空
     * @param str
     * @returns {boolean}
     * @constructor
     *!/
    function StringNoEmpty(str) {
        if (str != null && str != "" && str != undefined) {
            return true;
        } else return false;
    }*/

    //监听头工具栏事件
    table.on('toolbar(test)', function(obj){
        var checkStatus = table.checkStatus(obj.config.id)
            ,data = checkStatus.data; //获取选中的数据
        switch(obj.event){
            case 'add':
                //跳转到新增页面
                layer.open({
                    type: 2
                    ,title: '新建表单'
                    ,content: '/admin/form/create.html'
                    ,maxmin: true
                    ,area: ['550px', '550px']
                    ,btn: ['确定', '取消']
                    ,yes: function (index, layro) {
                        var submit = layro.find('iframe').contents().find('#modifyBtn');
                        submit.click();
                        layer.msg("新增成功");
                    }
                })
                break;
            case 'update':
                if(data.length === 0){
                    layer.msg('请选择一行');
                } else if(data.length > 1){
                    layer.msg('只能同时修改一个');
                } else {
                    //跳转到修改页面
                    layer.open({
                        type: 2
                        ,title: '修改表单'
                        ,content: '/admin/form/' + checkStatus.data[0].id + '/update.html'
                        ,maxmin: true
                        ,area: ['550px', '550px']
                        ,btn: ['确定', '取消']
                        ,yes: function (index, layro) {
                            layer.msg('修改成功');
                        }
                    })
                }
                break;
            case 'delete':
                if(data.length === 0){
                    layer.msg('请选择一行');
                } else {
                    layer.msg('删除');
                }
                break;
        };
    });

    //监听行工具事件
    table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
        var data = obj.data //获得当前行数据
            ,layEvent = obj.event; //获得 lay-event 对应的值
        if(layEvent === 'detail'){
            layer.msg('查看操作');
        } else if(layEvent === 'del'){
            layer.confirm('真的删除行么', function(index){
                obj.del(); //删除对应行（tr）的DOM结构
                layer.close(index);
                //向服务端发送删除指令
            });
        } else if(layEvent === 'edit'){
            layer.msg('编辑操作');
        }
    });

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