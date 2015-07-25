<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<html>
	<head>
		<%@include file="/headDeclare.jsp"%>
		<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
		<script type="text/javascript" src="js/jquery.messager.js"></script>
		
		<script type="text/javascript">
   			function showAlarm(){
   				alert("showalarm!");
   				$.messager.lays(300,200);
   				alert("ok1");
			    $.messager.show("信息提示","你有待处理的会员留言,请点击查看",0,toMessagePage);
		    }
		    
		    function toMessagePage(){
		    	alert("ok2");
		    	//location.href("http://localhost:8080/estore");
		    }
		</script>
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




	
