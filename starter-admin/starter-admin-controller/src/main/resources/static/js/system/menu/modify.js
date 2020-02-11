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
        validate = layui.validate,
        pid = getRequest().pid;

    console.log(pid);
    console.log(menuId);

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
        if (StringNoEmpty(url)){
            postData['url'] = url;
        } else {
            postData['url'] = "";
        }
        if (StringNoEmpty(icon)){
            postData['icon'] = icon;
        } else {
            postData['icon'] = "";
        }
        if (StringNoEmpty(description)){
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
        $.ajax({
            type: 'post'
            , url: '/admin/menu/create_update'
            , contentType: 'application/json;charset=utf-8'
            , dataType: 'json'
            , data: JSON.stringify(postData)
            , success: function (data) {
                switch (data.code) {
                    case 200:
                        //关闭该窗口
                        var index = parent.layer.getFrameIndex(window.name);
                        parent.layer.close(index);
                        break;
                }
            }
        });
    });

    /**
     * 从当前页面的url地址中获取参数数据
     * @returns {Object}
     */
    function getRequest() {
        var url = location.search; //获取url中"?"符后的字串
        var theRequest = new Object();
        if(url.indexOf("?") != -1) {
            var str = url.substr(1);
            strs = str.split("&");
            for(var i = 0; i < strs.length; i++) {
                theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
            }
        }
        return theRequest;
    }

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