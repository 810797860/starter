//JavaScript代码区域
layui.config({
    version: '1568076536509' //为了更新 js 缓存，可忽略
});

layui.use(['layer', 'element', 'tree', 'ojbk'], function(){
    var layer = layui.layer //弹层
        ,element = layui.element //元素操作
        ,tree = layui.tree//树
        ,ojbk = layui.ojbk //自定义模块
        ,$ = layui.jquery//jquery
        ,checkedList = [];

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
            },oncheck: function (obj) {
                if (obj.checked === true){
                    //选中的时候，直接加上去
                    checkedList.push(obj.data.id)
                } else {
                    ojbk.deleteArrElement(checkedList, obj.data.id);
                }
                console.log(checkedList);
            }
        });
    }

    /**
     * 初始化tree的data
     */
    function initData() {
        var data = [];
        for (var i = 0; i < allRoleList.length; i++){
            data.push(initDom(allRoleList[i]));
        }
        return data;
    }

    function initDom(menuObj) {
        var dom = {};
        dom['id'] = menuObj.id;
        dom['title'] = menuObj.roleDesc;
        dom['href'] = 'javascript:;';
        //判断选中状态
        for (var i = 0; i < selectedRoleList.length; i++){
            if (selectedRoleList[i].id == menuObj.id){
                dom['checked'] = true;
            }
        }
        return dom;
    }

    function refresh() {
        initData();
        renderTree();
        tree.render();
    }

    $("#modifyBtn").click(function () {
        ojbk.postAjax('/admin/userRole/create_update/' + userId, checkedList , function (data) {
            switch (data.code) {
                case 200:
                    parent.tools.refresh();
                    //关闭该窗口
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(index);
                    break;
            }
        });
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