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
			<h3 class="prolb-show-tit"><s:property value="getText('index.goodsRecommend')"/><a href="#"><span class="span1"><s:property value="getText('index.more')"/></span><span class="span2">&gt;</span></a></h3>
			<div class="piclb2">
				<c:forEach items="${goodsRecommendList}" var="item">
					<div class="prolb-showlb">
						<a href="${basePath}front/goodsDetailAction!prepare.action?goodsId=${item.id}"><img src="images/tuijian_suo1.png" width="188" height="160"/></a>
						<h4>${item.goodsName }</h4>
						<div class="txt1">
							<a href="${basePath}front/goodsDetailAction!prepare.action?goodsId=${item.id}">功能：${item.goodsDescription }</a>
						</div>
						<div class="money"><span style="font:bold 13px Arial, Helvetica, sans-serif">￥</span>${item.goodsPrice }</div>
					</div>
				</c:forEach>
				<div style="clear:both"></div>
			</div>
	</body>
</html>
