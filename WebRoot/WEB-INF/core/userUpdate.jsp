<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@include file="/headDeclare.jsp"%>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script type="text/javascript">
function changeArea(areaId, areaName) {
	document.getElementById('areaName').value = areaName;
	document.getElementById('belongAreaId').value = areaId;
	document.getElementById('belongAreaName').innerText = areaName;
}

function checkSubmit(id) {
	var username = document.getElementById('user.userName');
	//var error = document.getElementById('error');
	var reg = /^[a-zA-Z0-9\u4E00-\u9FFF]{4,8}$/;
	//if (id == 1) {
	//	error.innerHTML = "无权对超级管理员用户进行编辑!";
	//	return false;
	//}
	/**
	if (!reg.test(trim(username.value)) || username.value == '') {
		username.focus();
		error.innerHTML = "用户全称不可为空，且必须由4至8位字母、数字或汉字组成!";
		return false;
	}

	if (userOnly(trim(username.value), id)) {
		error.innerHTML = "该地区的该用户名已存在，请重新输入!";
		return false;
	}
	 **/
	if (!checkData(true, 'user.userAlias', "登录名称", 2, 8)) {
		return false;
	}
	if (!checkData(true, 'user.userNum', "用户编码", 2, 8)) {
		return false;
	}
	if (!checkData(true, 'user.userName', "用户全称", 2, 8)) {
		return false;
	}
	var newId = document.getElementById('belongAreaId').value;
	if (newId == '') {
		alert("请选择用户归属部门!");
		return false;
	}
	if (!checkData(false, 'user.memo', "备注", 1, 255)) {
		return false;
	}
	return true;
}

function userOnly(username, id) {
	var flag = false;
	$.post("coreajax/userInsert!isOnlyUser.action", {
		"user.userName" : username,
		"user.id" : id
	}, function(result) {
		$(eval(result)).each(function(id, value) {
			if (value.ans == "1") {
				flag = true;
			}
		});
	});
	return flag;
}
</script>
	</head>

	<body style="overflow: auto">
		<form action="core/userUpdate!updateUser.action" method="post">
			<div id="rightcontent">
				<div id="road" class="road">
					<div class="roadItem">
						<div class="roadIcon"></div>
						<div class="roadItem2">
							您当前位置：系统管理 &gt; 用户管理 &gt; 编辑用户
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
											用户信息
										</td>
										<td class="tabr">
										</td>
									</tr>
								</table>
							</div>
							<div class="tab4" id="error">
								<%--${error}--%>
							</div>
						</div>

						<div class="divtable">
							<table width="100%" border="0" cellspacing="1" cellpadding="0"
								bgcolor="#cecece">
								<input type="hidden" name="pager.curPageNum"
									value="${pager.curPageNum}" />
								<input type="hidden" name="user.id" value="${user.id}" />
								<input type="hidden"
									value="<f:formatDate value="${user.createTime}" pattern="yyyy-MM-dd HH:mm:ss" />"
									name="user.createTime" />
								<input type="hidden" value="${user.creator.id}"
									name="user.creator.id" />
								<tr>
									<td width="200" class="tableitem1">
										登录名称：
									</td>
									<td class="tableitem3">
										<input name="user.userAlias" type="text" class="dmg-input"
											id="user.userAlias" value="${user.userAlias}" maxlength="8" />
										<FONT color=red>*</FONT>
									</td>
								</tr>
								<tr>
									<td class="tableitem4">
										用户编码：
									</td>
									<td class="tableitem2">
										<input name="user.userNum" type="text" class="dmg-input"
											id="user.userNum" value="${user.userNum}" maxlength="8" />
										<FONT color=red>*</FONT>
									</td>
								</tr>
								<tr>
									<td width="200" class="tableitem1">
										用户全称：
									</td>
									<td class="tableitem3">
										<input type="text" class="dmg-input" id="user.userName"
											name="user.userName" value="${user.userName}" maxlength="8" />
										<FONT color=red>*</FONT>
									</td>
								</tr>
								<tr>
									<td class="tableitem4">
										是否有效：
									</td>
									<td class="tableitem2">
										<ld:select groupName="available" name="user.available"
											value="${user.available}" className="dmg-select" />
									</td>
								</tr>
								<tr>
									<td class="tableitem1">
										<input type="hidden" name="user.belongArea.id"
											id="belongAreaId" value="${user.belongArea.id}" />
										<input type="hidden" name="user.belongArea.areaName"
											id="areaName" value="${user.belongArea.areaName}" />

										所属部门：
									</td>
									<td class="tableitem3" id="belongAreaName">
										${user.belongArea.areaName}
									</td>
								</tr>
								<tr>
									<td class="tableitem4">
										请选择部门：
									</td>
									<td class="tableitem2">
										<script type="text/javascript">
d = new dTree('d');<c:forEach items="${areaList}" var="item" varStatus="status">
																							<c:choose>
																								<c:when test="${status.first}">
																									d.add(${item.id},-1,"${item.areaName}","javascript:changeArea('${item.id}','${item.areaName}');");
																								</c:when>
																								<c:otherwise>
																									d.add(${item.id},${item.superAreaId},"${item.areaName}","javascript:changeArea('${item.id}','${item.areaName}');");
																								</c:otherwise>
																							</c:choose>
																						</c:forEach>
																						d.config.useSelection = false;
																						d.config.useIcons=false;
																						document.write(d);
																					</script>
									</td>
								</tr>
								<tr>
									<td class="tableitem1">
										备注：
									</td>
									<td class="tableitem3">
										<label for="textarea"></label>
										<textarea name="user.memo" id="user.memo" cols="45" rows="5">${user.memo}</textarea>
									</td>
								</tr>
							</table>
						</div>
						<div class="tablebottom">
							<div class="button4body">
								<table width="100%" border="0" align="center" cellpadding="0"
									cellspacing="1">
									<tr>
										<td align="center">
											<ld:check mark="userUpdateCommit">
												<input type="submit" value="确 定" class="button4"
													onMouseOver="this.className='button4Over'"
													onMouseOut="this.className='button4Out'"
													onclick="return checkSubmit(${user.id});" />
											</ld:check>
										</td>
										<td>
											&nbsp;
										</td>
										<td align="center">
											<input type="button" value="关 闭" class="button4"
												onMouseOver="this.className='button4Over'"
												onMouseOut="this.className='button4Out'"
												onclick="window.close();" />
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</body>
</html>


