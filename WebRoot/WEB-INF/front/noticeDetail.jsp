<%@page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="/headDeclare.jsp"%>
<%@include file="/tagDeclare.jsp" %>
<link rel="stylesheet" type="text/css" href="css/default.css">
 <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/kefu.js"></script>
<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script> 
 <script type="text/javascript" src="js/member/memberModify.js?radom=473"></script>
 <script type="text/javascript" src="js/member/jsAddress.js?radom=113"></script>
<script src="js/lrtk.js"></script>
<script type="text/javascript">
	$(function(){
		$(".pro-left1-li").each(function(i){
			var top = $(this).offset().top;
			$(".pro-left1-lilb:eq("+i+")").css({"top":192-top});
		});//左栏划上效果
		
		//二维码划上效果
		$(".ewm-txt").hover(function(){
			$(".ewm-pic").show();
		},function(){
			$(".ewm-pic").hide();
		});
	});
</script>
<title>个人中心</title>
</head>

<body style="background:url(images/index_bg.jpg) repeat-x">
<!--顶部开始-->
	<jsp:include page="/WEB-INF/front/frontTop.jsp"></jsp:include>
<!--顶部区结束-->
<!-- nav区开始 -->
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
			<span>当前所在位置：<a href="front/mainAction!toMain.action">首页</a><span> > </span>公告详情</span>
		</div>
		<div class="now-titlb">
			<h4>公告详情</h4>
			<!--售后服务内容开始-->
			<div class="about-us">
                        
				  <h5>${notice.title }<span class="sjsj"><f:formatDate value="${notice.createTime }" pattern="yyyy-MM-dd HH:mm:ss" /></span></h5><hr />
				  <!-- <p class="p1">平台上商铺众多，如果想分得一杯羹，卖家首先需要思考的是怎样让买家可以快速找到自己的店铺，即使货再好，买家搜索不到店铺怎么办？
				  <p class="p1">站在买家角度上考虑，大多买家都会选择一些服务功能更多的店铺，这样更好的保障了自己，特别是新手。买家的需求意味着市场空间，卖家怎样去承接这个需求点，抢先占住商机呢？</p>
				  <p class="p1">既然买家需要保障服务，店家可以顺着这个需求走，给自己的店铺开通服务保障体系，有了这些担保服务，买家就能放心拿货了。既然买家需要保障服务，店家可以顺着这个需求走，给自己的店铺开通服务保障体系，有了这些担保服务，买家就能放心拿货了。既然买家需要保障服务，店家可以顺着这个需求走，给自己的店铺开通服务保障体系，有了这些担保服务，买家就能放心拿货了。既然买家需要保障服务，店家可以顺着这个需求走，给自己的店铺开通服务保障体系，有了这些担保服务，买家就能放心拿货了。既然买家需要保障服务，店家可以顺着这个需求走，给自己的店铺开通服务保障体系，有了这些担保服务，买家就能放心拿货了。</p> -->
                  <c:out value="${notice.content }" escapeXml="false"></c:out>      
			</div>
			<!--售后服务内容结束-->
		</div>
		<!--当前所在位置结束-->
	</div>
	<!--右侧列表开始-->
	<div style="clear:both"></div>
</div>
<!--内容区结束-->

<jsp:include page="/WEB-INF/front/frontBottom.jsp"></jsp:include>
<!--底部结束-->

<!--客服代码开始-->
<jsp:include page="/WEB-INF/front/frontService.jsp"></jsp:include>
<!--客服代码结束-->
<!-- 弹出框 -->

<!-- <div id="TcBox">
	<div class="filter-bg"></div>
	<div class="login-kua">
		<h3>标题文本<a class="close" href="#">×</a></h3>
		<div class="txt">警示的内容</div>
		<div class="sub"><input type="submit" value="确 定"/></div>
	</div>
</div> -->
</body>
</html>
























