//JavaScript代码区域
layui.config({
    version: '1568076536509' //为了更新 js 缓存，可忽略
});

layui.use(['layer', 'form', 'element', 'validate', 'ojbk'], function() {
    var $ = layui.jquery,
        layer = layui.layer,
        form = layui.form,
        element = layui.element,
        validate = layui.validate,
        ojbk = layui.ojbk;

    dataEcho();
    form.verify(validate);
    form.render();

    /*数据回显*/
    function dataEcho() {
        if (!!selectItemId){
            if (!!pid){
                var pidObj = JSON.parse(pid);
                $("#pid").val(pidObj.id);
            }
        }
    }

    form.on('submit(modify)', function () {
        //定义传参参数
        var postData = {};
        //获取页面参数
        var title = $("#title").val();
        postData['title'] = title;
        var pid = $("#pid").val();
        //判空
        if (ojbk.stringNoEmpty(pid)){
            postData['pid'] = pid;
        } else {
            postData['pid'] = "";
        }
        var itemValue = $("#itemValue").val();
        //判空
        if (ojbk.stringNoEmpty(itemValue)){
            postData['itemValue'] = itemValue;
        } else {
            postData['itemValue'] = "";
        }
        var sort = $("#sort").val();
        //判空
        if (ojbk.stringNoEmpty(sort)){
            postData['sort'] = sort;
        } else {
            postData['sort'] = "";
        }
        var description = $("#description").val();
        //判空
        if (ojbk.stringNoEmpty(description)){
            postData['description'] = description;
        } else {
            postData['description'] = "";
        }

        //调接口
        //不传id，为新增
        //传id，为修改
        if (selectItemId !== null){
            postData['id'] = selectItemId;
        }

        ojbk.postAjax('/admin/selectItem/create_update', postData, function (data) {
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
});