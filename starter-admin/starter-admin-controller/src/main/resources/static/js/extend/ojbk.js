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
        }
    };
    //输出接口
    exports('ojbk', obj);
});