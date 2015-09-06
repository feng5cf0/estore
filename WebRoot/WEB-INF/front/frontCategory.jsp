<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
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
	<script type="text/javascript">
		function getSubCategory(x,y){
			
			var innerObject = document.getElementById("categoryList"+x+y);
			document.getElementById("resultDiv").innerHTML = "";
			document.getElementById("resultDiv").innerHTML = innerObject.innerHTML;
			
		}
	</script>
  </head>
  
  <body>
	<div class="prolb-left1">
		<dl class="prolb-left1-dl">
			<c:forEach items="${categoryList}" var="item" varStatus="statusX">
				<dt><img src="images/suo_biao.png" width="20"/>${item.categoryName }</dt>
				<dd class="pro-left1-li">
					<c:forEach items="${item.subCategory}" var="subItem" varStatus="statusY">
						<a href="${basePath }front/goodsSearchAction!getByCategoryCode.action?categoryCode=${subItem.categoryCode}"
							onmouseover="getSubCategory(${statusX.count},${statusY.count});">${subItem.categoryName }</a>
						
						<div id="categoryList${statusX.count}${statusY.count}"  style="display:none">
							<div class="left1-lilb-div">
								<h3><img src="images/suo_biao.png" width="20"/>${subItem.categoryName}<a href="javascript:alert('没有更多数据！');" class="more">更多</a></h3>
								<div class="txt9">
									<c:forEach items="${subItem.subCategory}" var="subSubItem">
										<a href="${basePath }front/goodsSearchAction!getByCategoryCode.action?categoryCode=${subItem.categoryCode}">${subSubItem.categoryName}</a>
									</c:forEach>
								</div>
							</div>
						</div>
					</c:forEach>
					<div style="clear:both"></div>
					
					<!--划上效果开始-->
					<div class="white-bg"></div>
					<div class="pro-left1-lilb" id="resultDiv">
					</div>
				</dd>
			</c:forEach>
		</dl>
	</div>
  </body>
</html>
