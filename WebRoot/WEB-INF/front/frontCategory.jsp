<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<%@include file="/headDeclare.jsp"%>
  	<%@include file="/tagDeclare.jsp"%>
  	<%@include file="/frontHeadDeclare.jsp" %>
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
				<dd class="pro-left1-li">
					<c:forEach items="${item.subCategory}" var="subItem" varStatus="status">
						<a href="${basePath }front/goodsSearchAction!getByCategory.action?categoryId=${subItem.id}">${subItem.categoryName }</a>
					</c:forEach>
					<div style="clear:both"></div>
					
					<!--划上效果开始-->
					<div class="white-bg"></div>
					<div class="pro-left1-lilb">
						<div class="left1-lilb-div">
							<h3><img src="images/suo_biao.png" width="20"/>汽车编程仪<a href="#" class="more">更多</a></h3>
							<div class="txt9">
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
							</div>
						</div>
						<div class="left1-lilb-div">
							<h3><img src="images/suo_biao.png" width="20"/>汽车编程仪<a href="#" class="more">更多</a></h3>
							<div class="txt9">
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
							</div>
						</div>
						<div class="left1-lilb-div">
							<h3><img src="images/suo_biao.png" width="20"/>汽车编程仪<a href="#" class="more">更多</a></h3>
							<div class="txt9">
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
							</div>
						</div>
						<div class="left1-lilb-div">
							<h3><img src="images/suo_biao.png" width="20"/>汽车编程仪<a href="#" class="more">更多</a></h3>
							<div class="txt9">
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
							</div>
						</div>
					</div>
					<!--划上效果结束-->
				</dd>
			</c:forEach>
		</dl>
	</div>
  </body>
</html>
