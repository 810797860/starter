//JavaScript代码区域
layui.config({
    version: '1568076536509' //为了更新 js 缓存，可忽略
});

layui.use(['layer', 'form', 'element'], function(){
    console.log(roleMenus);
    console.log(userObj);
    var $ = layui.jquery,
        menuList = sortUp(roleMenus, 'sort'),
        layer = layui.layer,
        form = layui.form,
        element = layui.element;
    initializationMenu(menuList);
    //获取src值
    $(".main_left dd a").on("click",function(){
        var address =$(this).attr("data-src");
        $("iframe").attr("src",address);
    });
    //一下代码是根据窗口高度在设置iframe的高度
    var frame = $("#ojbk-right-body");

    var frameheight = $(window).height();
    console.log(frameheight);
    frame.css("height",frameheight);

    // 升序排序（从小到大，用于菜单）
    function sortUp(array, property) {
        return array.sort(function (a, b) {
            return a[property] - b[property];
        })
    }

    //初始化菜单
    function initializationMenu(menus) {
        var menuDom = $('.ojbk-nav');//菜单父级节点
        var TEMPS = menus;//无父级节点的菜单项
        //无父节点
        for (var i = 0, len = TEMPS.length; i < len; i++) {
            if (TEMPS[i].pid === 'undefined' || TEMPS[i].pid === null){
                menuDom.append('<li id="ojbk-nav-id-' + TEMPS[i].id + '" class="layui-nav-item"><a lay-href target title="' + TEMPS[i].name + '"><i class="layui-icon ' + TEMPS[i].icon + ' ojbk-icon"></i>' + TEMPS[i].name + '</a></li>');
            }
        }
        //有父节点
        for (var i = 0, len = TEMPS.length; i < len; i++){
            if (TEMPS[i].pid !== 'undefined' && TEMPS[i].pid !== null){
                //先定位父节点
                var parentDom = $('#ojbk-nav-id-' + TEMPS[i].pid);
                //判断有没有子节点的头
                var parentChildDom = $('#ojbk-nav-child-id-' + TEMPS[i].pid);
                if (parentChildDom.length === 0){
                    //添加该子节点的头
                    parentDom.append('<dl id="ojbk-nav-child-id-' + TEMPS[i].pid + '" class="layui-nav-child"><dd><a lay-href="' + TEMPS[i].url + '">' + TEMPS[i].name + '</a></dd></dl>');
                } else {
                    //继续添加子节点
                    parentChildDom.append('<dd><a lay-href="' + TEMPS[i].url + '">' + TEMPS[i].name + '</a></dd>');
                }
            }
        }
        element.init();
        element.render('nav');
    }
});