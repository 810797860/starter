layui.define(['jquery'], function(exports){
    var $ = layui.jquery;
    var obj = {
        /**
         * 封装get请求
         * @param url
         * @param callback
         */
        getAjax: function (url, callback) {
            $.ajax({
                type: 'get',
                url: url,
                contentType: 'application/json;charset=utf-8',
                dataType: 'json',
                success: callback
            });
        },
        /**
         * 封装post请求
         * @param url
         * @param data
         * @param callback
         */
        postAjax: function (url, data, callback) {
            $.ajax({
                type: 'post',
                url: url,
                contentType: 'application/json;charset=utf-8',
                dataType: 'json',
                data: JSON.stringify(data),
                success: callback
            });
        },
        /**
         * 封装post请求
         * @param url
         * @param data
         * @param callback
         */
        putAjax: function (url, data, callback) {
            $.ajax({
                type: 'put',
                url: url,
                contentType: 'application/json;charset=utf-8',
                dataType: 'json',
                data: JSON.stringify(data),
                success: callback
            });
        },
        /**
         * str判空
         * @param str
         * @returns {boolean}
         */
        stringNoEmpty: function (str) {
            if (str != null && str != "" && str != undefined) {
                return true;
            } else return false;
        },
        /**
         * 获取表单按钮的switch代码
         * @param buttons
         * @returns {string}
         */
        getSwitchStr: function (buttons) {
            var switchStr = "switch(obj.event){";
            for (var i = 0; i < buttons.length; i++){
                switchStr = switchStr + " case '" + buttons[i].icon + "': " + buttons[i].script + "break;";
            }
            switchStr = switchStr + "};";
            return switchStr;
        },
        /**
         * 从当前页面的url地址中获取参数数据
         * @returns {Object}
         */
        getRequest: function () {
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
    };
    //输出接口
    exports('ojbk', obj);
});