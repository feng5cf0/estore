<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>会员注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/default.css">
	<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="js/member/register.js?v=123"></script>
  </head>
  
 <body>
<!--顶部开始-->
<div class="top2">
	<div class="top-con">
		<h1><a href="#"><img class="logo-img" src="images/logo.png" width="350" height="58"/></a></h1>
	</div>
</div>
<!--顶部结束-->

<!--内容区开始-->
<div class="register-con">
	<h4>用户注册</h4>
	<form action="" method="post" id="memberRegisterForm">
	<div class="register-lb">
		<span class="span1">会员账号：</span>
		<input name="member.memberAlias" id="memberAlias"  class="inp1" type="text" placeholder="请输入账号"/>
		<span class="span2">* 可由英文字母、数字等组成，不能包含特殊字符</span>
	</div>
	<div class="register-lb">
		<span class="span1">登录密码：</span>
		<input name="member.memberPassword" id="memberPassword" class="inp1" type="password"/>
		<span class="span2">* 不能少于8位</span>
	</div>
	<div class="register-lb">
		<span class="span1">确认密码：</span>
		<input name="memberRePassword" id="memberRePassword" class="inp1" type="password"/>
	</div>
	<div class="register-lb">
		<span class="span1">电子邮箱：</span>
		<input name="memberInfo.email" id="email" class="inp1" type="text" placeholder="请输入您的邮箱"/>
	</div>
	<div class="register-lb register-lb2">
		<input id="cbox" class="cbox" type="checkbox"/>同意<a href="#">用户使用条款</a>
	</div>
	<div class="register-lb register-lb2">
		<input id="smt" class="register-btn" type="button" value="注 册"/>
	</div>
	<div class="register-lb register-lb3">
		已有账号？<a href="front/memberAction!toMemberLoginPage">马上登陆</a>
	</div>
	</form>
</div>
<!--内容区结束-->

<jsp:include page="/WEB-INF/front/frontBottom.jsp"></jsp:include>
<!--底部结束-->
		

</body>
</html>
