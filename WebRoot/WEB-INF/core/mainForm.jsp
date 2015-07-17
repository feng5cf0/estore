<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<html>
	<head>
		<%@include file="/headDeclare.jsp"%>
	</head>
		<frameset rows="100,*,30" frameborder="0" border="0" framespacing="0"
		id="gxtFrame">
		<frame src="${basePath}core/mainFormTop.action" name="topFrame" scrolling="NO"
			noresize="noresize"></frame>
		<frameset cols="180,10,*" id="left" frameborder="NO" border="0"
			framespacing="0">
			<frame src="${basePath}core/mainFormLeft.action" name="leftFrame" noresize="noresize"></frame>
			<frame src="${basePath}core/mainFormCenter.action" name="centerFrame" scrolling="NO" noresize="noresize"></frame>
			<frame src="${basePath}core/userDetail!detailUser.action" id="main" name="contentFrame"
				noresize="noresize" scrolling="YES"></frame>
		</frameset>
		<frame src="${basePath}core/mainFormBottom.action" name="bottomFrame" scrolling="NO"
			noresize="noresize"></frame>
	</frameset>
	
	<noframes>
	<body></body>
	</noframes>
</html>




	
