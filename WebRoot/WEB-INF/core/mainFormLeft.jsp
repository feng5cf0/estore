<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="gbk" isELIgnored="false"%>
<%@include file="/tagDeclare.jsp"%>
<html>
	<head>
		<%@include file="/headDeclare.jsp"%>
		<script type="text/javascript">
<c:if test="${sessionScope.sessionModifyPassword==1}">
showDialog("${basePath}core/userUpdatePassword!prepare.action");		</c:if>
</script>
	</head>

	<body topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0"
		bgcolor="d7f1fe" style="overflow-x: hidden;" class="body1">
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			height="100%" bgcolor="d7f1fe">
			<tr>
				<td width="180" valign="top" class="menubody">
					<div class="menu_sidebar">
						<c:forEach items="${sessionMenu}" var="menu" varStatus="status">
							<div class="menu">
								<div class="menutitle" onclick="showtable(${status.count});">
									<div class="menutitlel">
										${menu.value.rightName}
									</div>
									<div class="menutitler menutitlerUP" id="divC${status.count}"></div>
								</div>
								<c:if test="${menu.value.subRights!=null}">
									<div class="menubody01" id="div${status.count}">
										<ul>
											<c:forEach items="${menu.value.subRights}" var="subMenu"
												varStatus="subMenuStatus">
												<li>
													<img src="css/images/911.gif" width="20" height="20"
														align="top" />
													<a href="${subMenu.rightURL}" target="contentFrame">${subMenu.rightName}</a>
												</li>
											</c:forEach>
										</ul>
									</div>
								</c:if>
								</div>
						</c:forEach>
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>


