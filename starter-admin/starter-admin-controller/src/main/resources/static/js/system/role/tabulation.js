//JavaScript代码区域
layui.config({
    version: '1568076536509' //为了更新 js 缓存，可忽略
});

layui.use(['layer', 'element', 'tree', 'ojbk', 'util'], function(){
    var layer = layui.layer //弹层
        ,element = layui.element //元素操作
        ,tree = layui.tree//树
        ,ojbk = layui.ojbk
        ,util = layui.util
        ,$ = layui.jquery;//jquery

    initLayDemo();
    refresh();

    //初始化tree
    function renderTree() {
        tree.render({
            elem: '#demo'
            ,id: 'ojbkTree'
            , showCheckbox: false
            , data: initData()
            , showCheckbox: true
            , onlyIconControl: true
            , text: {
                defaultNodeName: '未命名' //节点默认名称
                ,none: '无数据' //数据为空时的提示文本
            }
            ,click: function (obj) {
                var data = obj.data; //得到当前节点的数据
                layer.open({
                    type: 2
                    ,title: '修改角色'
                    ,content: '/admin/role/' + data.id + '/update.html'
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

    function initLayDemo() {
        var layDemoStr = "util.event('lay-demo', {";
        for (var i = 0; i < buttons.length; i++){
            if (i !== 0){
                layDemoStr = layDemoStr + " ,";
            }
            layDemoStr = layDemoStr + buttons[i].icon + ": function(){" + buttons[i].script + "}"
        }
        layDemoStr = layDemoStr + "});";
        eval(layDemoStr);
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