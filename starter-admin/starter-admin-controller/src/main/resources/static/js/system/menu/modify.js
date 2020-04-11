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
        ojbk = layui.ojbk,
        pid = ojbk.getRequest().pid;


    form.verify(validate);
    form.render();

    form.on('submit(modify)', function () {
        //定义传参参数
        var postData = {};
        //获取页面参数
        var name = $("#name").val();
        postData['name'] = name;
        var url = $("#url").val();
        var icon = $("#icon").val();
        var num = $("#num").val();
        postData['num'] = num;
        var description = $("#description").val();
        //判空
        if (ojbk.stringNoEmpty(url)){
            postData['url'] = url;
        } else {
            postData['url'] = "";
        }
        if (ojbk.stringNoEmpty(icon)){
            postData['icon'] = icon;
        } else {
            postData['icon'] = "";
        }
        if (ojbk.stringNoEmpty(description)){
            postData['description'] = description;
        } else {
            postData['description'] = "";
        }

        //调接口
        postData['pid'] = pid;
        //不传id，为新增
        //传id，为修改
        if (menuId !== null){
            postData['id'] = menuId;
        }

        ojbk.postAjax('/admin/menu/create_update', postData, function (data) {
            switch (data.code) {
                case 200:
                    //关闭该窗口
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(index);
                    break;
            }
        });
    });
});