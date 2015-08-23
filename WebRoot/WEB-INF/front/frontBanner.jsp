<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<%@include file="/headDeclare.jsp"%>
  	<%@include file="/tagDeclare.jsp"%>
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/default.css"/>
	
	<script type="text/javascript">
		function changePic(picId){
			var bannerPic = document.getElementById("banner"+picId);
		}
		function toRegister(){
			window.location.href = "${basePath}front/memberAction!toMemberRegisterPage";	
		}
		function toLogin(){
			window.location.href = "${basePath}front/memberAction!toMemberLoginPage";
		}
		function moreNotice(){
			<c:if test="${not empty sessionScope.noticeListFour }">
				alert("加载中。。。");
			</c:if>
			<c:if test="${empty sessionScope.noticeListFour }">
				alert("没有更多消息!");
			</c:if>
		}
	</script>
  </head>
  
<body>
	<div class="banner">
		<ul>
			<c:forEach begin="1" end="6" var="item">
				<li class="banner-lb"><a href="#"><img src="images/banner${item }.png" width="602" height="312" id="banner${item }"/></a></li>
			</c:forEach>
		</ul>
		<div class="banner-btn">
			<a href="javascript:changePic(1);"></a>
			<a href="javascript:changePic(2);"></a>
			<a href="javascript:changePic(3);"></a>
			<a href="javascript:changePic(4);"></a>
			<a href="javascript:changePic(5);"></a>
			<a href="javascript:changePic(6);"></a>
		</div>
	</div>
	<div class="gonggao-con">
		<h3><<s:property value="getText('index.notice')"/><a href="javascript:moreNotice();"><s:property value="getText('index.more')"/>&gt;</a></h3>
		<div class="gg-lb">
		<c:if test="${not empty sessionScope.noticeListFour }">
			<c:forEach items="${sessionScope.noticeListFour }" var="item">
				<div class="lb-con"><span>【<s:property value="getText('index.notice')"/>】
				</span><a href="#">${item.title }</a></div>
			</c:forEach>
		</c:if>
		<c:if test="${empty sessionScope.noticeListFour }">
			<div class="lb-con" style="color: red">
				<span></span>暂时没有公告</div>
		</c:if>
		</div>
		<div class="login-con">
			<div class="txlb">
				<img class="tx" src="images/touxiang.png" width="53" height="53"/>
				<div class="txt4">
					<p><s:property value="getText('index.hello')"/></p>
					<p><a href="front/memberAction!toMemberRegisterPage"><s:property value="getText('index.registernotice')"/></a><span style="color:#777"><s:property value="getText('index.go')"/></span></p>
				</div>
			</div>
			<div class="btn">
				<input class="login-btn" type="button" value="<s:property value="getText('index.registerbutton')"/>"
					onclick="toRegister();"/>
				<input class="login-btn" style="background:#0160b2" type="button" value="<s:property value="getText('index.loginbutton')"/>"
					onclick="toLogin();"/>
			</div>
		</div>
	</div>
	<div style="clear:both"></div>
</body>
</html>
