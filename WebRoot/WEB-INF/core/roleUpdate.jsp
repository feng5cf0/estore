<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%@include file="/headDeclare.jsp"%>
		<script type="text/javascript">
function changeArea(areaId, areaName) {
	document.getElementById('areaName').value = areaName;
	document.getElementById('belongAreaId').value = areaId;
	document.getElementById('belongAreaName').innerText = areaName;
}

function checkSubmit(id) {
	var roleName = document.getElementById('role.roleName');
	//var error = document.getElementById('error');
	var reg = /^[a-zA-Z0-9\u4E00-\u9FFF]{2,8}$/;
	if (!reg.test(trim(roleName.value))) {
		roleName.focus();
		//error.innerHTML = "角色名称不可为空，且必须由2至8位字母、数字或汉字组成!";
		alert("角色名称不可为空，且必须由2至8位字母、数字或汉字组成!");
		return false;
	}
	/**
	if (roleOnly(trim(roleName.value), id)) {
		error.innerHTML = "该角色名已存在，请重新输入!";
		return false;
	}
	 **/
	if (!checkData(false, 'role.memo', "备注", 1, 255)) {
		return false;
	}

	return true;
}

function roleOnly(rolename, id) {
	var flag = false;
	$.post("coreajax/roleInsert!isOnlyRoleName.action", {
		"role.roleName" : rolename,
		"role.id" : id
	}, function(result) {
		$(eval(result)).each(function(id, value) {
			if (value.ans == "1") {
				flag = true;
			}
		});
	});
	var t = setTimeout("return flag;", 1000)
}
</script>
	</head>

	<body>
		<form action="${basePath}core/roleUpdate!updateRole.action"
			method="post">
			<div id="rightcontent">
				<div id="road" class="road">
					<div class="roadItem">
						<div class="roadIcon"></div>
						<div class="roadItem2">
							您当前位置：系统管理 &gt; 角色管理 &gt; 编辑角色
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
											角色信息
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
						<div class="buttonbg1"></div>
						<div class="divtable">

							<table width="100%" border="0" cellspacing="1" cellpadding="0"
								bgcolor="#cecece">
								<input type="hidden" name="pager.curPageNum"
									value="${pager.curPageNum}" />
								<input type="hidden" name="role.id" value="${role.id}" />
								<input type="hidden" name="role.createTime"
									value="${role.createTime}" />
								<input type="hidden" name="role.creator.id"
									value="${role.creator.id}" />
								<input type="hidden" name="role.belongArea.id" value='1' />
								<tr>
									<input type="hidden" name="pager.curPageNum"
										value="${pager.curPageNum}" />
									<input type="hidden" name="role.belongArea.id" value='1' />

									<td width="200" class="tableitem1">
										角色名称：
									</td>
									<td class="tableitem3">
										<input type="text" name="role.roleName" id="role.roleName"
											value="${role.roleName}" class="dmg-input" maxlength="8" />
										<FONT color=red>*</FONT>
									</td>
								</tr>
								<tr>
									<td class="tableitem4">
										是否有效：
									</td>
									<td class="tableitem2">
										<ld:select id="role.available" name="role.available"
											groupName="available" value="${role.available}"
											className="dmg-select" />
									</td>
								</tr>
								<tr>
									<td class="tableitem1">
										备注：
									</td>
									<td class="tableitem3">
										<label for="textarea"></label>
										<textarea name="textarea" id="role.memo " cols="45" rows="5"
											maxlength="255">${role.memo}</textarea>
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
											<ld:check mark="roleUpdateCommit">
												<input type="submit" value="确 定" class="button4"
													onMouseOver="this.className='button4Over'"
													onMouseOut="this.className='button4Out'"
													onclick="return checkSubmit(${role.id});" />
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

