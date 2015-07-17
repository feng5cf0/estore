<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<html>
	<head>
		<base target="_parent" />
		<script type="text/javascript">
var arr = new Array();
function checkItem(id, name) {
	if (arr != null) {
		for ( var i = 0; i < arr.length; i++) {
			if (id == arr[i]) {
				alert(name + "已在待添加列表中");
				return false;
			}
		}
	}
	return true;
}
function delArr(id) {
	if (arr != null) {
		for ( var i = 0; i < arr.length; i++) {
			if (id == arr[i]) {
				arr.remove(i);
			}
		}
	}
	//删除选中的复选框
	var selectElems = window.parent.userList.document
			.getElementsByName('selectIds');
	window.parent.userList.document.getElementById('selectAllElem').checked = false;
	for ( var i = 0; i < selectElems.length; i++) {
		if (selectElems[i].value == id) {
			selectElems[i].checked = false;
		}
	}
}
function addArr(id) {
	arr.push(id);
}

function removeThis(id) {
	var deleteId = document.getElementById("divId" + id);
	var parentNode;
	if (parentNode = deleteId.parentNode) {
		parentNode.removeChild(deleteId);
	}
	delArr(id);
}

function confirm() {
	document.insertForm.submit();
	//window.location.href = "${basePath}core/roleUserInsert!insertRoleUser.action?role.id=${role.id}";
}
</script>
	</head>
	<body style="overflow: auto">
		<div id="rightcontent">
			<div class="roadbody1">
				<div class="roadbody">
					<div class="divtable">
						<form
							action="${basePath}core/roleUserInsert!insertRoleUser.action?role.id=${role.id}"
							name="insertForm" method="post">
							<div class="dmg-listli-tzry" id="insertDiv">
							</div>
							<div class="dmg-listli-button">
								<table width="400" border="0" align="right" cellpadding="0"
									cellspacing="0">
									<tr>
										<td class="dmg-listli-item2">
											&nbsp;
										</td>
										<td class="dmg-listli-item2">
											&nbsp;
										</td>
										<td class="dmg-listli-item2">
											<ld:check mark="roleUserInsertCommit">
												<input type="button" value="确定" class="button2"
													onMouseOver="this.className='button2Over'"
													onMouseOut="this.className='button2Out'"
													onclick="confirm();" />
											</ld:check>
										</td>
										<td class="dmg-listli-item2">
											&nbsp;
										</td>
										<td class="dmg-listli-item2">
											&nbsp;
										</td>
										<td>
											&nbsp;
										</td>
									</tr>
								</table>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>

