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
	<div class="prolb-left1">
		<dl class="prolb-left1-dl">
			<c:forEach items="${categoryList}" var="item" >
				<dt><img src="images/suo_biao.png" width="20"/>${item.categoryName }</dt>
				<dd>
					<c:forEach items="${item.subCategory}" var="subItem">
						<a href="">${subItem.categoryName }</a>
					</c:forEach>
					<div style="clear:both"></div>
					
					<!-- 鼠标经过效果  开始  -->
					<div class="white-bg"></div>
					<div class="pro-left1-lilb">
						<div class="left1-lilb-div">
							<h3><img/></h3>
							<div class="txt9">
								<a href="#">滑动效果</a>
							</div>
						</div>
					</div>
					<!-- 鼠标经过效果结束 -->
				</dd>
			</c:forEach>
		</dl>
	</div>
  </body>
</html>
