//JavaScript代码区域
layui.config({
    version: '1568076536509' //为了更新 js 缓存，可忽略
});

layui.extend({
    validate: '/js/extend/validate'
}).use(['layer', 'form', 'element', 'validate'], function() {
    var $ = layui.jquery,
        layer = layui.layer,
        form = layui.form,
        element = layui.element,
        validate = layui.validate;

    form.verify(validate);
    form.render();

    form.on('submit(modify)', function () {
        //定义传参参数
        var postData = {};
        //获取页面参数
        var userName = $("#userName").val();
        postData['user_name'] = userName;
        var account = $("#account").val();
        postData['account'] = account;
        var password = $("#password").val();
        postData['password'] = password;
        var phone = $("#phone").val();
        var email = $("#email").val();
        //判空
        if (StringNoEmpty(phone)){
            postData['phone'] = phone;
        } else {
            postData['phone'] = "";
        }
        if (StringNoEmpty(email)){
            postData['email'] = email;
        } else {
            postData['email'] = "";
        }

        //调接口
        //新增
        $.ajax({
            type: 'post'
            , url: '/admin/user/create_update'
            , contentType: 'application/json;charset=utf-8'
            , dataType: 'json'
            , data: JSON.stringify(postData)
            , success: function (data) {
                switch (data.code) {
                    case 200:
                        parent.tools.refresh();
                        //关闭该窗口
                        var index = parent.layer.getFrameIndex(window.name);
                        parent.layer.close(index);
                        layer.msg("新增成功");
                        break;
                }
            }
        });
    });

    /**
     * str判空
     * @param str
     * @returns {boolean}
     * @constructor
     */
    function StringNoEmpty(str) {
        if (str != null && str != "" && str != undefined) {
            return true;
        } else return false;
    }
});