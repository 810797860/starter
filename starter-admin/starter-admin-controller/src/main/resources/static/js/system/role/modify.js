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
    
    form.verify(validate);
    form.render();

    form.on('submit(modify)', function () {
        //定义传参参数
        var postData = {};
        //获取页面参数
        var roleDesc = $("#roleDesc").val();
        postData['roleDesc'] = roleDesc;
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
        if (roleId !== null){
            postData['id'] = roleId;
        }

        ojbk.postAjax('/admin/role/create_update', postData, function (data) {
            switch (data.code) {
                case 200:
                    window.parent.location.replace("/admin/role/tabulation.html?menuId=177");
                    break;
            }
        });
    });
});