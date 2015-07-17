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
d = new dTree('d');<c:forEach items="${rightList}" var="item">
<c:choose>
<c:when test="${item.isInherit==0||item.id==1}">
							d.add(${item.id},${item.upRightId},'${item.rightName}','${basePath}core/rightSearch!searchRightByUpRightId.action?upRightId=${item.id}');
</c:when>
<c:otherwise>
							d.add(${item.id},${item.upRightId},'${item.rightName}');
</c:otherwise>
					</c:choose>
						</c:forEach>
						d.config.useSelection = false;
						d.config.target='rightList';
						d.config.useIcons=false;
						document.write(d);
     						</script>
				</td>
			</tr>
		</table>
	</body>
</html>

