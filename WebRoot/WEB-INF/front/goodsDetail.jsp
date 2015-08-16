<%@page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="/headDeclare.jsp"%>
<%@include file="/tagDeclare.jsp" %>
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
			<span>当前所在位置：<a href="#">首页</a><span> > </span><a href="#">产品列表</a><span> > </span><a href="#">摩托车遥控拷贝器</a><span> > </span>汽车锁与防盗锁</span>
		</div>
		<!--当前所在位置结束-->
		<!--商品详情内容开始-->
		<!--头部开始-->
		<div class="proxq-tit">
			<div class="proxq-tit-left">
				<img class="proxq-pic1" src="images/proxq_pic1.png" width="366" height="366"/>
				<ul class="proxq-tit-ul">
					<li><img src="images/proxq_pic11.png" width="68" height="68"/></li>
					<li><img src="images/proxq_pic12.png" width="68" height="68"/></li>
					<li><img src="images/proxq_pic13.png" width="68" height="68"/></li>
					<li><img src="images/proxq_pic14.png" width="68" height="68"/></li>
					<li><img src="images/proxq_pic15.png" width="68" height="68"/></li>
				</ul>
			</div>
			
			<form action="${basePath}front/cartFrontAction!addCart.action">
			<div class="proxq-tit-right">
				<h3>${goods.goodsName}</h3>
				<input type="hidden" value="${goods.id}" name="goods.id"/>
				<div class="proxq-tit-jg">
					<div class="jglb">
						<span class="xqjg1"><s:property value="getText('goodsdetail.price')"/></span><span class="xqjg2">${goods.goodsPrice}</span>
						<div class="chakan-bzjg">
							<<s:property value="getText('goodsdetail.otherprice')"/><img src="images/xia_jt.png" width="10"/>
							<div class="chakan-bzjg-zk">
								<p>美元：268元</p><p>日元：268元</p><p>港元：268元</p>
							</div>
						</div>
						<div style="clear:both"></div>
					</div>
					<div class="jglb">
						<span><s:property value="getText('goodsdetail.onsale')"/></span><span class="jglb-ys">满300减30</span>
					</div>
				</div>
				<div class="proxq-tit-cslb">
					<span class="cs-tit">编码：</span>
					<span class="cs-body"><b>TRK VW OO</b></span>
				</div>
				<div class="proxq-tit-cslb">
					<span class="cs-tit">制造厂：</span>
					<span class="cs-body"><input class="radio" type="radio" checked="checked"/>售后</span>
				</div>
				<div class="proxq-tit-cslb">
					<span class="cs-tit">芯片：</span>
					<span class="cs-body">
						<input class="radio" type="radio" checked="checked"/>48芯片
						<input class="radio" type="radio"/>68芯片
					</span>
				</div>
				<div class="proxq-tit-cslb">
					<span class="cs-tit">备用钥匙：</span>
					<span class="cs-body">
						<input class="radio" type="radio" checked="checked"/>是的，需要
						<input class="radio" type="radio"/>不需要，谢谢
					</span>
				</div>
				<div class="proxq-tit-cslb">
					<span class="cs-tit">颜色：</span>
					<span class="cs-body">
						<a class="color-ys" href="javascript:;">白色</a>
						<a class="color-ys xz" href="javascript:;">金色</a>
						<a class="color-ys" href="javascript:;">灰色</a>
					</span>
				</div>
				<div class="proxq-tit-cslb">
					<span class="cs-tit">购买数量：</span>
					<span class="cs-body">
						<a class="num-jian2" href="javascript:;">-</a>
						<input class="num-inp2" type="text" value="1" name="total"/>
						<a class="num-jian2" href="javascript:;">+</a>
					</span>
				</div>
				<div class="proxq-tit-cslb" style="margin-left:70px">
					<input class="submit-btn submit-btn2" type="submit" value="<s:property value="getText('goodsdetail.addcart')"/>"/>
					<input class="submit-btn submit-btn2" type="submit" value="<s:property value="getText('goodsdetail.addfavorit')"/>" style="background:#5dbfec"/>
				</div>
			</div>
			</form>
			<div style="clear:both"></div>
		</div>
		<!--头部结束-->
		<!--切换头部开始-->
		<div class="proxq-titqh">
			<a class="qh-tit hov" href="#"><s:property value="getText('goodsdetail.detail')"/></a> 
			<a class="qh-tit" href="#"><s:property value="getText('goodsdetail.memo')"/></a>
			<a class="qh-tit" href="#"><s:property value="getText('goodsdetail.relatedgoods')"/></a>
			<a class="qh-tit" href="#"><s:property value="getText('goodsdetail.samecategory')"/></a>
			<a class="sao-ewm" href="javascript:;">二维码，扫一扫</a>
			<div class="ewm-pic2">
				<img class="jt" src="images/shang_jt.png" width="16" height="8"/>
				<img src="images/erweima.png" width="95" height="95"/>			</div>
		</div>
		<!--切换头部结束-->
		<!--详情内容开始-->
		<div class="proxq-con1">
			<div class="proxq-gglb">
				<p>商品名称：帮派欧式简约卧室室内锁具帮派欧式简约卧室室内锁具帮派欧式简约卧室室内锁具</p>
				<p>商品毛重：2.00kg</p>
				<p>风格：奢华欧式风格</p>
			</div>
			<div class="proxq-gglb">
				<p>商品名称：帮派欧式简约卧室室内锁具</p>
				<p>商品毛重：2.00kg</p>
				<p>风格：奢华欧式风格</p>
			</div>
			<div class="proxq-gglb">
				<p>商品名称：帮派欧式简约卧室室内锁具</p>
				<p>商品毛重：2.00kg</p>
				<p>风格：奢华欧式风格</p>
			</div>
			<h4>帮派欧式简约卧室室内锁具帮派欧式简约卧室室内锁,简约介绍了，帮派欧式简约卧室室内锁具帮派欧式简约卧室室内锁,简约介绍</h4>
			<img src="images/proxq_pic2.png" width="750" height="470"/>
		</div>
		<!--详情内容结束-->
		<!--商品详情内容结束-->
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
























