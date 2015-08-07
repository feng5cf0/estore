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
<title>关于我们</title>
</head>

<body>
<!--顶部开始-->
<jsp:include page="/WEB-INF/front/frontTop.jsp"></jsp:include>
<!--顶部结束-->
<!--nav区开始-->
<div class="nav">
	<div class="nav-con">
		<div class="fenlei-ys"><s:property value="getText('index.allcategory')"/></div>
		<a href="front/mainAction!toMain.action"><s:property value="getText('index.homepage')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="front/pageJumpAction!toNewProduct"><s:property value="getText('index.newgoods')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="front/pageJumpAction!toProductPromotion"><s:property value="getText('index.onsale')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="front/pageJumpAction!toAboutUs"><s:property value="getText('index.aboutus')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="front/pageJumpAction!toAfterSale"><s:property value="getText('index.aftersale')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="front/pageJumpAction!toBankAccount"  style="width:60px;"><s:property value="getText('index.bankaccount')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="front/pageJumpAction!toOnLine"><s:property value="getText('index.leavemessage')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="front/pageJumpAction!toCallUs"><s:property value="getText('index.connectus')"/></a><img src="images/nav_line.png" width="2" height="33"/>
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
			<span>当前所在位置：<a href="#">首页</a><span> > </span>关于我们</span>
		</div>
		<div class="now-titlb">
			<h4>关于我们</h4>
			<!--关于我们内容开始-->
			<div class="about-us">
				  <h5>鸿翔锁业</h5>
				  <p class="p1">平台上商铺众多，如果想分得一杯羹，卖家首先需要思考的是怎样让买家可以快速找到自己的店铺，即使货再好，买家搜索不到店铺怎么办？
				  <p class="p1">站在买家角度上考虑，大多买家都会选择一些服务功能更多的店铺，这样更好的保障了自己，特别是新手。买家的需求意味着市场空间，卖家怎样去承接这个需求点，抢先占住商机呢？</p>
				  <p class="p1">既然买家需要保障服务，店家可以顺着这个需求走，给自己的店铺开通服务保障体系，有了这些担保服务，买家就能放心拿货了。</p>
				  <div class="contact-fs">
				  		<p class="p2"><span>地址：</span>山东省 济南市</p>
						<p class="p2"><span>电话：</span>0531-8953414454</p>
						<p class="p2"><span>传真：</span>山东省 济南市</p>
						<p class="p2"><span>业务手机：</span>18668958975</p>
						<p class="p2"><span>网址：</span>www.wangzhi.com</p>
						<p class="p2"><span>投诉电话：</span>0831-4554454</p>
				  </div>
				  <div class="img-intr"><img src="images/zhizhao.png"/></div>
				  <h5>团队图片</h5>
				  <div class="team-pic">
				      <a class="l-btn" href="#"></a><a class="r-btn" href="#"></a>
					  <div class="pic-wk">
					      <ul class="pic-ul">
						      <li><img src="images/tuandui_pic1.png" width="160" height="160"/><p class="p5">拓展培训</p></li>
							  <li><img src="images/tuandui_pic1.png" width="160" height="160"/><p class="p5">拓展培训</p></li>
							  <li><img src="images/tuandui_pic1.png" width="160" height="160"/><p class="p5">拓展培训</p></li>
							  <li><img src="images/tuandui_pic1.png" width="160" height="160"/><p class="p5">拓展培训</p></li>
						  </ul>
					  </div>
				  </div>
			</div>
			<!--关于我们内容结束-->
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
