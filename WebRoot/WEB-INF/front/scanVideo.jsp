<%@page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="/headDeclare.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/default.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/kefu.js"></script>
<script src="js/lrtk.js"></script> 
<script type="text/javascript">
	$(function(){
		$(".pro-left1-li").each(function(i){
			var top = $(this).offset().top;
			$(".pro-left1-lilb:eq("+i+")").css({"top":192-top});
		})//左栏划上效果
		
		//二维码划上效果
		$(".ewm-txt").hover(function(){
			$(".ewm-pic").show();
		},function(){
			$(".ewm-pic").hide();
		})
	})
</script>
<title>售后服务-视频观看</title>
</head>

<body>
<!--顶部开始-->
	<jsp:include page="/WEB-INF/front/frontTop.jsp"></jsp:include>
<!--顶部区结束-->
<!--nav区开始-->
<div class="nav">
	<div class="nav-con">
		<div class="fenlei-ys" ><s:property value="getText('index.allcategory')"/></div>
		<a href="front/mainAction!toMain.action" style="width:40px;"><s:property value="getText('index.homepage')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="front/newProductAction!toNewProduct"  style="width:60px;"><s:property value="getText('index.newgoods')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="front/productPromotionAction!toProductPromotion"  style="width:60px;"><s:property value="getText('index.onsale')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="front/aboutUsAction!toAboutUs"  style="width:60px;"><s:property value="getText('index.aboutus')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="front/afterSaleAction!toAfterSale"  style="width:60px;"><s:property value="getText('index.aftersale')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="front/bankAccountAction!toBankAccount"  style="width:60px;"><s:property value="getText('index.bankaccount')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="front/onlineMsgAction!toOnLine"  style="width:60px;"><s:property value="getText('index.leavemessage')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="front/callUsAction!toCallUs"  style="width:60px;"><s:property value="getText('index.connectus')"/></a><img src="images/nav_line.png" width="2" height="33"/>
	</div>
</div>
<!--nav区域结束-->

<!--内容区开始-->
<div class="total-con">
	<!--左侧列表开始-->
	<div class="prolb-left">
		<!-- 类别开始 -->
		<div>
			<jsp:include page="/WEB-INF/front/frontCategory.jsp"></jsp:include>
		</div>
		<!-- 类别结束 -->
		<!--品牌产品开始-->
		<div class="pp-pro">
			<jsp:include page="/WEB-INF/front/frontBrand.jsp"></jsp:include>
		</div>
		<!--品牌产品结束-->
		<!--网店链接开始-->
		<div class="pp-pro">
			<jsp:include page="/WEB-INF/front/frontShopLink.jsp"></jsp:include>
		</div>
		<!--网店链接结束-->
	</div>
	<!--左侧列表结束-->
	<!--右侧列表开始-->
	<div class="prolb-right prolb-right2">
		<!--当前所在位置开始-->
		<div class="now-tit">
			<span>当前所在位置：<a href="#">首页</a><span> > </span>售后服务</span>
		</div>
		<div class="now-titlb">
			<h4>售后服务</h4>
			<!--售后服务内容开始-->
			<div class="about-us">
				<div class="sh-serve-tit">
					<a href="front/afterSaleAction!toAfterSale">技术文章</a>
					<a class="tit" href="front/afterSaleAction!toDownloadCenter">下载中心</a>
					<a class="tit hov" class="tit" href="front/afterSaleAction!toScanVideo">视频观看</a>
					<div class="search">
						<input class="inp" type="text" placeholder="请输入关键字..."/><input class="sub" type="submit" value="搜索"/>
					</div>
				</div>
                <!--循环列表-->
				<div class="sh-serve-jslb movie-lb">
					<a href="#"><img class="movie-pic" src="images/movie_pic.png" width="67" height="67"/></a>
					<div class="movie-txt">
						<p class="pbt"><a class="bt" href="#">视频标题</a></p>
						<p class="time2">2015-7-14 15:56:45</p>
					</div>
				</div>
                 <!--循环列表-->
				<div class="sh-serve-jslb movie-lb">
					<a href="#"><img class="movie-pic" src="images/movie_pic.png" width="67" height="67"/></a>
					<div class="movie-txt">
						<p class="pbt"><a class="bt" href="#">视频标题</a></p>
						<p class="time2">2015-7-14 15:56:45</p>
					</div>
				</div>
                 <!--循环列表-->
				<div class="sh-serve-jslb movie-lb">
					<a href="#"><img class="movie-pic" src="images/movie_pic.png" width="67" height="67"/></a>
					<div class="movie-txt">
						<p class="pbt"><a class="bt" href="#">视频标题</a></p>
						<p class="time2">2015-7-14 15:56:45</p>
					</div>
				</div>
				<!--换页样式-->
				<div class="total-huanye">
					<a class="pre" href="#"></a>
					<a class="num hov" href="#">1</a>
					<a class="num" href="#">2</a>
					<a class="num" href="#">3</a>
					<a class="num" href="#">4</a>
					<a class="num" href="#">5</a>
					<span>...</span>
					<a class="next" href="#"></a>
					<span>共100页，到第<input type="text" class="inp" value="1"/>页</span>
					<input class="sub" type="submit" value="确定"/>
				</div>
				<!--<div class="huanye2">
					<a class="page-up" href="#"></a>
					<a href="#">1</a>
					<a class="hov" href="#">2</a>
					<a href="#">3</a>
					<a class="page-down" href="#"></a>
				</div>-->
			</div>
			<!--售后服务内容结束-->
		</div>
		<!--当前所在位置结束-->
	</div>
	<!--右侧列表结束-->
	<div style="clear:both"></div>
</div>
<!--内容区结束-->
<jsp:include page="/WEB-INF/front/frontBottom.jsp"></jsp:include>
<!--底部结束-->
<!--客服代码开始-->
<jsp:include page="/WEB-INF/front/frontService.jsp"></jsp:include>
<!--客服代码结束-->


</body>
</html>