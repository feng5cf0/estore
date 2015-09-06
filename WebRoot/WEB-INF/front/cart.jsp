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
	
	function checkBoxIsSelected(){
		var ids = document.getElementsByName("cartIds");
		var count = 0;
		for(var i = 0;i<ids.length;i++){
			if(ids[i].checked){
				count++;
			}
		}
		
		if(count>0){
			return true;
		}else{
			alert("请选择需要结算的商品！");
			return false;
		}
	}
	
	function allMoney(i){
		if(document.getElementById("cbox"+i).checked){
		
			var nowMoney = document.getElementById("amount"+i).innerText;
			var allMoney = document.getElementById("allAmount").innerText;
			
			document.getElementById("allAmount").innerHTML = parseFloat(nowMoney)+parseFloat(allMoney);
			
			var nowTotal = document.getElementById("total"+i).innerText;
			var allTotal = document.getElementById("allTotal").innerText;
			var allTotal = document.getElementById("allTotal").innerText = parseInt(nowTotal) + parseInt(allTotal);
		}else{
		
			var nowMoney = document.getElementById("amount"+i).innerText;
			var allMoney = document.getElementById("allAmount").innerText;
			
			document.getElementById("allAmount").innerText = parseFloat(allMoney) - parseFloat(nowMoney);		
		
			var nowTotal = document.getElementById("total"+i).innerText;
			var allTotal = document.getElementById("allTotal").innerText;
			var allTotal = document.getElementById("allTotal").innerText = parseInt(allTotal) - parseInt(nowTotal);		
		}
	}
	function selectAll(){
		if(document.getElementById("allSelect").checked){
			var idList = document.getElementsByName("cartIds");
			for(var i = 0;i<idList.length;i++){
				idList[i].checked = true;
				allMoney(i+1);
			}
		}else{
			var idList = document.getElementsByName("cartIds");
			for(var i = 0;i<idList.length;i++){
				idList[i].checked = false;
			}
			document.getElementById("allAmount").innerText = "0.00";
			document.getElementById("allTotal").innerText = "0";
		}
	}
	function selectAll2(){
		if(document.getElementById("allSelect2").checked){
			var idList = document.getElementsByName("cartIds");
			for(var i = 0;i<idList.length;i++){
				idList[i].checked = true;
				allMoney(i+1);
			}
		}else{
			var idList = document.getElementsByName("cartIds");
			for(var i = 0;i<idList.length;i++){
				idList[i].checked = false;
			}
			document.getElementById("allAmount").innerText = "0.00";
		}
	}
	function deleteCarts(){
		var ids = document.getElementsByName("cartIds");
		var count = 0;
		for(var i = 0;i<ids.length;i++){
			if(ids[i].checked){
				count++;
			}
		}
		
		if(count>0){
			document.cartForm.action = "${basePath}front/cartFrontAction!deleteCart.action";
			document.cartForm.submit();
		}else{
			alert("请选择需要删除的商品！");
			return false;
		}	
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
			<a href="front/newProductAction!getByCondition.action"  style="width:60px;"><s:property value="getText('index.newgoods')"/></a><img src="images/nav_line.png" width="2" height="33"/>
			<a href="front/onsaleFrontAction!prepare.action"  style="width:60px;"><s:property value="getText('index.onsale')"/></a><img src="images/nav_line.png" width="2" height="33"/>
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
			<span>当前所在位置：购物车</span>
			<a class="btn" href="#">进入个人中心</a>
		</div>
		<div class="now-titlb">
			<h4>购物车</h4>
			<!--购物车列表开始-->
			<div class="shop-prolb">
				<form action="${basePath}front/cartFrontAction!toOrder.action" method="post" onsubmit="return checkBoxIsSelected();"
					name="cartForm">
					<h5>全部商品<span>15</span></h5>
					<div class="shop-prolb-tit">
						<div class="wid wid1"><input class="cbox" type="checkbox" onclick="selectAll2();" id="allSelect2"/> 全选</div>
						<div class="wid wid2">商品</div>
						<div class="wid wid3">属性</div>
						<div class="wid wid3">单价</div>
						<div class="wid wid3">是否促销</div>
						<div class="wid wid3">数量</div>
						<div class="wid wid3">金额</div>
						<div class="wid wid4">操作</div>
					</div>
					
					<c:forEach items="${cartList}"  var="item" varStatus="status">
						<div class="shop-prolb-body">
							<div class="wid wid1">
								<input class="cbox" type="checkbox" name="cartIds" value="${item.id}"
									id="cbox${status.count}" 
									onclick="allMoney(${status.count});"/>
							</div>
							<div class="wid wid2">
								<a href="${basePath}front/goodsDetailAction!prepare.action?goodsId=${item.goodsId}"><img class="pic1" src="images/new_pic2.png" width="56" height="56"/></a>
								<div class="txt1"><a href="${basePath}front/goodsDetailAction!prepare.action?goodsId=${item.goodsId}">${item.goods.goodsName}</a></div>
							</div>
							<div class="wid wid3" align="center">
								<div class="txt1">
									<c:if test="${item.goodsAttribute.attributeValue1 != null}">
										${item.goodsAttribute.attributeValue1.attributeValue}
									</c:if>
									<c:if test="${item.goodsAttribute.attributeValue2 != null}">
										/${item.goodsAttribute.attributeValue2.attributeValue}
									</c:if>
									<c:if test="${item.goodsAttribute.attributeValue3 != null}">
										/${item.goodsAttribute.attributeValue3.attributeValue}
									</c:if>
								</div>
							</div>
							<div class="wid wid3 monys" id="price${status.count}">
								<c:if test="${item.goodsAttribute.price != null}">
									<c:if test="${item.goods.onsale != null}">
										<f:formatNumber value="${item.goodsAttribute.price * 100 * item.goods.onsale.percent/100}" pattern="0.00"></f:formatNumber>
									</c:if>
									<c:if test="${item.goods.onsale == null}">
										${item.goodsAttribute.price}
									</c:if>
								</c:if>
								<c:if test="${item.goodsAttribute.price == null}">
									<c:if test="${item.goods.onsale != null}">
										<f:formatNumber value="${item.goods.goodsPrice * item.goods.onsale.percent}" pattern="0.00"></f:formatNumber> 
									</c:if>
									<c:if test="${item.goods.onsale == null}">
										${item.goods.goodsPrice}
									</c:if>
								</c:if>
							</div>
							<div class="wid wid3">
								<c:if test="${item.goods.onsale != null}">
									是
								</c:if>
								<c:if test="${item.goods.onsale == null}">
									否
								</c:if>
							</div>
							<div class="wid wid3" id="total${status.count}">
								<!--<a class="num-jian" href="javascript:;"></a><input class="num-inp" type="text" value="${item.total}"/><a class="num-jian" href="javascript:;"></a>
							-->
								${item.total}
							</div>
							<div class="wid wid3 monys" id="amount${status.count}">
								<c:if test="${item.goodsAttribute.price != null}">
									<c:if test="${item.goods.onsale != null}">
										<f:formatNumber value="${item.goodsAttribute.price*item.goods.onsale.percent*item.total}" pattern="0.00"></f:formatNumber>
									</c:if>
									<c:if test="${item.goods.onsale == null}">
										<f:formatNumber value="${item.goodsAttribute.price * item.total}" pattern="0.00"></f:formatNumber>
									</c:if>
								</c:if>
								<c:if test="${item.goodsAttribute.price == null}">
									<c:if test="${item.goods.onsale != null}">
										<f:formatNumber value="${item.goods.goodsPrice * item.goods.onsale.percent*item.total}" pattern="0.00"></f:formatNumber> 
									</c:if>
									<c:if test="${item.goods.onsale == null}">
										<f:formatNumber value="${item.goods.goodsPrice*item.total}" pattern="0.00"></f:formatNumber>
									</c:if>
								</c:if>
							</div>
							<div class="wid wid4">
								<p><a href="${basePath}front/cartFrontAction!deleteCart.action?cartIds=${item.id}">删除</a></p>
								<p><a href="${basePath}front/cartFrontAction!addFavorite.action?cartId=${item.id }&goodsId=${item.goodsId}">移入收藏夹</a></p>
							</div>
						</div>
					</c:forEach>
					
					<!--结算开始-->
					<div class="shop-end">
						<div class="end-left">
							<input class="cbox" type="checkbox" onclick="selectAll();" id="allSelect"/>
							<span>全选</span>
							<a class="a1" href="Javascript:deleteCarts();">删除</a>
						</div>
						<div class="end-right">
							<span class="num1">已选<b id="allTotal">0</b>件商品</span>
							<span>合计（不含运费）：</span><span class="mon1">￥</span><span class="mon1" id="allAmount">0.00</span>
							<input class="submit-btn" type="submit" value="去结算"/>
						</div>
					</div>
					<!--结算结束-->
				</form>
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
