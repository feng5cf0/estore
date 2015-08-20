<%@page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html >
<head>
<%@include file="/frontHeadDeclare.jsp"%>
<link rel="stylesheet" type="text/css" href="css/default.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/kefu.js"></script>
<script src="js/lrtk.js"></script>
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
			<span>当前所在位置：</span><a href="#">首页</a><span> > </span>商品列表</a><span> > </span>汽车、摩托车遥控拷贝器</a>
		</div>
		<div class="now-titlb">
			<h4>汽车、摩托车遥控拷贝器<span>搜到<b>128</b>件最新产品</span></h4>
			<div style="padding:0px 0px 20px 0px" >
				<!--<div class="gaoji-sslb">
					<div class="gaoji-ss">
						<span class="ss-tit">关键词：</span>
						<input class="inp1" type="text" placeholder="请输入您要搜索的关键词..."/>
					</div>
					<div style="clear:both"></div>
				</div>
				<div class="gaoji-sslb">
					<div class="gaoji-ss">
						<span class="ss-tit">品牌：</span>
						<select class="inp1 inp2">
							<option>玥玛锁业</option>
							<option>品牌2</option>
							<option>品牌3</option>
							<option>品牌4</option>
						</select>
					</div>
					<div class="gaoji-ss" style="margin-left:78px">
						<span class="ss-tit">类型：</span>
						<select class="inp1 inp2">
							<option>民用锁具</option>
							<option>民用锁具2</option>
							<option>民用锁具3</option>
							<option>民用锁具4</option>
						</select>
					</div>
					<div style="clear:both"></div>
				</div>
				<div class="gaoji-sslb">
					<div class="gaoji-ss">
						<span class="ss-tit">价格：</span>
						<select class="inp1 inp2">
							<option>100元以下</option>
							<option>100~300元</option>
							<option>300~500元</option>
							<option>500元以上</option>
						</select>
					</div>
					<input class="search-btn" type="submit" value="搜 索"/><a class="del-sstj" href="#">清空搜索条件</a>
					<div style="clear:both"></div>
				</div>
				<div style="clear:both"></div>-->
				<div class="now-titlb-sy">
					<span class="sy-tit">品牌：</span>	
					<span class="sy-lb">
						<a href="#">不限</a>
						<a href="#">永久</a>
						<a class="hov" href="#">欧时力</a>
						<a href="#">米阿科尔</a>
						<a href="#">丽莎</a>
						<a href="#">多米西</a>
						<a href="#">永久</a>
						<a href="#">欧时力</a>
						<a href="#">米阿科尔</a>
					</span>
				</div>
				<div class="now-titlb-sy">
					<span class="sy-tit">价格：</span>	
					<span class="sy-lb">
						<a class="hov" href="#">不限</a>
						<a href="#">20-80元</a>
						<a href="#">20-80元</a>
						<a href="#">20-80元</a>
					</span>
				</div>
				<div class="now-titlb-sy">
					<span class="sy-tit">类型：</span>	
					<span class="sy-lb">
						<a href="#">不限</a>
						<a href="#">类型1</a>
						<a href="#">类型1</a>
						<a href="#">类型2</a>
						<a class="hov" href="#">类型3</a>
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
			<a class="px-txt" href="#">按名称</a>
			<a class="px-txt" href="#">按厂家</a>
			<a class="px-txt" href="#">默认</a>
			<a class="px-txt" href="#">按产品代号</a>
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
				<a href="${basePath}front/goodsDetailAction!prepare.action?goodsId=${item.id}"><img src="/a.jsp" width="188" height="175" alt=""/></a>
				<h4><a href="${basePath}front/goodsDetailAction!prepare.action?goodsId=${item.id}">${item.goodsName}</a></h4>
				<div class="txt1">
					<a href="${basePath}front/goodsDetailAction!prepare.action?goodsId=${item.id}">描述：${item.goodsDescription}</a>
				</div>
				<div class="money"><span style="font:bold 13px Arial, Helvetica, sans-serif"></span></div>
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
























