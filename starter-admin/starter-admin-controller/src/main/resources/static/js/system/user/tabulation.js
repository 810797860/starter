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
        ,totalNumber = 0//数据总数
        ,pageCurrent = 1//当前页数

    refresh();


    //执行一个 table 实例
    function renderTable() {
        table.render({
            elem: '#demo'
            , height: 'full-90'
            , cellMinWidth: 80
            , url: '/admin/user/query' //数据接口
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
                renderLaypage();
            }
            , title: '表单表'
            , page: false //开启分页
            , toolbar: '#barDemo' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            , defaultToolbar: [{
                title: '刷新'
                , layEvent: 'refresh'
                , icon: 'layui-icon-refresh'
            }, 'filter', 'exports', 'print']
            , cols: [[ //表头
                {type: 'checkbox'}
                , {field: 'userName', title: '用户名'}
                , {field: 'account', title: '账号'}
                , {field: 'phone', title: '手机号'}
                , {field: 'email', title: '邮箱'}
            ]]
        });
    }

    /**
     * 处理post传参
     */
    function paginationParameters() {
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
            ,curr: pageCurrent //获取起始页。一定要写这个两个。否则你点击了页面，接口也是访问了指定页的内容，但是页面上效果是选中的还是第一个。
            ,hash: 'fenye' //自定义hash值
            ,layout: ['count', 'prev', 'page', 'next',  'skip']
            ,jump: function(obj, first){
                if(!first){
                    //设置当前页数
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
            case 'refresh':
                refresh();
                layer.msg('刷新成功');
                break;
            case 'add':
                //跳转到新增页面
                layer.open({
                    type: 2
                    ,title: '新增表单'
                    ,content: ['/admin/user/create.html?id=', 'no']
                    ,maxmin: true
                    ,area: ['550px', '550px']
                    ,btn: ['确定', '取消']
                    ,yes: function (index, layro) {
                        var submit = layro.find('iframe').contents().find('#modifyBtn');
                        submit.click();
                    }
                });
                break;
            case 'update':
                if(data.length === 0){
                    layer.msg('请选择一行');
                } else if(data.length > 1){
                    layer.msg('只能同时修改一个');
                } else {
                    //跳转到修改页面
                    var index = layer.open({
                        type: 2
                        ,title: '修改表单'
                        ,content: '/admin/user/' + checkStatus.data[0].id + '/update.html'
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
                    layer.full(index);
                }
                break;
            case 'delete':
                if(data.length === 0){
                    layer.msg('请选择一行');
                } else {
                    //先获取要删除的行
                    var dataList = checkStatus.data,
                        deleteParam = [];
                    for (var i = 0; i < dataList.length; i++){
                        deleteParam.push(dataList[i].id);
                    }
                    //开始删除
                    $.ajax({
                        type: 'put'
                        , url: '/admin/user/batch_delete'
                        , contentType: 'application/json;charset=utf-8'
                        , dataType: 'json'
                        , data: JSON.stringify(deleteParam)
                        , success: function (data) {
                            switch (data.code) {
                                case 200:
                                    refresh();
                                    layer.msg('删除成功');
                                    break;
                            }
                        }
                    });
                }
                break;
            case 'search':
                //展开搜索项
                $("#ojbk-search").show();
                break;
        };
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