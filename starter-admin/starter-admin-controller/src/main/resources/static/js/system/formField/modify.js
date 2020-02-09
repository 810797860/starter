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
        formId = $('#formId').val(),
        formFieldId = $('#formFieldId').val();

    dataEcho();
    form.verify(validate);
    form.render();

    /**
     * 给字段类型显示子类型
     */
    function echoSubtype(parentId) {
        //给字段类型显示子类型
        var fieldTypeDom = $("#fieldType")
            ,firstValue = -1;
        fieldTypeDom.empty();
        fieldTypeDom.append('<option value>请选择字段类型</option>');
        for (var i = 0; i < fieldTypes.length; i++){
            if (fieldTypes[i].pid == parentId){
                if (firstValue === -1){
                    //默认选第一项
                    firstValue = fieldTypes[i].id;
                }
                fieldTypeDom.append('<option value="' + fieldTypes[i].id + '">' + fieldTypes[i].title + '</option>');
            }
        }
        //默认选中第一项
        fieldTypeDom.val(firstValue);
    }

    /**
     * 数据回显
     */
    function dataEcho() {

        //给显示类型显示父类型
        var showTypeDom = $("#showType");
        for (var i = 0; i < fieldTypes.length; i++){
            if (fieldTypes[i].pid === 100101){
                showTypeDom.append('<option value="' + fieldTypes[i].id + '">' + fieldTypes[i].title + '</option>');
            }
        }

        if (!!showType) {
            var showTypeObj = JSON.parse(showType);
            var showTypeId = showTypeObj.id;
            echoSubtype(showTypeId);
        }

        //修改的时候数据回显
        if (!!formId) {
            //如果显示类型不为空时
            if (!!showType){
                var showTypeObj = JSON.parse(showType);
                showTypeDom.val(showTypeObj.id);
            }
            //如果字段类型不为空时
            if (!!fieldType){
                var fieldTypeObj = JSON.parse(fieldType);
                $("#fieldType").val(fieldTypeObj.id);
            }
        }

        //复选框回显
        if (required === true){
            $("#required").attr('checked', true);
        }
    }

    form.on('select(echo)', function (data) {
        echoSubtype(data.value);
        form.render('select');
    })

    form.on('submit(modify)', function () {
        //定义传参参数
        var postData = {};
        //获取页面参数
        var title = $("#title").val();
        postData['title'] = title;
        var fieldName = $("#fieldName").val();
        postData['fieldName'] = fieldName;
        var showType = $("#showType").val();
        postData['showType'] = showType;
        var fieldType = $("#fieldType").val();
        postData['fieldType'] = fieldType;
        var defaultValue = $("#defaultValue").val();
        var required = $("#required").prop("checked");
        var description = $("#description").val();
        //判空
        if (StringNoEmpty(defaultValue)){
            postData['defaultValue'] = defaultValue;
        } else {
            postData['defaultValue'] = null;
        }
        postData['required'] = required;
        if (StringNoEmpty(description)){
            postData['description'] = description;
        } else {
            postData['description'] = "";
        }

        //调接口
        //不传id，为新增
        postData['formId'] = formId;
        if (formId === null) {
            $.ajax({
                type: 'post'
                , url: '/admin/formField/create_update'
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
                            break;
                    }
                }
            });
        } else {
            //传id，为修改
            postData['formId'] = formId;
            postData['id'] = formFieldId;
            $.ajax({
                type: 'post'
                , url: '/admin/formField/create_update'
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
                            break;
                    }
                }
            });
        }
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