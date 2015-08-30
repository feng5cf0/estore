<%@page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html >
<head>
<%@include file="/frontHeadDeclare.jsp"%>
<link rel="stylesheet" type="text/css" href="css/default.css"/>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/kefu.js"></script>
<script src="js/lrtk.js"></script>

	<script type="text/javascript">
		function byBrand(brandId){
			window.location.href = "${basePath }front/goodsSearchAction!getByBrand.action?brand.id="+brandId;
		}
		function byPrice(priceId){
			window.location.href = "${basePath }front/goodsSearchAction!getByPrice.action?price="+priceId;
		}
		function byCategory(categoryCode){
			window.location.href = "${basePath }front/goodsSearchAction!getByCategory.action?category.categoryCode="+categoryCode;
		}
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
			<span>当前所在位置：</span>
			<a href="#">首页</a>
			<c:if test="${not empty sessionScope.goodsCondition.category}">
				<span>&gt;</span>${sessionScope.goodsCondition.category.categoryName}
			</c:if>
			<c:if test="${not empty sessionScope.goodsCondition.brand}">
				<span>&gt;</span>${sessionScope.goodsCondition.brand.brandName}
			</c:if>
		</div>
		<div class="now-titlb">
			<h4>
				<!--
					汽车、摩托车遥控拷贝器
				-->
				<span>搜到<b><s:property value="goodsList.size()"/></b>件最新产品</span></h4>
			<div style="padding:0px 0px 20px 0px" >
				<div class="now-titlb-sy">
					<span class="sy-tit">品牌：</span>
					<span class="sy-lb">
						<c:if test="${empty sessionScope.goodsCondition.brand}">
							<a href="javascript:byBrand(0);" class="hov">不限</a>
							<c:forEach items="${brandList}" var="item">
								<a href="javascript:byBrand(${item.id});">${item.brandName }</a>
							</c:forEach>
						</c:if>
						<c:if test="${not empty sessionScope.goodsCondition.brand}">
							<a href="javascript:byBrand(0);">不限</a>
							<c:forEach items="${brandList}" var="item">
								<c:if test="${item.id == sessionScope.goodsCondition.brand.id}">
									<a href="javascript:byBrand(${item.id});" class="hov">${item.brandName }</a>
								</c:if>
								<c:if test="${item.id != sessionScope.goodsCondition.brand.id}">
									<a href="javascript:byBrand(${item.id});">${item.brandName }</a>
								</c:if>
							</c:forEach>
						</c:if>
					</span>
				</div>
				<div class="now-titlb-sy">
					<span class="sy-tit">价格：</span>
					<span class="sy-lb">
						<c:if test="${empty sessionScope.goodsCondition.price}">
							<a class="hov" href="javascript:byPrice(0);">不限</a>
							<a href="javascript:byPrice(1);">0-50元</a>
							<a href="javascript:byPrice(2);">50-100元</a>
							<a href="javascript:byPrice(3);">100元以上</a>
						</c:if>
						<c:if test="${not empty sessionScope.goodsCondition.price}">
							<c:if test="${sessionScope.goodsCondition.price == 0}">
								<a href="javascript:byPrice(0);" class="hov">不限</a>
							</c:if>
							<c:if test="${sessionScope.goodsCondition.price != 0}">
								<a href="javascript:byPrice(0);">不限</a>
							</c:if>
							<c:if test="${sessionScope.goodsCondition.price == 1}">
								<a href="javascript:byPrice(1);" class="hov">0-50元</a>
							</c:if>
							<c:if test="${sessionScope.goodsCondition.price != 1}">
								<a href="javascript:byPrice(1);">0-50元</a>
							</c:if>
							<c:if test="${sessionScope.goodsCondition.price == 2}">
								<a href="javascript:byPrice(2);" class="hov">50-100元</a>
							</c:if>
							<c:if test="${sessionScope.goodsCondition.price != 2}">
								<a href="javascript:byPrice(2);">50-100元</a>
							</c:if>
							<c:if test="${sessionScope.goodsCondition.price == 3}">
								<a href="javascript:byPrice(3);" class="hov">100元以上</a>
							</c:if>
							<c:if test="${sessionScope.goodsCondition.price != 3}">
								<a href="javascript:byPrice(3);" >100元以上</a>
							</c:if>
						</c:if>
					</span>
				</div>
				<div class="now-titlb-sy">
					<span class="sy-tit">类别：</span>	
					<span class="sy-lb">
						<c:if test="${empty sessionScope.goodsCondition.category}">
							<a href="javascript:byCategory('0');" class="hov">不限</a>
							<c:forEach items="${categoryList2}" var="citem">
								<a href="javascript:byCategory('${citem.categoryCode}');">${citem.categoryName }</a>
							</c:forEach>
						</c:if>
						<c:if test="${not empty sessionScope.goodsCondition.category}">
							<a href="javascript:byCategory('0');">不限</a>
							<c:forEach items="${categoryList2}" var="citem">
								<c:if test="${citem.categoryCode == sessionScope.goodsCondition.category.categoryCode}">
									<a href="javascript:byCategory('${citem.categoryCode}');" class="hov">${citem.categoryName }</a>
								</c:if>
								<c:if test="${citem.categoryCode != sessionScope.goodsCondition.category.categoryCode}">
									<a href="javascript:byCategory('${citem.categoryCode}');">${citem.categoryName }</a>
								</c:if>
							</c:forEach>
						</c:if>
					</span>
				</div>
			</div>
		</div>
		<!--当前所在位置结束-->
		<!--头部切换开始-->
		<!--<div class="procx-tit">
			<a class="hov" href="#">限时限量</a>
			<a href="#">优惠券</a>
			<a href="#">团购</a>
			<a href="#">满立减</a>
		</div>-->
		<div class="procx-px">
			<span>排序：</span>
			<a class="px-txt hov" href="#">默认</a>
			<a class="px-txt" href="#">按价格</a>
			<a class="px-txt" href="#">按销量</a>
			<div class="huanye1">
				<a class="l-jt" href="#"></a>
				<span class="num">1</span>/32
				<a class="r-jt" href="#"></a>
			</div>
		</div>
		<!--头部切换结束-->
		
		<!--产品列表开始-->
		<div class="new-prolb-wk">
			<c:forEach items="${goodsList}" var="item">
				<div class="prolb-showlb prolb-showlb2">
					<a href="${basePath}front/goodsDetailAction!prepare.action?goodsId=${item.id}"><img src="/a.jsp" width="188" height="175" alt=""/></a>
					<h4><a href="${basePath}front/goodsDetailAction!prepare.action?goodsId=${item.id}">${item.goodsName}</a></h4>
					<div class="txt1">
						<a href="${basePath}front/goodsDetailAction!prepare.action?goodsId=${item.id}">描述：${item.goodsDescription}</a>
					</div>
					<div class="money"><span style="font:bold 13px Arial, Helvetica, sans-serif">价格： ${item.goodsPrice}</span></div>
				</div>
			</c:forEach>
			<div style="clear:both"></div>
		</div>
		<!--产品列表结束-->
		
		<!--换页样式-->
		<!--<div class="total-huanye">
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
		--><!-- 分页结束 -->
		
		<!--<div class="huanye2">
			<a class="page-up" href="#"></a>
			<a href="#">1</a>
			<a class="hov" href="#">2</a>
			<a href="#">3</a>
			<a class="page-down" href="#"></a>
		</div>-->
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
























