//JavaScript代码区域
layui.config({
    version: '1568076536509' //为了更新 js 缓存，可忽略
});

layui.use(['layer', 'element', 'tree'], function(){
    var layer = layui.layer //弹层
        ,element = layui.element //元素操作
        ,tree = layui.tree//树
        ,$ = layui.jquery;//jquery

    refresh();
    console.log(menuList);

    //初始化tree
    function renderTree() {
        tree.render({
            elem: '#demo'
            , showCheckbox: false
            , data: initData()
            , onlyIconControl: true
            , edit: ['add', 'update', 'del']
            , text: {
                defaultNodeName: '未命名' //节点默认名称
                ,none: '无数据' //数据为空时的提示文本
            }
            , operate: function (obj) {
                var type = obj.type; //得到操作类型：add、edit、del
                var data = obj.data; //得到当前节点的数据

                if (type === 'add'){
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
                } else if (type === 'update'){
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
                } else if (type === 'del'){
                    var deleteParam = [];
                    deleteParam.push(data.id);
                    //开始删除
                    $.ajax({
                        type: 'put'
                        , url: '/admin/menu/batch_delete'
                        , contentType: 'application/json;charset=utf-8'
                        , dataType: 'json'
                        , data: JSON.stringify(deleteParam)
                        , success: function (data) {
                            switch (data.code) {
                                case 200:
                                    layer.msg('删除成功');
                                    break;
                            }
                        }
                    });
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
        //一级菜单
        for (var i = 0; i < menuList.length; i++){
            var pid = menuList[i].pid;
            if (pid === null){
                var dom = initDom(menuList[i]);
                data.push(dom);
            }
        }
        //二级菜单
        for (var i = 0; i < menuList.length; i++){
            var pid = menuList[i].pid;
            for (var j = 0; j < data.length; j++){
                if (pid == data[j].id){
                    var dom = initDom(menuList[i]);
                    var domChildren = data[j]['children'];
                    domChildren.push(dom);
                }
            }
        }
        //三级菜单
        for (var i = 0; i < menuList.length; i++){
            var pid = menuList[i].pid;
            for (var j = 0; j < data.length; j++){
                var dataChildren = data[j]['children'];
                for (var k = 0; k < dataChildren.length; k++){
                    if (pid == dataChildren[k].id){
                        var dom = initDom(menuList[i]);
                        var domChildren = data[j]['children'][k]['children'];
                        domChildren.push(dom);
                    }
                }
            }

        }
        return data;
    }

    function initDom(menuObj) {
        var dom = {};
        dom['id'] = menuObj.id;
        dom['title'] = menuObj.name;
        dom['href'] = 'javascript:;';
        dom['spread'] = 'true';
        dom['children'] = [];
        if (!!menuObj.pid){
            dom['pid'] = menuObj.pid;
        }
        return dom;
    }

    function refresh() {
        console.log('=====');
        initData();
        renderTree();
        tree.render();
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