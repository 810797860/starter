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

    dynamicDisabled();
    form.verify(validate);
    form.render();

    form.on('submit(modify)', function () {
        //定义传参参数
        var postData = {};
        //获取页面参数
        var title = $("#title").val();
        postData['title'] = title;
        var collection = $("#collection").val();
        postData['collection'] = collection;
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
        if (formId !== null){
            postData['id'] = formId;
        }

        ojbk.postAjax('/admin/form/create_update', postData, function (data) {
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

    function dynamicDisabled() {
        //判断是新增还是修改
        if (!!formId){
            $("#collection").attr("class", "layui-input layui-disabled");
        } else {
            $("#collection").attr("class", "layui-input");
        }
    }
});