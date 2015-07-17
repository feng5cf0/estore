<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%@include file="/headDeclare.jsp"%>
		<script type="text/javascript">
				function load(){
					var info='${successInfo}';
					if(info!=null&&info!=""){
					var info=info.replace("&","\n")
					//document.getElementById('successInfo').contentEditable=true;
					document.getElementById('successInfo').value=info;
					}
				}
				
				
		</script>
	</head>
	<body onload=load();>
		<div class="doing">
			<div class="font24">
				您的操作已成功！
			</div>
			<div class="infoxx4">
				<lebal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</lebal>
				<textarea id="successInfo" rows="4" cols="20" readonly="readonly"
					class="success-input"></textarea>
				<div>
					&nbsp;
				</div>
				<div class="centent">
					<lebal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</lebal>
					<input type="button" value="确　定" class="button4"
						onmouseover="this.className='button4Over'"
						onmouseout="this.className='button4Out'" onclick="window.close();" />
				</div>
			</div>
		</div>
	</body>
</html>



