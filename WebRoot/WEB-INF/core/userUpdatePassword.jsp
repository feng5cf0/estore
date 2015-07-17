<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%@include file="/headDeclare.jsp"%>
		<script type="text/javascript">
function checkSubmit(id) {
	var old = document.getElementById("oldPassword");
	//var error = document.getElementById("error");
	var newPass = document.getElementById("newPassword");
	var repeat = document.getElementById("repeatPassword");
	var reg = /^([A-Za-z0-9]){4,18}$/; //4到18位字母和数字的组合
	if (trim(old.value).length == 0 || old.value == "") {
		alert("旧密码不得为空，请输入旧密码");
		old.focus();
		return false;
	}
	if (trim(newPass.value).length == 0 || newPass.value == "") {
		alert("新密码不得为空，请输入新密码");
		newPass.focus();
		return false;
	}
	if (!reg.test(newPass.value)) {
		alert("新密码不可为空且必须为4至18位字母与数字组合!");
		newPass.focus();
		return false;
	}
	if (trim(repeat.value).length == 0 || repeat.value == "") {
		alert("请再次输入新密码");
		repeat.focus();
		return false;
	}
	if (newPass.value != repeat.value) {
		alert("两次输入的密码必须一致！");
		return false;
	}
	if (newPass.value == old.value) {
		alert("输入的新密码与之前的密码一致，请重新输入");
		newPass.focus();
		return false;
	}
	return true;
}
</script>
	</head>
	<body>
		<form action="${basePath}core/userUpdatePassword.action" method="post">
			<div id="rightcontent">
				<div id="road" class="road">
					<div class="roadItem">
						<div class="roadIcon"></div>
						<div class="roadItem2">
							您当前位置：用户权限管理 &gt; 修改密码
						</div>
					</div>
				</div>
				<div class="roadbody1">
					<div class="roadbody">
						<div class="righttitle">
							<div class="tab1">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td class="tabl">
											&nbsp;
										</td>
										<td class="tabm">
											修改密码
										</td>
										<td class="tabr">
											&nbsp;
										</td>
									</tr>
								</table>
							</div>
							<div class="tab4" id="error">
								<%--${error}--%>
							</div>
						</div>
						<div class="buttonbg"></div>
						<div class="divtable">
							<table width="100%" border="0" cellspacing="1" cellpadding="0"
								bgcolor="#cecece">
								<tr>
									<td width="200" class="tableitem1">
										原始密码：
									</td>
									<td class="tableitem3">
										<input type="password" class="dmg-input" name="oldPassword"
											id="oldPassword" value="${oldPassword}" />
										<FONT color=red>*</FONT>
									</td>
								</tr>
								<tr>
									<td class="tableitem4">
										新密码：
									</td>
									<td class="tableitem2">
										<input type="password" name="newPassword" id="newPassword"
											value="${newPassword}" />
										<FONT color=red>*</FONT>
									</td>
								</tr>
								<tr>
									<td class="tableitem1">
										重复新密码：
									</td>
									<td class="tableitem3">
										<input type="password" class="dmg-input" name="repeatPassword"
											id="repeatPassword" value="${repeatPassword}" />
										<FONT color=red>*</FONT>
									</td>
								</tr>
								<tr>
									<td class="tableitem1">
										&nbsp;
									</td>
									<td class="tableitem3">
										<ld:check mark="userPasswordUpdate">
											<input type="submit" value="确　定" class="button4"
												onmouseover="this.className='button4Over'"
												onmouseout="this.className='button4Out'"
												onclick="return checkSubmit(${curUser.id});" />
										</ld:check>
										<input type="button" value="关　闭" class="button4"
											onmouseover="this.className='button4Over'"
											onmouseout="this.className='button4Out'"
											onclick="window.close();"/>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</form>
	</body>
</html>

