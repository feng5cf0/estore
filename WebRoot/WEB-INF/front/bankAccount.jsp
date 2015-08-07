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
<title>银行账户</title>
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
		<a href="front/pageJumpAction!toNewProduct"  style="width:60px;"><s:property value="getText('index.newgoods')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="front/pageJumpAction!toProductPromotion"  style="width:60px;"><s:property value="getText('index.onsale')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="front/pageJumpAction!toAboutUs"  style="width:60px;"><s:property value="getText('index.aboutus')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="front/pageJumpAction!toAfterSale"  style="width:60px;"><s:property value="getText('index.aftersale')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="front/pageJumpAction!toBankAccount"  style="width:60px;"><s:property value="getText('index.bankaccount')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="front/pageJumpAction!toOnLine"  style="width:60px;"><s:property value="getText('index.leavemessage')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="front/pageJumpAction!toCallUs"  style="width:60px;"><s:property value="getText('index.connectus')"/></a><img src="images/nav_line.png" width="2" height="33"/>
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
			<span>当前所在位置：银行账户</span>
			<!--<a class="btn" href="#">进入个人中心</a>-->
		</div>
		<div class="now-titlb" style="float:left; display:inline;">
			<h4>转账银行账户</h4>
			<!--购物车列表开始-->
			<div class="shop-prolb" style="float:left; display:inline;">
				<div class="yhzh_n">
					<span class="yhzh_nz"><img src="images/yh_03.gif" /></span>
					<span class="yhzh_ny">1111 2222 3333 4444 555</span>
				</div>
				<div class="yhzh_n">
					<span class="yhzh_nz"><img src="images/yh_05.gif" /></span>
					<span class="yhzh_ny">1111 2222 3333 4444 555</span>
				</div>
				<div class="yhzh_n">
					<span class="yhzh_nz"><img src="images/yh_07.gif" /></span>
					<span class="yhzh_ny">1111 2222 3333 4444 555</span>
				</div>
				<div class="yhzh_n">
					<span class="yhzh_nz"><img src="images/yh_12.gif" /></span>
					<span class="yhzh_ny">1111 2222 3333 4444 555</span>
				</div>
				<div class="yhzh_n">
					<span class="yhzh_nz"><img src="images/yh_13.gif" /></span>
					<span class="yhzh_ny">1111 2222 3333 4444 555</span>
				</div>
				<div class="yhzh_n">
					<span class="yhzh_nz"><img src="images/yh_15.gif" /></span>
					<span class="yhzh_ny">1111 2222 3333 4444 555</span>
				</div>
				<div class="yhzh_n">
					<span class="yhzh_nz"><img src="images/yh_20.gif" /></span>
					<span class="yhzh_ny">1111 2222 3333 4444 555</span>
				</div>
			</div>
			<!--购物车列表结束-->
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