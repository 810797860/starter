//JavaScript代码区域
layui.config({
    version: '1568076536509' //为了更新 js 缓存，可忽略
});

layui.extend({
    validate: '/js/extend/validate'
}).use(['form', 'layer', 'validate'], function (form, layer) {
    var $ = layui.jquery,
        validate = layui.validate,
        $view = $('#ojbk-login');
    form.verify(validate);
    form.render();
    initCode();

    //提交登录表单
    form.on('submit(login-submit)', function (data) {
        var loading = $(this).find('.layui-icon');
        if (loading.is(":visible")) return;
        loading.show();

        //获取表单提交的字段
        var username = $view.find('#username').val();
        var password = $view.find('#password').val();
        var verifyCode = $view.find('#verifyCode').val();

        //判空
        if (username === ''){
            layer.msg("账号不能为空！");
            loading.hide();
            initCode();
            return;
        } else if (password === ''){
            layer.msg("密码不能为空！");
            loading.hide();
            initCode();
            return;
        } else if (verifyCode === ''){
            layer.msg("验证码不能为空！");
            loading.hide();
            initCode();
            return;
        }

        var postData = {
            userName: username,
            password: password,
            captcha: verifyCode
        }

        $.ajax({
            type: 'post',
            url: '/admin/login',
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            data: JSON.stringify(postData),
            success: function(data){
                switch (data.code){
                    case 200:
                        layer.msg("登录成功");
                        loading.hide();
                        initCode();
                        location.href = '/admin/index';
                        break;
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                layer.msg("登录失败");
                loading.hide();
                initCode();
            }
        });
    });

    /**
     * 初始化验证码
     */
    function initCode() {
        $view.find('#codeimg').attr("src", "/admin/kaptcha/default");
    }

    /**
     * 点击验证码图片事件
     */
    $view.find('#codeimg').on('click', function () {
        initCode();
    });
});