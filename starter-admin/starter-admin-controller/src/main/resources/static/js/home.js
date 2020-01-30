//JavaScript代码区域
layui.config({
    version: '1568076536509' //为了更新 js 缓存，可忽略
});

layui.use(['layer', 'form', 'element'], function(){
    var $ = layui.jquery,
        layer = layui.layer,
        form = layui.form,
        element = layui.element;

    $(document).ready(function() {
        var mouseX, mouseY;
        var ww = $(window).width();
        var wh = $(window).height();
        var traX, traY;
        $(document).mousemove(function(e) {
            mouseX = e.pageX;
            mouseY = e.pageY;
            traX = ((2 * mouseX) / 200) + 10;
            traY = ((2 * mouseY) / 200) + 30;
            $(".title").css({
                "background-position": traX + "%" + traY + "%"
            });
        });
    });
});