//JavaScript代码区域
layui.config({
    version: '1568076536509' //为了更新 js 缓存，可忽略
});

layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function(){
    var laydate = layui.laydate //日期
        ,laypage = layui.laypage //分页
        ,layer = layui.layer //弹层
        ,table = layui.table //表格
        ,carousel = layui.carousel //轮播
        ,upload = layui.upload //上传
        ,element = layui.element //元素操作
        ,slider = layui.slider //滑块

    //向世界问个好
    layer.msg('Hello World');

    //监听Tab切换
    element.on('tab(demo)', function(data){
        layer.tips('切换了 '+ data.index +'：'+ this.innerHTML, this, {
            tips: 1
        });
    });

    //执行一个 table 实例
    table.render({
        elem: '#demo'
        ,height: 420
        ,url: '/demo/table/user/' //数据接口
        ,title: '用户表'
        ,page: true //开启分页
        ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
        ,totalRow: true //开启合计行
        ,cols: [[ //表头
            {type: 'checkbox', fixed: 'left'}
            ,{field: 'id', title: 'ID', width:80, sort: true, fixed: 'left', totalRowText: '合计：'}
            ,{field: 'username', title: '用户名', width:80}
            ,{field: 'experience', title: '积分', width: 90, sort: true, totalRow: true}
            ,{field: 'sex', title: '性别', width:80, sort: true}
            ,{field: 'score', title: '评分', width: 80, sort: true, totalRow: true}
            ,{field: 'city', title: '城市', width:150}
            ,{field: 'sign', title: '签名', width: 200}
            ,{field: 'classify', title: '职业', width: 100}
            ,{field: 'wealth', title: '财富', width: 135, sort: true, totalRow: true}
            ,{fixed: 'right', width: 165, align:'center', toolbar: '#barDemo'}
        ]]
    });

    //监听头工具栏事件
    table.on('toolbar(test)', function(obj){
        var checkStatus = table.checkStatus(obj.config.id)
            ,data = checkStatus.data; //获取选中的数据
        switch(obj.event){
            case 'add':
                layer.msg('添加');
                break;
            case 'update':
                if(data.length === 0){
                    layer.msg('请选择一行');
                } else if(data.length > 1){
                    layer.msg('只能同时编辑一个');
                } else {
                    layer.alert('编辑 [id]：'+ checkStatus.data[0].id);
                }
                break;
            case 'delete':
                if(data.length === 0){
                    layer.msg('请选择一行');
                } else {
                    layer.msg('删除');
                }
                break;
        };
    });

    //监听行工具事件
    table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
        var data = obj.data //获得当前行数据
            ,layEvent = obj.event; //获得 lay-event 对应的值
        if(layEvent === 'detail'){
            layer.msg('查看操作');
        } else if(layEvent === 'del'){
            layer.confirm('真的删除行么', function(index){
                obj.del(); //删除对应行（tr）的DOM结构
                layer.close(index);
                //向服务端发送删除指令
            });
        } else if(layEvent === 'edit'){
            layer.msg('编辑操作');
        }
    });

    //执行一个轮播实例
    carousel.render({
        elem: '#test1'
        ,width: '100%' //设置容器宽度
        ,height: 200
        ,arrow: 'none' //不显示箭头
        ,anim: 'fade' //切换动画方式
    });

    //将日期直接嵌套在指定容器中
    var dateIns = laydate.render({
        elem: '#laydateDemo'
        ,position: 'static'
        ,calendar: true //是否开启公历重要节日
        ,mark: { //标记重要日子
            '0-10-14': '生日'
            ,'2018-08-28': '新版'
            ,'2018-10-08': '神秘'
        }
        ,done: function(value, date, endDate){
            if(date.year == 2017 && date.month == 11 && date.date == 30){
                dateIns.hint('一不小心就月底了呢');
            }
        }
        ,change: function(value, date, endDate){
            layer.msg(value)
        }
    });

    //分页
    laypage.render({
        elem: 'pageDemo' //分页容器的id
        ,count: 100 //总页数
        ,skin: '#1E9FFF' //自定义选中色值
        //,skip: true //开启跳页
        ,jump: function(obj, first){
            if(!first){
                layer.msg('第'+ obj.curr +'页', {offset: 'b'});
            }
        }
    });

    //上传
    upload.render({
        elem: '#uploadDemo'
        ,url: '' //上传接口
        ,done: function(res){
            console.log(res)
        }
    });

    //滑块
    var sliderInst = slider.render({
        elem: '#sliderDemo'
        ,input: true //输入框
    });

    //底部信息
    var footerTpl = lay('#footer')[0].innerHTML;
    lay('#footer').html(layui.laytpl(footerTpl).render({}))
        .removeClass('layui-hide');
});