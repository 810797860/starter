//JavaScript代码区域
layui.config({
    version: '1568076536509' //为了更新 js 缓存，可忽略
});

layui.use(['layer', 'element', 'tree', 'ojbk'], function(){
    var layer = layui.layer //弹层
        ,element = layui.element //元素操作
        ,tree = layui.tree//树
        ,ojbk = layui.ojbk
        ,$ = layui.jquery;//jquery

    refresh();

    //初始化tree
    function renderTree() {
        tree.render({
            elem: '#demo'
            , showCheckbox: false
            , data: initData()
            , showCheckbox: true
            , onlyIconControl: true
            , text: {
                defaultNodeName: '未命名' //节点默认名称
                ,none: '无数据' //数据为空时的提示文本
            }
            , operate: function (obj) {
                var type = obj.type; //得到操作类型：add、edit、del
                var data = obj.data; //得到当前节点的数据

                switch (type){
                    case 'add':
                        //跳转到新增页面
                        layer.open({
                            type: 2
                            ,title: '新增菜单'
                            ,content: ['/admin/menu/create.html?pid=' + data.id, 'no']
                            ,maxmin: true
                            ,area: ['550px', '550px']
                            ,btn: ['确定', '取消']
                            ,yes: function (index, layro) {
                                var submit = layro.find('iframe').contents().find('#modifyBtn');
                                submit.click();
                                layer.msg("新增成功");
                            }
                            ,cancel: function () {
                                refresh();
                            }
                        });
                        break;
                    case 'update':
                        layer.open({
                            type: 2
                            ,title: '修改菜单'
                            ,content: ['/admin/menu/' + data.id + '/update.html?pid=' + data.pid, 'no']
                            ,maxmin: true
                            ,area: ['550px', '550px']
                            ,btn: ['确定', '取消']
                            ,yes: function (index, layro) {
                                var submit = layro.find('iframe').contents().find('#modifyBtn');
                                submit.click();
                                layer.msg('修改成功');
                            }
                        });
                        break;
                    case 'del':
                        var deleteParam = [];
                        deleteParam.push(data.id);
                        //开始删除
                        ojbk.putAjax('/admin/menu/batch_delete', deleteParam, function (data) {
                            switch (data.code) {
                                case 200:
                                    layer.msg('删除成功');
                                    break;
                            }
                        });
                        break;
                }
            }
            ,click: function (obj) {
                var data = obj.data; //得到当前节点的数据
                layer.open({
                    type: 2
                    ,title: '修改菜单'
                    ,content: ['/admin/menu/' + data.id + '/update.html?pid=' + data.pid, 'no']
                    ,maxmin: true
                    ,area: ['550px', '550px']
                    ,btn: ['确定', '取消']
                    ,yes: function (index, layro) {
                        var submit = layro.find('iframe').contents().find('#modifyBtn');
                        submit.click();
                        layer.msg('修改成功');
                    }
                });
            }
        });
    }

    /**
     * 初始化tree的data
     */
    function initData() {
        var data = [];
        for (var i = 0; i < roleList.length; i++){
            data.push(initDom(roleList[i]));
        }
        return data;
    }

    function initDom(menuObj) {
        var dom = {};
        dom['id'] = menuObj.id;
        dom['title'] = menuObj.roleDesc;
        dom['href'] = 'javascript:;';
        return dom;
    }

    function refresh() {
        initData();
        renderTree();
        tree.render();
    }

    $("#addSubordinate").click(function () {

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