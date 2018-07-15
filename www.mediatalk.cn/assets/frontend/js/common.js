// JavaScript Document
    function divselect(divselectid,inputselectid) {
    var inputselect = $(inputselectid);
    $(divselectid+" cite").click(function(){
        var ul = $(divselectid+" ul");
        if(ul.css("display")=="none"){
            ul.slideDown("fast");
        }else{
            ul.hide();
        }
    });
    $(divselectid+" ul li a").click(function(){
        var txt = $(this).text();
        $(divselectid+" cite").html(txt);
        var value = $(this).attr("selectid");
        inputselect.val(value);
        $(divselectid+" ul").hide();
    });
};
$(function(){
    new divselect("#divselect","#inputselect");
//    下拉菜单
    $('.menu-toggle').hover(function () {
        $('.toggle-list').slideDown('fast');
    },function () {
        $('.toggle-list').hide();
    })

    $('.cooperation li').each(function (num) {
        if(num%5==4){
            $(this).css('border-right','0')
        }
    });

    $('.first-layer:even').addClass('box-even');

    $('.first-layer').hover(function () {
        $(this).addClass('first-layer-hover');
        $(this).find('.cate-toggle-nav').fadeIn('fast');

    },function () {
        $(this).removeClass('first-layer-hover');
        $(this).find('.cate-toggle-nav').hide();
    })



//教师单页
$(".teacher-page .tab-nav li").hover(function(){

		$(this).addClass("cur").siblings().removeClass("cur");
		
		var index=$(".teacher-page .tab-nav li").index(this);	
		$(".teacher-page .tab-wrap .module").eq(index).show().siblings().hide();
	});		

//购物车
$(".buy-table span.sel-w").click(function(){
	
	
	if($(this).hasClass("yes")){
		$(this).removeClass("yes").attr("checked",false);
	}else{
		$(this).addClass("yes").attr("checked",true);
	}
});

$(".buy-table span.sel-all").click(function(){
	if($(this).hasClass("yes")){
		$(this).removeClass("yes").attr("checked",false);
		$(this).parents("thead").siblings("tbody").find(".sel").removeClass("yes").attr("checked",false);
	}else{
		$(this).addClass("yes").attr("checked",true);
		$(this).parents("thead").siblings("tbody").find(".sel").addClass("yes").attr("checked",true);
	}
});

//课程单页
$(".chapter .title-btn").click(function(){
	$(this).parent(".title").siblings(".chapter-detail").toggle();
	$(this).toggleClass("cur");
});

$(".chapter .tit-btn").click(function(){
	$(this).parents(".module").find("ul.list").toggle();
	$(this).toggleClass("cur");
});


//合作伙伴
$(".partner .tab-nav li").click(function(){

    $(this).addClass("cur").siblings().removeClass("cur");
    
    var index=$(".partner .tab-nav li").index(this);    
    $(".partner .tab-wrap .module").eq(index).show().siblings().hide();
}); 




});