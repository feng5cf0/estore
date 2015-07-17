<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<html>
	<head>
	</head>
	<frameset cols="197,*" id="left" frameborder="0" border="0"
		framespacing="0">
		<ld:check mark="mainFormLeft">
			<frame src="${basePath}core/mainFormLeft.action" id="leftFrame" name="leftFrame"
				scrolling="auto" noresize="noresize"></frame>
		</ld:check>
		<ld:check mark="mainFormCenterFrame">
			<frame src="${basePath}core/mainFormCenterFrame.action" id="centerFrame"
				name="leftFrame" scrolling="auto" noresize="noresize"></frame>
		</ld:check>
	</frameset>
	<noframes>
		<body>
			您的浏览器无法处理框架！
		</body>
	</noframes>
</html>
