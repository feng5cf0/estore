<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.util.Date" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <form action="front/memberAction!memberRegister.action" method="post">
    <input name="member.memberAlias" type="text" value="hzp5206"/>
    <input name="member.memberRealname" type="text" value="洪震平"/>
    <input name="member.memberType" type="text" value="1"/>
    <input name="member.memberPassword" type="text" value="123456"/>
    <input name="member.integral" type="text" value="100"/>
    <input name="member.avaliable" type="text" value="1"/>
    <input name="member.isEmailAvaliable" type="text" value="1"/>
    <input name="member.lastLoginIp" type="text" value="192.168.3.333"/>
    <input name="member.loginIp" type="text" value="192.168.3.333"/>
    <input name="member.memo" type="text" value="我不是一个好人！！"/>
    <input type="submit" value="submit"/>
    </form>
  </body>
</html>
