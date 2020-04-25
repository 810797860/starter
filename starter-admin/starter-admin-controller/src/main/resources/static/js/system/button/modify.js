//JavaScript代码区域
layui.config({
    version: '1568076536509' //为了更新 js 缓存，可忽略
});

layui.use(['layer', 'form', 'element', 'validate', 'ojbk', 'layedit'], function() {
    var $ = layui.jquery,
        layer = layui.layer,
        form = layui.form,
        element = layui.element,
        validate = layui.validate,
        ojbk = layui.ojbk,
        layedit = layui.layedit;

    layedit.build('script', {
        tool: ['code']
    })

    form.verify(validate);
    form.render();

    form.on('submit(modify)', function () {
        //定义传参参数
        var postData = {};
        //获取页面参数
        var title = $("#title").val();
        postData['title'] = title;
        var className = $("#className").val();
        //判空
        if (ojbk.stringNoEmpty(className)){
            postData['className'] = className;
        } else {
            postData['className'] = null;
        }
        var icon = $("#icon").val();
        //判空
        if (ojbk.stringNoEmpty(icon)){
            postData['icon'] = icon;
        } else {
            postData['icon'] = null;
        }
        var num = $("#num").val();
        postData['num'] = num;
        var script = $("#script").val();
        //判空
        if (ojbk.stringNoEmpty(script)){
            postData['script'] = script;
        } else {
            postData['script'] = null;
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
        if (buttonId !== null){
            postData['id'] = buttonId;
        }
        ojbk.postAjax('/admin/button/create_update', postData, function (data) {
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