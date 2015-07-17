<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<html>
	<head>
		<title>宇航科技</title>
		<base
			href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
		<LINK href="css/logging.css" type="text/css" rel="stylesheet">
	</head>
	<body>
		<div>
			<form action="${basePath}core/userLogin!login.action" id="form1" method="post">
				<table width="1004" height="550" border="0" align="center"
					cellpadding="0" cellspacing="0" id="__01">
					<tr>
						<td colspan="2" valign="top">
							<img src="css/images/loginimages/snst.jpg">
						</td>
					</tr>
					<tr align="center" height="100px">
						<td>
							<img src="css/images/loginimages/ygzz.png"
								onmouseover="this.style.cursor='hand'"
								onclick="window.location.href='/snst/userselfhelp/indexs.action'">
						</td>
						<td>
							<img src="css/images/loginimages/ykt.png"
								onmouseover="this.style.cursor='hand'"
								onclick="window.location.href='/snst/ipass/ipassLogin!show.action'">
						</td>
					</tr>
					<tr align="center" height="100px">
						<td>
							<img src="css/images/loginimages/dt.png"
								onmouseover="this.style.cursor='hand'"
								onclick="window.location.href='/snst/dunhall/dunHallBackLogin!show.action'">
						</td>
						<td>
							<img src="css/images/loginimages/wuye.png"
								onmouseover="this.style.cursor='hand'"
								onclick="window.location.href='/snst/core/index.action'">
						</td>
					</tr>
					<tr align="center" valign="bottom">
						<td colspan="2">
							<img src="css/images/loginimages/copyright.png">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>




