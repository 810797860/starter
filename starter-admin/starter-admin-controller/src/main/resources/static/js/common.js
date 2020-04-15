layui.config({
    base: '/js/extend/'      //自定义layui组件的目录
}).extend({ //设定组件别名
    ojbk: 'ojbk',
    validate: 'validate'
}).use(['jquery'], function(){
    var $ = layui.jquery;

    //单击行勾选checkbox事件
    $(document).on("click", ".layui-table-body table.layui-table tbody tr", function () {
        var index = $(this).attr('data-index');
        var tableBox = $(this).parents('.layui-table-box');
        //存在固定列
        if (tableBox.find(".layui-table-fixed.layui-table-fixed-l").length > 0) {
            tableDiv = tableBox.find(".layui-table-fixed.layui-table-fixed-l");
        } else {
            tableDiv = tableBox.find(".layui-table-body.layui-table-main");
        }
        var CheckLength = tableDiv.find("tr[data-index=" + index + "]").find(
            "td div.layui-form-checked").length;

        var checkCell = tableDiv.find("tr[data-index=" + index + "]").find(
            "td div.laytable-cell-checkbox div.layui-form-checkbox I");
        if (checkCell.length > 0) {
            checkCell.click();
        }
    });

    $(document).on("click", "td div.laytable-cell-checkbox div.layui-form-checkbox", function (e) {
        e.stopPropagation();
    });

    /**
     * 隐藏搜索框
     */
    $(".ojbk-search-hide-btn").click(function () {
        $("#ojbk-search").hide();
    });

    //按回车搜索
    $(".ojbk-keydown").keydown(function (e) {
        if (e.which == 13) {
            $(".ojbk-search-btn").click();
        }
    });
});