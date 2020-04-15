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
        var userName = $("#userName").val();
        postData['userName'] = userName;
        var account = $("#account").val();
        postData['account'] = account;
        var password = $("#password").val();
        postData['password'] = password;
        var phone = $("#phone").val();
        var email = $("#email").val();
        //判空
        if (ojbk.stringNoEmpty(phone)){
            postData['phone'] = phone;
        } else {
            postData['phone'] = "";
        }
        if (ojbk.stringNoEmpty(email)){
            postData['email'] = email;
        } else {
            postData['email'] = "";
        }

        //调接口
        //不传id，为新增
        //传id，为修改
        if (userId !== null){
            postData['id'] = userId;
        }

        ojbk.postAjax('/admin/user/create_update', postData, function (data) {
            switch (data.code) {
                case 200:
                    parent.tools.refresh();
                    //关闭该窗口
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(index);
                    layer.msg("新增成功");
                    break;
            }
        });
    });
});