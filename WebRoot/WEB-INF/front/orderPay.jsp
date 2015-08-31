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
	function payLater(){
		window.location.href = "${basePath}front/orderFrontAction!get.action"
	}
	function previewImage(imgFile,id) 
	{ 
		var pattern = /(\.*.jpg$)|(\.*.png$)|(\.*.jpeg$)|(\.*.gif$)|(\.*.bmp$)/;      
	 	if(!pattern.test(imgFile.value)) 
	 	{ 
	  		alert("系统仅支持jpg/jpeg/png/gif/bmp格式的照片！");  
	  		imgFile.focus(); 
	 	} else { 
	  		var path; 
	  		if(document.all)//IE 
	  		{ 
	   imgFile.select(); 
	   path = document.selection.createRange().text; 
	   document.getElementById(id).innerHTML=""; 
	   document.getElementById(id).style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='scale',src=\"" + path + "\")";//使用滤镜效果 
	  } 
	  else//FF 
	  { 
	   path = URL.createObjectURL(imgFile.files[0]);
	   document.getElementById(id).innerHTML = "<img width='400' height='250' src='"+path+"'/>"; 
	  } 
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
			<span>当前所在位置：填写付款信息</span>
			<a class="btn" href="#">上一步</a>
		</div>
		<form action="${basePath}front/orderFrontAction!pay.action" method="post" id="picForm" enctype="multipart/form-data">
			<div class="now-titlb">
				<h4>填写付款信息</h4>
				<input type="hidden" name="order.id" value="${order.id}"/>
				<!--填写付款信息开始-->
	            <p class="notice">*尊敬的用户，请自信填写您的付款信息，以便更快的完成交易</p>
				<div class="write-pay">
	                <div class="pay-lb">
	                	<span class="span1">付款时间：</span>
	                    <input class="inp1" type="text" name="payTime"/>
	                </div>
	                <div class="pay-lb">
	                	<span class="span1">付款方式：</span>
	                    <select class="inp1" name="payType">
	                    	<option>付款方式1</option>
	                        <option>付款方式2</option>
	                        <option>付款方式3</option>
	                    </select>
	                </div>
	                <div class="pay-lb">
	                	<span class="span1">账号：</span>
						<span><input type="text" name="account"/></span>
	                </div>
	                <div class="pay-lb">
	                	<span class="span1">上传凭证：</span>
	                    <input class="file" type="file" name="payPic" id="payPic" 
	                    	onchange="previewImage(this,'imgPreview')"/>
	                    <div class="file-ys">上传凭证</div>
	                    <div class="up-pz">*上传凭证的说明</div>
						<div class="up-pz" id="imgPreview">
						</div>
	                    <!--<div class="up-pz">
	                    	<img src="images/fukuan_pz.jpg" width="400"/>
	                    </div>
	                    -->
	                    </div>
				</div>
	            <!--结算开始-->
	            <div class="shop-end2">
	                <span>应付总额：</span><span class="mon1">${order.payMoney}</span>
	                <input class="submit-btn submit-btn2" type="submit" value="提交" style="background:#5dbfec"/>
	                <input class="submit-btn submit-btn2" type="button" value="稍后付款" style="background:#5dbfec" onclick="payLater();"/>
	            </div>
	            <!--结算结束-->
				<!--填写付款信息结束-->
			</div>
		</form>
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
























