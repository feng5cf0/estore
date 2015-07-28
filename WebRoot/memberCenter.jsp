<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>会员中心</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 	<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script> 
  </head>
  
  <body>
  
    	<s:form action="front/memberInfoAction!memberRegister.action" method="post" enctype="multipart/form-data">
    			<s:textfield name="member.memberAlias" value="hzp5206"></s:textfield>
    			<s:textfield name="member.memberRealname" value="洪震平"></s:textfield>
    			<s:textfield name="member.memberPassword" value="123456"></s:textfield>
    			<s:textfield name="member.memo" value="你不是一个好人"></s:textfield>
    			<s:textfield name="member.memberInfo.mobilePhone" value="180608434494"></s:textfield>
    			<s:textfield name="member.memberInfo.telephone" value="6865206"></s:textfield>
    			<s:textfield name="member.memberInfo.email" value="574591725@qq.com"></s:textfield>
				上传头像：<input type="file" name="pic" size="50"/>
    			<s:radio name="member.memberInfo.sex" list="#{'1':'男','0':'女'}"  listKey="key" listValue="value" label="性别" value="'1'"></s:radio>
    			<s:textfield name="member.memberInfo.location" value="福建省龙海市" />
			    <s:textfield name="sbirthday" id="d11"  onClick="WdatePicker()"/>
			    <s:submit value="提交"></s:submit>
			    
    	</s:form>
  </body>
</html>
