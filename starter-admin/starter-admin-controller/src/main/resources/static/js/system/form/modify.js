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
        var title = $("#title").val();
        postData['title'] = title;
        var collection = $("#collection").val();
        postData['collection'] = collection;
        var description = $("#description").val();
        //判空
        if (StringNoEmpty(description)){
            postData['description'] = title;
        }

        //调接口
        $.ajax({
            type: 'post'
            ,url: '/admin/form/create_update'
            ,contentType: 'application/json;charset=utf-8'
            ,dataType: 'json'
            ,data: JSON.stringify(postData)
            ,success: function (data) {
                switch (data.code){
                    case 200:
                        parent.tools.refresh();
                        //关闭该窗口
                        var index = parent.layer.getFrameIndex(window.name);
                        parent.layer.close(index);
                        break;
                }
            }
        })
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