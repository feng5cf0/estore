<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page language="java" contentType="text/html; charset=utf-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="/headDeclare.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/default.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/kefu.js"></script>
<script src="js/lrtk.js"></script> 
<script type="text/javascript" src="js/onlineMsg/onlineMsg.js"></script>
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
<title>在线留言</title>
</head>

<body>
<!--顶部开始-->
	<jsp:include page="/WEB-INF/front/frontTop.jsp"></jsp:include>
<!--顶部区结束-->
<!--nav区开始-->
<div class="nav">
	<div class="nav-con">
		<div class="fenlei-ys" ><s:property value="getText('index.allcategory')"/></div>
		<a href="front/mainAction!toMain.action" style="width:40px;"><s:property value="getText('index.homepage')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="front/newProductAction!toNewProduct"  style="width:60px;"><s:property value="getText('index.newgoods')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="front/onsaleFrontAction!prepare.action"  style="width:60px;"><s:property value="getText('index.onsale')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="front/aboutUsAction!toAboutUs"  style="width:60px;"><s:property value="getText('index.aboutus')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="front/afterSaleAction!toAfterSale"  style="width:60px;"><s:property value="getText('index.aftersale')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="front/bankAccountAction!toBankAccount"  style="width:60px;"><s:property value="getText('index.bankaccount')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a class="hov" href="front/onlineMsgAction!toOnLine"  style="width:60px;"><s:property value="getText('index.leavemessage')"/></a><img src="images/nav_line.png" width="2" height="33"/>
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
			<span>当前所在位置：<a href="#">首页</a><span> > </span>在线留言</span>
		</div>
		<div class="now-titlb">
			<h4>在线留言</h4>
			<!--在线留言内容开始-->
			<div class="about-us online-ly">
			<form action="" method="post" id="onlineMsgForm">
				<div class="ly-lb">
					<span class="name">公司名称：</span>
					<input name="onlineMsg.company" id="company" class="inp" type="text"/>
				</div>
				<div class="ly-lb">
					<span class="name">联 系 人：</span>
					<input name="onlineMsg.linkMan" id="linkMan"  class="inp" type="text"/>
					<!-- 如果真名为空，就取会员昵称 -->
					<c:if test="${not empty sessionScope.member.memberRealname }">
					<input name="onlineMsg.createName" id="createName" value="${sessionScope.member.memberRealname }"  class="inp" type="hidden"/>
					</c:if>
					<c:if test="${empty sessionScope.member.memberRealname }">
					<input name="onlineMsg.createName" id="createName" value="${sessionScope.member.memberAlias }"  class="inp" type="hidden"/>
					</c:if>
					
				</div>
				<div class="ly-lb">
					<span class="name">联系电话：</span>
					<input name="onlineMsg.linkPhone" id="linkPhone"  class="inp" type="text"/>
				</div>
				<div class="ly-lb">
					<span class="name">电子邮件：</span>
					<input name="onlineMsg.email" id="email"  class="inp" type="text"/>
				</div>
				<div class="ly-lb">
					<span class="name">公司地址：</span>
					<input name="onlineMsg.companyAddress" id="companyAddress"  class="inp" type="text"/>
				</div>
				<div class="ly-lb">
					<span class="name">邮  编：</span>
					<input name="onlineMsg.zipCode" id="zipCode"  class="inp" type="text"/>
				</div>
				<div class="ly-lb">
					<span class="name">传  真：</span>
					<input name="onlineMsg.fax" id="fax"  class="inp" type="text"/>
				</div>
				<div class="ly-lb">
					<span class="name">内容说明：</span>
					<textarea name="onlineMsg.memo" id="memo"  class="inp inp3"></textarea>
				</div>
				<div class="ly-lb">
					<span class="name">验 证 码：</span>
					<input name="yzm" class="inp inp2" type="text"/>
					<img id="checkimg"  class="yzm" src="<%=contextPath %>/front/yzmAction!createYzm" width="44" height="18"/>
					<span>看不清？</span><a class="huan" href="javascript:void(0);" onclick="flushYZM()">换一张</a>
				</div>
				<div class="btn">
					<input id="onlineMsgBtn" class="login-btn" type="button" value="提交"/>
					<input class="login-btn" style="background:#0160b2" type="reset" value="重设"/>
				</div>
			</form>
			</div>
			<!--在线留言内容结束-->
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
