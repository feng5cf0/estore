<%@page language="java" contentType="text/html; charset=utf-8"%>
<html>
<head>
<script type="text/javascript">
//公共弹出错误信息方法
function showError(){
	var error = "${error}";
	if(!isNull(error)){
		alert(error);
	}
}

//页面添加错误弹出方法
if (document.all){
	window.attachEvent('onload',showError);//IE中
}else{
	window.addEventListener('load',showError,false);//firefox
}
</script>
</head>
</html>
