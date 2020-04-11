//JavaScript代码区域
layui.config({
    version: '1568076536509' //为了更新 js 缓存，可忽略
});

layui.use(['form', 'layer', 'validate', 'ojbk'], function () {
    var $ = layui.jquery,
        form = layui.form,
        layer = layui.layer,
        validate = layui.validate,
        ojbk = layui.ojbk,
        $view = $('#ojbk-login');

    topLocation();
    initPage(form);
    initCode();

    //提交登录表单
    form.on('submit(login-submit)', function () {
        userLogin(layer);
    });

    //回车登录
    $('#ojbk-login').keydown(function (e) {
        if (e.keyCode === 13){
            initPage(form);
            userLogin(layer);
        }
    })
    
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

    /**
     * 初始化页面
     * @param form
     */
    function initPage(form) {
        form.verify(validate);
        form.render();
    }

    function userLogin(layer) {
        var loading = $(this).find('.layui-icon');
        if (loading.is(":visible")) return;
        loading.show();

        //获取表单提交的字段
        var username = $view.find('#username').val();
        var password = $view.find('#password').val();
        var verifyCode = $view.find('#verifyCode').val();

        var postData = {
            userName: username,
            password: password,
            captcha: verifyCode
        }

        ojbk.postAjax('/admin/login', postData, function(data){
            switch (data.code){
                case 200:
                    layer.msg("登录成功");
                    loading.hide();
                    initCode();
                    location.href = '/admin/index';
                    break;
            }
        });
        /*error: function (XMLHttpRequest, textStatus, errorThrown) {
            layer.msg("登录失败");
            loading.hide();
            initCode();
        }*/
    }

    function topLocation() {
        if (window != top){
            top.location.href = location.href;
        }
    }
});