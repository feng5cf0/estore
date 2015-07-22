<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%@include file="/headDeclare.jsp"%>
		<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
		<script type="text/javascript" src="js/jquery.messager.js"></script>
		
		<script type="text/javascript">
			alert();
   			function showAlarm(){
   				alert("showalarm!");
   				$.messager.lays(300,200);
   				alert("ok1");
			    $.messager.show("信息提示","供电单位下存在待处理的异常信息,请点击查看",0,toMessagePage);
		    }
		    
		    function toMessagePage(){
		    	alert("ok2");
		    	//location.href("http://localhost:8080/estore");
		    }
		</script>
	</head>
	<body onload="showAlarm();">
		<div class="doing">
			<div class="font24">
				您的操作已成功！
			</div>
			<div></div>
			<div class="centent">
				<input type="button" value="确　定" class="button4"
					onmouseover="this.className='button4Over'"
					onmouseout="this.className='button4Out'" onclick="confirm();" />
			</div>
		</div>
	</body>
</html>



