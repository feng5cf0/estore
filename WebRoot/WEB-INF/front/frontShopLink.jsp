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
		<h3><s:property value="getText('index.shoplink')"/></h3>
		<div class="wd-biao1">
			<div class="img"><a href="#"><img src="images/wangdian_logo1.png" width="54" height="54"/></a></div>
			<a href="#">淘宝网</a>
		</div>
		<div class="wd-biao1" style="float:right">
			<div class="img"><a href="#"><img src="images/wangdian_logo1.png" width="54" height="54"/></a></div>
			<a href="#">淘宝网</a>
		</div>
		<div style="clear:both"></div>
		<div class="wd-biao3">
			<div class="img"><a href="#"><img src="images/sumaitong.png" width="165" height="30"/></a></div>
			<a href="#">速卖通</a>
		</div>
		<div class="wd-ewm">
			<div><img src="images/erweima.png" width="160" height="161"/></div>
			<span>扫一扫，打开微店</span>
		</div>
	</body>
</html>
