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

    paginationParameters(1);
    renderTable();
    renderLaypage();


    //执行一个 table 实例
    function renderTable() {
        table.render({
            elem: '#demo'
            , height: 'full-200'
            , cellMinWidth: 80
            , url: '/admin/form/query' //数据接口
            , contentType: 'application/json'
            , method: 'post'//post请求
            , where: postData
            , limit: 10
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
                $("table").css("width", "100%");
                $("table").css("height", "auto");
                renderLaypage();
            }
            , title: '用户表'
            , page: false //开启分页
            , toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            , totalRow: true //开启合计行
            , cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', title: 'ID', sort: true, fixed: 'left'}
                , {field: 'title', title: '表名', fixed: 'left'}
                , {field: 'collection', title: '物理表名', fixed: 'left'}
            ]]
        });
    }

    /**
     * 处理post传参
     * @param pageCurrent
     */
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

    /**
     * 分页
     */
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

    /**
     * 搜索按钮
     */
    $(".ojbk-search-btn").click(function () {
        //先获取搜索框的值
        var title = $("#searchTitle").val();
        var collection = $("#searchCollection").val();
        if (StringNoEmpty(title)){
            postData['title'] = title;
        }
        if (StringNoEmpty(collection)){
            postData['collection'] = collection;
        }

        //设置页数为1，并渲染table和分页组件
        paginationParameters(1);
        renderTable();
        renderLaypage();
    })

    /**
     * str判空
     * @param str
     * @returns {boolean}
     * @constructor
     */
    function StringNoEmpty(str) {
        if (str != null && str != "" && str != undefined) {
            return true;
        } else return false;
    }

    //监听头工具栏事件
    table.on('toolbar(test)', function(obj){
        var checkStatus = table.checkStatus(obj.config.id)
            ,data = checkStatus.data; //获取选中的数据
        switch(obj.event){
            case 'add':
                layer.msg('添加');
                break;
            case 'update':
                if(data.length === 0){
                    layer.msg('请选择一行');
                } else if(data.length > 1){
                    layer.msg('只能同时编辑一个');
                } else {
                    layer.alert('编辑 [id]：'+ checkStatus.data[0].id);
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
});