<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<html>
	<head>
	</head>
	<frameset cols="*,300" id="left" frameborder="0" border="0"
		framespacing="0">
		<frame src="dmp/leaseManage.action" id="centerFrame"
			name="centerFrame" scrolling="yes" scrolling="yes"
			noresize="noresize"></frame>
		<ld:check mark="blankRightMenu">
			<frame src="${basePath}dmp/leaseRightMenu.action" id="rightFrame"
				name="rightFrame" scrolling="yes" name="rightFrame"
				noresize="noresize"></frame>
		</ld:check>
	</frameset>
	<noframes>
		<body>
			您的浏览器无法处理框架！
		</body>
	</noframes>

</html>