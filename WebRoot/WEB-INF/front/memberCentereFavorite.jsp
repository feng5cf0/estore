<%@page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="/headDeclare.jsp"%>
<%@include file="/tagDeclare.jsp" %>
<link rel="stylesheet" type="text/css" href="css/default.css"/>
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
</head>

<body>
	<!--顶部开始-->
	<jsp:include page="/WEB-INF/front/frontTop.jsp"></jsp:include>
	<!--顶部结束-->
	
	<!--nav区开始-->
	<div class="nav">
		<div class="nav-con">
			<div class="fenlei-ys" ><s:property value="getText('index.allcategory')"/></div>
			<a href="front/mainAction!toMain.action" style="width:40px;"><s:property value="getText('index.homepage')"/></a><img src="images/nav_line.png" width="2" height="33"/>
			<!--<a href="front/newProductAction!toNewProduct"  style="width:60px;"><s:property value="getText('index.newgoods')"/></a><img src="images/nav_line.png" width="2" height="33"/>
			--><a href="front/productPromotionAction!toProductPromotion"  style="width:60px;"><s:property value="getText('index.onsale')"/></a><img src="images/nav_line.png" width="2" height="33"/>
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
			<span>当前所在位置：<a href="#">个人中心</a><span> &gt; </span>产品收藏</span>
			<a class="btn" href="#">返回个人中心</a>
		</div>
		<div class="now-titlb">
			<h4>产品收藏</h4>
			<!--购物车列表开始-->
			<div class="shop-prolb">
				<h5>全部商品<span>15</span></h5>
				<div class="shop-prolb-tit">
					<div class="wid wid2">商品</div>
					<div class="wid wid3">单价</div>
					<div class="wid wid3">单重量</div>
					<div class="wid wid4">操作</div>
				</div>
				<c:forEach items="${favoriteList}" var="item">
					<div class="shop-prolb-body">
						<div class="wid wid2">
							<a href="#"><img class="pic1" src="images/new_pic2.png" width="56" height="56"/></a>
							<div class="txt1"><a href="${basePath}front/goodsDetailAction!prepare.action?goodsId=${item.goods.id}"></a>${item.goods.goodsName}</div>
						</div>
						<div class="wid wid3 monys">${item.goods.goodsPrice}</div>
						<div class="wid wid3">100.00克</div>
						<div class="wid wid4">
							<p><a href="${basePath}front/favoriteAction!delete.action?favoriteId=${item.id}">移出收藏夹</a></p>
						</div>
					</div>
				</c:forEach>
				<!--结算开始-->
				<!--<div class="shop-end">
					<div class="end-left">
						<input class="cbox" type="checkbox"/>
						<span>全选</span>
						<a class="a1" href="#">删除</a>
						<a class="a1" href="#">移出收藏夹</a>
					</div>
					<div class="end-right">
						<span class="num1">已选<b>12</b>件商品</span>
						<span class="num1">总重量<b>100</b>克</span>
						<span>合计（不含运费）：</span><span class="mon1">￥599.00</span>
						<input class="submit-btn" type="submit" value="去结算"/>
					</div>
				</div>
				--><!--结算结束-->
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