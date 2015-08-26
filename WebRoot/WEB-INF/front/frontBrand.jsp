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
	<h3><s:property value="getText('index.brand')"/></h3>
	<div class="pp-prolb">
		<div class="cb-lbwk">
			<c:forEach items="${brandList}" var="item">
				<a class="cb-lb" href="${basePath }front/goodsSearchAction!getByBrand.action?brand.id=${item.id}"><img src="${item.brandPic }" width="58" height="40"/></a>
			</c:forEach>
			<div style="clear:both"></div>
		</div>
		<div class="pp-txtlb">
			<c:forEach items="${brandList}" var="item">
				<a href="${basePath }front/goodsSearchAction!getByBrand.action?brand.id=${item.id}">${item.brandName}</a>
			</c:forEach>
		</div>
	</div>
	</body>
</html>
