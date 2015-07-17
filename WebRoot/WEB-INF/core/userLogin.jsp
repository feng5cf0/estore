<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/logDeclare.jsp"%>
<html>
<body onload="init()">
<script type="text/javascript">
		function init() {
	document.getElementById("user.userAlias").focus();
}

function changeToPwd() {
	if (event.keyCode == 13) {
		document.getElementById("user.password").focus();
	}
}

function changeToSubmit() {
	if (event.keyCode == 13) {
		formSubmit();
	}
}
		</script>
		<script type="text/javascript">
function topCheck() {

	if (self != top) {
		alert("您未登录或会话已超时，请重新登录！");
		top.location.href = "index.action";
	}
}
topCheck();

function formSubmit() {
	var form1 = document.getElementById("form1");
	form1.submit();
}

function cancleSubmit() {
	document.getElementById("user.userAlias").value = "";
	document.getElementById("user.password").value = "";
	document.getElementById("error").innerHTML = "";
}
</script>
		<div>
			<form action="${basePath}core/userLogin!login.action" id="form1" method="post">
		<table width="1004" height="613" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
	<tr>
		<td colspan="7">
			<img src="css/images/loginimages/login_01.gif" width="1003" height="231" alt="公司logo"></td>
		<td>
			<img src="css/images/loginimages/1.gif" width="1" height="231" alt=""></td>
	</tr>
	<tr>
		<td rowspan="8">
			<img src="css/images/loginimages/login_02.gif" width="270" height="382" alt=""></td>
		<td rowspan="7">
			<img src="css/images/loginimages/login_03.gif" width="224" height="214" alt=""></td>
		<td colspan="5">
			<img src="css/images/loginimages/login_04.gif" width="509" height="70" alt=""></td>
		<td>
			<img src="css/images/loginimages/1.gif" width="1" height="70" alt=""></td>
	</tr>
	<tr>
		<td rowspan="7">
			<img src="css/images/loginimages/login_05.gif" width="93" height="312" alt=""></td>
		<td colspan="3" background="css/images/loginimages/login_06.gif">
		<input type="text" value="${user.userAlias}" name="user.userAlias"
								id="user.userAlias" class="inputuser" onkeyup="changeToPwd()" />
		  
			</td>
		<td rowspan="7">
			<img src="css/images/loginimages/login_07.gif" width="284" height="312" alt=""></td>
		<td>
			<img src=css/images/loginimages/1.gif" width="1" height="26" alt=""></td>
	</tr>
	<tr>
		<td colspan="3">
			<img src="css/images/loginimages/login_08.gif" width="132" height="12" alt=""></td>
		<td>
			<img src="css/images/loginimages/1.gif" width="1" height="12" alt=""></td>
	</tr>
	<tr>
		<td colspan="3" background="css/images/loginimages/login_09.gif">
		<input type="password" name="user.password" id="user.password"
								value="${password}" class="inputuser" onkeyup="changeToSubmit();" />
			</td>
		<td>
			<img src="css/images/loginimages/1.gif" width="1" height="26" alt=""></td>
	</tr>
	<tr>
		<td colspan="3">
			<img src="css/images/loginimages/login_10.gif" width="132" height="34" alt=""></td>
		<td>
			<img src="css/images/loginimages/1.gif" width="1" height="34" alt=""></td>
	</tr>
	<tr>
		<td rowspan="3">
			<img src="css/images/loginimages/login_11.gif" width="15" height="214" alt=""></td>
		<td>
			<img src="css/images/loginimages/login_12.gif" width="74" height="29" alt="" onclick="formSubmit();"></td>
		<td rowspan="3">
			<img src="css/images/loginimages/login_13.gif" width="43" height="214" alt=""></td>
		<td>
			<img src="css/images/loginimages/1.gif" width="1" height="29" alt=""></td>
	</tr>
	<tr>
		<td rowspan="2">
			<img src="css/images/loginimages/login_14.gif" width="74" height="185" alt=""></td>
		<td>
			<img src="css/images/loginimages/1.gif" width="1" height="17" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="css/images/loginimages/login_15.gif" width="224" height="168" alt=""></td>
		<td>
			<img src="css/images/loginimages/1.gif" width="1" height="168" alt=""></td>
	</tr>
</table>
<div class="tab4"><table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="360" ></td>
    <td class="infoxx">${error } </td>
  </tr>
</table>
</div>
</form>
</div>
</body>
</html>




