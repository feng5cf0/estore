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
	  <form action="${basePath}front/orderFrontAction!addOrder.action" method="post">
		<div class="now-tit">
			<span>当前所在位置：填写订单信息</span>
			<a class="btn" href="#">返回</a>
		</div>
		<div class="now-titlb">
			<h4>填写并核对订单信息</h4>
            <!--购物车列表开始-->
			<div class="shop-prolb">
				<!--<h5>全部商品<span>15</span></h5>-->
				<div class="shop-prolb-tit">
					<div class="wid wid1">&nbsp;</div>
					<div class="wid wid2" style="margin-left:-60px">商品</div>
					<div class="wid wid3" style="margin-left:35px">单价</div>
					<div class="wid wid3">数量</div>
					<div class="wid wid3">金额</div>
					<div class="wid wid4">操作</div>
				</div>
				
				<c:forEach items ="${cartList}" var="item">
					<div class="shop-prolb-body" style="border-bottom:none;padding-bottom:0">
						<div class="wid wid1">&nbsp;</div>
						<input type="hidden" name="cartIds" value="${item.id}"/>
						<div class="wid wid2" style="margin-left:-30px">
							<a href="#"><img class="pic1" src="images/new_pic2.png" width="56" height="56"/></a>
							<div class="txt1"><a href="#">${item.goods.goodsName}</a></div>
						</div>
						<div class="wid wid3 monys" style="margin-left:8px">${ item.goods.goodsPrice}</div>
						<div class="wid wid3">
							<a class="num-jian" href="javascript:;">-</a><input class="num-inp" type="text"  value="1"/><a class="num-jian" href="javascript:;">+</a>
						</div>
						<div class="wid wid3 monys">${item.amount}</div>
						<div class="wid wid4">
							<p><a href="#">删除</a></p>
							<p><a href="#">移入收藏夹</a></p>
						</div>
					</div>		
				</c:forEach>
			</div>
			<!--购物车列表结束-->
            <h3 class="shuohuo-h3">收件地址</h3>
            <div class="adress-lb">
            	<input type="radio" checked="checked"/>
                <span>小王  山东省济南市，经十路，18767389876</span>
            </div>
            <div class="adress-lb">
            	<input type="radio"/>
                <span>小王  山东省济南市，经十路，18767389876</span>
            </div>
            <h3 class="shuohuo-h3" style="margin-bottom:10px">填写具体信息</h3>
			<!--填写收货信息开始-->
			<div class="write-pay write-adress yunfei-fs">
				<div class="pay-lb">
                	<span class="span1">送货方式：</span>
                    <select class="inp1">
                    	<option>请选择</option>
                        <option>请选择</option>
                        <option>请选择</option>
                    </select>
                </div>
                <div class="pay-lb">
                	<span class="span1">付款方式：</span>
                    <select class="inp1">
                    	<option>请选择</option>
                        <option>请选择</option>
                        <option>请选择</option>
                    </select>
                </div>
                <div class="pay-lb">
                	<span class="span1">快递费用支付：</span>
                    <input type="checkbox" style="vertical-align:sub"/>
                    <span>买方支付快递费或快递费到付</span>
                    <p class="fs-notice">如果您有支付运费的账户，请在这里输入</p>
                    <input class="inp1 inp2 inp-margin" type="text"/>
                </div>
                <div class="pay-lb">
                	<span class="span1">快递保险：</span>
                     <input type="checkbox" style="vertical-align:sub"/>
                    <span>要求购买快递保险（保险费按照报关金额的总金额比例征收，保险条款依照快递公司条例为准。）</span>
                </div>
                 <div class="pay-lb">
                	<span class="span1">海关发票：</span>
                    <input type="checkbox" style="vertical-align:sub"/>
                    <span>自定义海关发票</span>
                    <div class="fs-notice">
                    	 <input type="checkbox" style="vertical-align:sub"/>
                   		 <span>锁匠工具</span>
                    </div>
                    <div class="fs-notice">
                    	 <input type="checkbox" style="vertical-align:sub"/>
                   		 <span>锁匠用品</span>
                    </div>
                    <div class="fs-notice">
                    	 <input type="checkbox" style="vertical-align:sub"/>
                   		 <span>空白电子芯片</span>
                    </div>
                </div>
				<div class="pay-lb">
                	<span class="span1" style="float:left">业务员：</span>
                    <div class="ywy-lbwk">
                      <div class="ywy-lb">
                          <img class="tx" src="images/touxiang.png" width="43"/>
                          <span class="name">王小姐</span>
                          <span class="name">Leno</span>
                      </div>
                      <div class="ywy-lb ywy-lb-huang">
                          <img class="tx" src="images/touxiang.png" width="43"/>
                          <span class="name">王小姐</span>
                          <span class="name">Leno</span>
                      </div>
                      <div class="ywy-lb">
                          <img class="tx" src="images/touxiang.png" width="43"/>
                          <span class="name">王小姐</span>
                          <span class="name">Leno</span>
                      </div>
                      <div class="ywy-lb">
                          <img class="tx" src="images/touxiang.png" width="43"/>
                          <span class="name">王小姐</span>
                          <span class="name">Leno</span>
                      </div>
                      <div class="ywy-lb">
                          <img class="tx" src="images/touxiang.png" width="43"/>
                          <span class="name">王小姐</span>
                          <span class="name">Leno</span>
                      </div>
                      <div class="ywy-lb">
                          <img class="tx" src="images/touxiang.png" width="43"/>
                          <span class="name">王小姐</span>
                          <span class="name">Leno</span>
                      </div>
                      <div class="ywy-lb">
                          <img class="tx" src="images/touxiang.png" width="43"/>
                          <span class="name">王小姐</span>
                          <span class="name">Leno</span>
                      </div>
                      <div class="ywy-lb">
                          <img class="tx" src="images/touxiang.png" width="43"/>
                          <span class="name">王小姐</span>
                          <span class="name">Leno</span>
                      </div>
                    </div>
                    <div style="clear:both"></div>
                </div>
                <div class="pay-lb">
                	<span class="span1" style="float:left">收货备注：</span>
                    <textarea class="textarea"></textarea>
                </div>
			</div>
			<!--填写收货信息开始-->
            <!--结算开始-->
            <div class="shop-end2">
                <span>应付总额：</span><span class="mon1">￥599.00</span>
                <input class="submit-btn submit-btn2" type="submit" value="提交" style="background:#5dbfec"/>
            </div>
            <!--结算结束-->
		</div>
		<!--当前所在位置结束-->
	  </form>
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
