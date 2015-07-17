<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%@include file="/headDeclare.jsp"%>
		<script language="javascript">
function changeArea(areaId, areaName) {
	document.getElementById('areaName').value = areaName;
	document.getElementById('belongAreaId').value = areaId;
	document.getElementById('belongAreaName').innerText = areaName;
}

function checkSubmit() {
	var rightname = document.getElementById('right.rightName');
	var rightmark = document.getElementById('right.rightMark');
	var righturl = document.getElementById('right.rightURL');
	//var error = document.getElementById('error');
	var reg = /^[a-zA-Z0-9\u4E00-\u9FFF]{2,20}$/;
	if (!reg.test(trim(rightname.value))) {
		rightname.focus();
		alert("权限名称不可为空，且必须由2至20位字母、数字和汉字组成!");
		return false;
	}
	/**
	if (rightOnly(trim(rightname.value))) {
		error.innerHTML = "该权限名已存在，请重新输入!";
		document.getElementById('belongAreaId').value = "";
		return false;
	}
	if (isRightUse(trim(rightname.value), trim(rightmark.value),
			trim(righturl.value))) {
		error.innerHTML = "权限名称、权限标识或权限URL已被使用!";
		document.getElementById('belongAreaId').value = "";
		return false;
	}
	 **/
	if (!checkData(false, 'right.rightMark', "权限标识", 1, 50)) {
		return false;
	}
	var rightURL = document.getElementById('right.rightURL').value;
	if (!isNull(trim(rightURL)) && rightURL.length > 100) {
		alert("URL指向由1至100位任意字符组成");
		return false;
	}

	if (!checkData(false, 'right.memo', "备注", 1, 255)) {
		return false;
	}

	return true;
}

function rightOnly(rightname) {
	var flag = false;
	$.post("coreajax/rightInsert!isOnlyRightName.action?", {
		"right.rightName" : rightname
	}, function(result) {
		$(eval(result)).each(function(id, value) {
			if (value.ans == "1") {
				flag = true;
			}
		});
	});
	var t = setTimeout("return flag;", 1000)
}

function isRightUse(name, mark, url) {
	var flag = false;
	$.post("coreajax/rightInsert!isRightUse.action", {
		"right.rightName" : name,
		"right.rightMark" : mark,
		"right.rightURL" : url
	}, function(result) {
		$(eval(result)).each(function(id, value) {
			if (value.isTrue == '1')
				flag = true;
		});
	});
	var t = setTimeout("return flag;", 1000)
}
</script>
	</head>
	<body>
		<form action="${basePath}core/rightInsert!insertRight.action"
			method="post">
			<div id="rightcontent">
				<div id="road" class="road">
					<div class="roadItem">
						<div class="roadIcon"></div>
						<div class="roadItem2">
							您当前位置：系统管理 &gt; 权限管理  &gt; 新增权限
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
											权限信息
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
								<input type="hidden" value="${right.upRightId}"
									name="right.upRightId" />
								<input type="hidden" name="right.belongArea.id" value='1' />
								<input type="hidden" name="right.available" value='1' />
								<tr>
									<td width="200" class="tableitem1">
										权限名称：
									</td>
									<td class="tableitem3">
										<input type="text" id="right.rightName" name="right.rightName"
											value="${right.rightName}" maxlength="20" />
										<FONT color=red>*</FONT>
									</td>
								</tr>
								<tr>
									<td width="200" class="tableitem4">
										权限标识：
									</td>
									<td class="tableitem2">
										<input type="text" id="right.rightMark" name="right.rightMark"
											value="${right.rightMark}" maxlength="50" />
									</td>
								</tr>
								<tr>
									<td width="200" class="tableitem1">
										URL指向：
									</td>
									<td class="tableitem3">
										<input type="text" id="right.rightURL" name="right.rightURL"
											value="${right.rightURL}" maxlength="100" />
									</td>
								</tr>
								<tr>
									<td class="tableitem4">
										是否菜单：
									</td>
									<td class="tableitem2">
										<ld:select groupName="yesOrNoInt"
											exceptValue="${options.common.ALL}" name="right.isMenu"
											value="${right.isMenu}" className="dmg-select" />
									</td>
								</tr>
								<tr>
									<td class="tableitem1">
										授权方式：
									</td>
									<td class="tableitem3">
										<ld:select groupName="authorization" name="right.isInherit"
											value="${right.isInherit}" className="dmg-select" />
									</td>
								</tr>
								<tr>
									<td class="tableitem4">
										是否记录：
									</td>
									<td class="tableitem2">
										<ld:select groupName="yesOrNoInt" name="right.logable"
											value="${right.logable}" exceptValue="${options.common.ALL}" />
									</td>
								</tr>
								<tr>
									<td class="tableitem1">
										备注：
									</td>
									<td class="tableitem3">
										<label for="textarea"></label>
										<textarea name="right.memo" id="right.memo" cols="45" rows="5"
											maxlength="255">${right.memo}</textarea>
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
											<ld:check mark="rightInsertCommit">
												<input type="submit" value="确 定" class="button4"
													onMouseOver="this.className='button4Over'"
													onMouseOut="this.className='button4Out'"
													onclick="return checkSubmit();" />
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


