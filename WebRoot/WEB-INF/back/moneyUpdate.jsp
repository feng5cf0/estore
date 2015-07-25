<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<script type="text/javascript">
function changeArea(areaId, areaName) {
	document.getElementById('areaName').value = areaName;
	document.getElementById('belongAreaId').value = areaId;
	document.getElementById('belongAreaName').innerText = areaName;
}

function checkSubmit() {
	//var roleName = document.getElementById('role.roleName');
	//var error = document.getElementById('error');
	//var reg = /^[a-zA-Z0-9\u4E00-\u9FFF]{2,8}$/;
	//if (!reg.test(trim(roleName.value))) {
	//	roleName.focus();
	//	alert("角色名称不可为空，且必须由2至8位字母、数字或汉字组成!");
	//	return false;
	//}
	/**
	 if (roleOnly(trim(roleName.value))) {
	 error.innerHTML = "该角色名已存在，请重新输入!";
	 return false;
	 }
	 **/
	////if (!checkData(false, 'role.memo', "备注", 1, 255)) {
		//return false;
	//}

	return true;
}

function roleOnly(rolename) {
	var flag = false;
	$.post("coreajax/roleInsert!isOnlyRoleName.action", {
		"role.roleName" : rolename
	}, function(result) {
		//alert(result)
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

	<body style="overflow: auto">
		<form action="${basePath}back/moneyAction!updateMoney.action"
			method="post">
			<div id="rightcontent">
				<div id="road" class="road">
					<div class="roadItem">
						<div class="roadIcon"></div>
						<div class="roadItem2">
							您当前位置：系统管理 &gt; 汇率管理 &gt; 修改货币
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
											货币信息
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
								<tr>
									<input type="hidden" value="money.id"/>
									<input type="hidden" name="pager.curPageNum"
										value="${pager.curPageNum}" />

									<td width="200" class="tableitem1">
										货币名称：
									</td>
									<td class="tableitem3">
										<input type="text" name="money.moneyName" id="money.moneyName"
											value="${money.moneyName}" class="dmg-input" maxlength="8" />
										<FONT color=red>*</FONT>
									</td>
								</tr>
								<tr>
									<td class="tableitem4">
										对人民币汇率：
									</td>
									<td class="tableitem2">
										<input type="text" name="money.rate" id="money.rate"
											value="${money.rate}" class="dmg-input" maxlength="8" />
										<FONT color=red>*</FONT>
									</td>
								</tr>
								<tr>
									<td class="tableitem1">
										备注：
									</td>
									<td class="tableitem3">
										<label for="textarea"></label>
										<textarea name="textarea" id="money.memo" cols="45" rows="5"
											maxlength="255">${money.memo}</textarea>
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
											<ld:check mark="moneyManager">
												<input type="submit" value="修改" class="button4"
													onmouseover="this.className='button4Over'"
													onmouseout="this.className='button4Out'"
													onclick="return checkSubmit();" />
											</ld:check>
										</td>
										<td>
											&nbsp;
										</td>
										<td align="center">
											<input type="button" value="返回" class="button4"
												onmouseover="this.className='button4Over'"
												onmouseout="this.className='button4Out'"
												onclick="window.history.go(-1);" />
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


