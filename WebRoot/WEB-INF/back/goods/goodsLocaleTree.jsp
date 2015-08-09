<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@include file="/headDeclare.jsp"%>
	</head>
	<body style="background-color: f2fbff">
		<table width="100%" id="table1" border="1" cellpadding="0"
			cellspacing="1" bordercolor="98a8cc"
			style="background-color: ffffff; border-collapse: collapse; display: inherit;"
			frame="border">
			<tr>
				<td>
					<script type="text/javascript">
						d = new dTree('d');
						<c:forEach items="${categoryList}" var="item">
							<c:choose>
								<c:when test="${item.id > 0}">
									d.add(${item.id},${item.parentCategory},'${item.categoryName}');
								</c:when>
								<c:when test="${item.id < 0 }">
									d.add(${item.id},${item.parentCategory},'${item.categoryName}','${basePath}back/goodsLocaleAction!goodsLocaleSearch.action?goodsId=${item.id}');
								</c:when>
							</c:choose>
						</c:forEach>
						d.config.useSelection = false;
						d.config.target='goodsLocaleSearch';
						d.config.useIcons=false;
						document.write(d);
     				</script>
				</td>
			</tr>
		</table>
	</body>
</html>

