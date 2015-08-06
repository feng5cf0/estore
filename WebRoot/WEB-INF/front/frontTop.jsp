<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<%@include file="/headDeclare.jsp"%>
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/default.css"/>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
<div class="top">
	<div class="top-con">
		<c:if test="${empty sessionScope.member.memberAlias }">
			<div class="top-left">
				<a class="a1" href="front/memberAction!toMemberLoginPage"><s:property value="getText('index.pleaselogin')"/></a><a href="front/memberAction!toMemberRegisterPage"><s:property value="getText('index.freeregister')"/></a>
			</div>
		</c:if>
		<c:if test="${not empty sessionScope.member.memberAlias }">
			<div class="top-left">
				<a class="a1" href="front/memberAction!toMemberCenterPage">${sessionScope.member.memberAlias }</a><a href="front/memberAction!toMemberRegisterPage"><s:property value="getText('index.freeregister')"/></a>
			</div>
		</c:if>
		<div class="top-right">
			<a class="top-right-dw" href="javascript:;"><s:property value="getText('index.sethomepage')"/></a> |
			<div class="top-right-dw top-right-gwc" href="javascript:;">
				<img src="images/gowoche.png" width="15" height="14"/>
				<span class="txt"><s:property value="getText('index.cart')"/></span>
				<span class="num">2</span>
				<img src="images/jt_xia.png" width="9" height="7"/>
				<div class="gwc-xllb" style="displ ay:block">
					<a href="#">我的积分</a>
					<a href="#">我的余额</a>
				</div>
		    </div> |
			<div class="top-right-dw top-right-scj" href="javascript:;">
				<span class="txt"><s:property value="getText('index.favorite')"/></span>
				<img src="images/jt_xia.png" width="9" height="7"/>
				<div class="gwc-xllb" style="left:-7px;width:72px">
					<a href="#">我的收藏</a>
					<a href="#">我的收藏</a>
				</div>
		    </div> |
			<div class="top-right-dw top-right-order" href="javascript:;">
				<span class="txt"><s:property value="getText('index.myorder')"/></span>
				<img src="images/jt_xia.png" width="9" height="7"/>
				<div class="gwc-xllb" style="left:-8px;width:75px">
					<a href="#">查看订单</a>
					<a href="#">去结算</a>
					<a href="front/memberAction!toMemberCenterPage">个人中心</a>
				</div>
		  </div>
		</div>
	</div>
</div>
<!--顶部结束-->
<!--logo区开始-->
<div class="logo">
	<h1><a href="#"><img class="logo-img" src="images/logo.png" width="350" height="58"/></a></h1>
	<div class="logo-right">
		<div class="yuyan-lb">
			<a href="${basePath}front/languageAction!changeLanguage.action?request_locale=zh_CN"><img src="images/yuyan_1.png" width="79" height="20"/></a>
			<a href="${basePath}front/languageAction!changeLanguage.action?request_locale=en_US"><img src="images/yuyan_2.png" width="79" height="20"/></a>
			<a href="#"><img src="images/yuyan_3.png" width="79" height="20"/></a>
			<a href="#"><img src="images/yuyan_4.png" width="79" height="20"/></a>
			<a href="#"><img src="images/yuyan_5.png" width="79" height="20"/></a>
			<select class="yy-sel">
				<option>其他语言</option>
				<option>其他语言</option>
				<option>其他语言</option>
			</select>
		</div>
		<div class="sosuo-ys">
			<input class="inp" type="text" placeholder="<s:property value="getText('index.searchtip')"/>"/><input class="sub1" type="submit" value=" "/>
			<input class="sub2" type="submit" value=" "/>
		</div>
	</div>
</div>
  </body>
</html>
