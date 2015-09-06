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
<title>个人中心-查看全部订单</title>
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
			<a href="${basePath}front/newProductAction!getByCondition.action"  style="width:60px;"><s:property value="getText('index.newgoods')"/></a><img src="images/nav_line.png" width="2" height="33"/>
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
		<!--个人中心内容开始-->
		<div class="now-tit">
			<span>当前所在位置：<a href="#">个人中心</a><span> &gt; </span>全部订单</span>
			<a class="btn" href="#">返回个人中心</a>
		</div>
		<div class="now-titlb center-con">
			<!--我的订单开始-->
			<div class="white-conbg">
				<div class="order-cxtit" style="background:#f4f4f4">
					<h4 style="color:#ff4400">全部订单</h4>
					<div class="ssk">
						<input class="inp" style="background:#fff" type="text" placeholder="您可以输入订单号查询"/>
						<input class="chaxun-btn" type="submit" value="查询"/>
					</div>
				</div>
				<!--我的订单列表开始-->
				<div class="my-orderlb">
					<span class="wid wid1">收件人</span>
					<span class="wid wid2">联系电话</span>
					<span class="wid wid3">
						<select>
							<option>最近三个月</option>
							<option>最近二个月</option>
							<option>最近一个月</option>
						</select>
					</span>
					<span class="wid wid3">
						<select>
							<option>全部状态</option>
							<option>待付款</option>
							<option>已完成</option>
						</select>
					</span>
					<span class="wid">操作</span>
				</div>
				
				<c:forEach items="${orderList}" var="item" >
					<div class="my-orderlb my-orderlb2">
						订单编号：<span style="color:#0160b2">${item.id}</span>
					</div>
					<div class="shop-prolb-body my-orderlb3">
						<div class="wid wid2">
							<div class="txt1">${item.address.linkmanName}</div>
						</div>
						<div class="wid wid3">${item.address.linkmanPhone}</div>
						<div class="wid wid3" style="color:#999">
							<f:formatDate value="${item.createTime}" pattern="yyyy-MM-dd"/>
							<br/><f:formatDate value="${item.createTime}" pattern="HH:mm:ss"/>
						</div>
						<c:if test="${item.status == 1}">
							<div class="wid wid3 monys">等待付款</div>
						</c:if>
						<c:if test="${item.status == 2}">
							<div class="wid wid3 monys" style="color:#999">待发货</div>
						</c:if>
						<div class="wid wid4" style="margin-left:2%">
							<c:if test="${item.status == 1}">
								<p><a href="${basePath}front/orderFrontAction!toPay.action?orderId=${item.id}">付款</a></p>
								<p><a href="${basePath}front/orderFrontAction!delete.action?orderId=${item.id}">取消订单</a></p>
							</c:if>
							<c:if test="${item.status == 2}">
								<p><a href="javascript:alert('已提醒商家发货！');">提醒发货</a></p>
							</c:if>
						</div>
					</div>
					<!--
					<c:forEach items="${item.cartSet}" var="cart">
						<div class="shop-prolb-body my-orderlb3">
							<div class="wid wid2">
								<a href="#"><img class="pic1" src="images/new_pic2.png" width="56" height="56"/></a>
								<div class="txt1"><a href="#">${cart.goods.goodsName}</a></div>
							</div>
							<div class="wid wid3">${item.address.linkmanName}</div>
							<div class="wid wid3" style="color:#999">2015-7-14 <br/>15:56:42</div>
						</div>
					</c:forEach>
				-->
				</c:forEach>
				<!--
				<div class="my-orderlb my-orderlb2">
					订单编号：<span style="color:#0160b2">98526545553</span>
				</div>
				<div class="shop-prolb-body my-orderlb3">
					<div class="wid wid2">
						<a href="#"><img class="pic1" src="images/new_pic2.png" width="56" height="56"/></a>
						<div class="txt1"><a href="#">防盗门锁 防盗门锁防盗门锁盗门锁防盗门盗门锁防盗门</a></div>
					</div>
					<div class="wid wid3">小王</div>
					<div class="wid wid3">￥99.00</div>
					<div class="wid wid3" style="color:#999">2015-7-14 <br/>15:56:42</div>
					<div class="wid wid3 monys">等待付款</div>
					<div class="wid wid4" style="margin-left:2%">
						<p><a href="#">付款</a></p>
						<p><a href="#">查看</a></p>
						<p><a href="#">取消订单</a></p>
					</div>
				</div>
				<div class="shop-prolb-body my-orderlb3">
					<div class="wid wid2">
						<a href="#"><img class="pic1" src="images/new_pic2.png" width="56" height="56"/></a>
						<div class="txt1"><a href="#">防盗门锁 防盗门锁防盗门锁盗门锁防盗门盗门锁防盗门</a></div>
					</div>
					<div class="wid wid3">小王</div>
					<div class="wid wid3">
						<p style="text-decoration:line-through;color:#999">￥105.00</p>
						<p>￥69.00</p>
						<p style="margin-top:5px"><span class="low-price">卖家降价</span></p>
					</div>
					<div class="wid wid3" style="color:#999">2015-7-14 <br/>15:56:42</div>
					<div class="wid wid3" style="color:#999">已完成</div>
					<div class="wid wid4" style="margin-left:2%">
						<p><a href="#">付款</a></p>
						<p><a href="#">查看</a></p>
						<p><a href="#">取消订单</a></p>
					</div>
				</div>
				--><!--我的订单列表结束-->
			</div>
			<!--我的订单结束-->
			<!--换页样式-->
			<!--分页
			<div class="total-huanye" style="margin-bottom:40px">
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
			-->
			<!--猜您喜欢开始-->
			<div class="white-conbg" style="position:relative">
				<div class="order-cxtit">
					<h4>猜您喜欢</h4>
				</div>
				<div class="mysc-lb">
					<a href="#" class="lbtn"></a><a href="#" class="rbtn"></a>
					<div class="mysc-lbwk">
						<c:forEach items="${goodsList}" var="item">
							<div class="prolb-showlb prolb-showlb2">
								<a href="${basePath}front/goodsDetailAction!prepare?goodsId=${item.id}"><img src="images/new_pic1.png" width="164"/></a>
								<h5>${item.goodsName}</h5>
								<div class="txt1">
									<a href="front/productPromotionAction!toYHQ">${item.goodsDescription}</a>
								</div>
								<div class="money"><span style="font:bold 13px Arial, Helvetica, sans-serif">￥</span>${item.goodsPrice}</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<!--猜您喜欢结束-->
		</div>
		<!--个人中心内容结束-->
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