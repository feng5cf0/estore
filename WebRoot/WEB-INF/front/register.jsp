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
  <form action="memberAction" method="post">
    <input name="member_alias" type="text" value="hzp5206"/>
    <input name="member_realname" type="text" value="洪震平"/>
    <input name="member_type" type="text" value="1"/>
    <input name="member_password" type="text" value="123456"/>
    <input name="integral" type="text" value="100"/>
    <input name="avaliable" type="text" value="1"/>
    <input name="is_email_avaliable" type="text" value="1"/>
    <input name="last_login_time" type="text" value="<%=new Date()%>"/>
    <input name="last_login_ip" type="text" value="192.168.3.333"/>
    <input name="create_time" type="text" value="<%=new Date()%>"/>
    <input name="last_modify_time" type="text" value="<%=new Date()%>"/>
    <input name="login_time" type="text" value="<%=new Date()%>"/>
    <input name="login_ip" type="text" value="192.168.3.333"/>
    <input name="memo" type="text" value="我不是一个好人！！"/>
    <input />
    </form>
  </body>
</html>
