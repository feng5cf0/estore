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
  </head>
  
<body>
	<div class="banner">
		<ul>
			<li class="banner-lb"><a href="#"><img src="images/banner1.png" width="602" height="312"/></a></li>
			<li class="banner-lb"><a href="#"><img src="images/banner1.png" width="602" height="312"/></a></li>
		</ul>
		<div class="banner-btn">
			<a href="#"></a><a href="#"></a><a href="#"></a><a href="#"></a><a href="#"></a><a href="#"></a>
		</div>
	</div>
	<div class="gonggao-con">
		<h3>公告<a href="#">更多></a></h3>
		<div class="gg-lb">
			<div class="lb-con"><span>【公告】</span><a href="#">限时限量折扣公告</a></div>
			<div class="lb-con"><span>【公告】</span><a href="#">限时限量折扣公告</a></div>
			<div class="lb-con"><span>【公告】</span><a href="#">限时限量折扣公告</a></div>
		</div>
		<div class="login-con">
			<!--<div class="user-lb"><span>用户名：</span><input class="inp" type="text"/></div>
					<div class="user-lb"><span>密码：</span><input class="inp" type="password"/></div>-->
			<div class="txlb">
				<img class="tx" src="images/touxiang.png" width="53" height="53"/>
				<div class="txt4">
					<p>Hi,你好！</p>
					<p><a href="front/memberAction!toMemberRegisterPage">注册为会员</a><span style="color:#777">去逛逛</span></p>
				</div>
			</div>
			<div class="btn">
				<input class="login-btn" type="submit" value="注册"/>
				<input class="login-btn" style="background:#0160b2" type="submit" value="登录"/>
			</div>
			<!--<div class="forget-pw"><a href="#">忘记密码？</a></div>-->
		</div>
	</div>
	<div style="clear:both"></div>
</body>
</html>