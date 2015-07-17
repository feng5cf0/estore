<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<html>
	<head>
		<c:if test="${operateSuccess}">
			<script type="text/javascript">
window.parent.rightTree.location.reload();
</script>
		</c:if>
		<script type="text/javascript">
function addItem(id, name) {
	var flag = window.parent.userChoose.checkItem(id, name);
	//alert(flag);
	if (!flag) {
		return;
	}
	var divStr = "<div class=\"dmg-listli-ry\" id=\"divId" + id + "\" >";
	var inputStr = "<input type=\"hidden\" id=\"inputId" + id
			+ "\" name=\"userIds\" value=\"" + id + "\" />";
	var labelStr = "<label id=\"txt" + id + "\">" + name + "</label>";
	var img = "<img id=\"img"
			+ id
			+ "\" width=\"22\" height=\"25\" style=\"cursor:pointer;\" onmouseout=\"this.src='css/images/deldd.png'\" onmousemove=\"this.src='css/images/delddon.png'\" onclick=\"removeThis("
			+ id + ");\" src=\"css/images/deldd.png\" complete=\"complete\"/>";
	window.parent.userChoose.document.getElementById('insertDiv').innerHTML += divStr
			+ labelStr + img + inputStr + "</div>";
	window.parent.userChoose.addArr(id);
}

function showItem(id) {
showDialog("${basePath}core/userSearch!getUserDetail.action?user.id="+id+"&pager.curPageNum="+${pager.curPageNum});

		}
		function confirm(){
			document.deleteForm.action="${basePath}core/roleUserInsert!insertRoleUser.action?role.id=${role.id}";
			document.deleteForm.submit();
		}
		
		function onSelectAllChange(elem, selectIds) {
			var selectElems = document.getElementsByName(selectIds);
			for ( var i = 0; i < selectElems.length; i++) {
				if (selectElems[i].disabled == false) {
					selectElems[i].checked = elem.checked;
				}
			}
		}

		function addSelectItem(selectIds, name) {
			var selectElems = document.getElementsByName(selectIds);
			for ( var i = 0; i < selectElems.length; i++) {
				var elem = selectElems[i];
				if (elem.checked == true) {
					var showName = document.getElementById(name + elem.value).childNodes[0].nodeValue
							.trim();
					if (elem.disabled == false) {
						addItem(elem.value, showName);
					}
				}
			}
		}
		
		function chooseRadioByParent(elem) {
			elem.getElementsByTagName('input')[0].checked = "checked";
		}
		</script>
	</head>
	<body>
		<div id="rightcontent">
			<div class="roadbody1">
				<div class="roadbody">
					<div class="roadbody">
					</div>
					<div class="righttitle">
						<div class="tab1">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td class="tabl">
										&nbsp;
									</td>
									<td class="tabm">
										用户列表
									</td>
									<td class="tabr">
									</td>
								</tr>
							</table>
						</div>
						<div class="tab4">
							<%--${error}--%>
						</div>
					</div>
					<div class="divtable">
						<table width="100%" border="0" cellspacing="1" cellpadding="0"
							bgcolor="#cecece">
							<form
								action="${basePath}core/roleDelete!deleteRole.action?pager.curPageNum=${pager.curPageNum}"
								method="post" name="statusForm" id="statusForm">
							</form>
							<tr class="listtitle">
								<td class="dmg-listli-title"><input type="checkbox"
								id="selectAllElem" class="dmg-checkbox"
								onclick="onSelectAllChange(this,'selectIds');" />
							</td>
								<td>
									登录名称
								</td>
								<td>
									用户编码
								</td>
								<td>
									用户全称
								</td>
								<td>
									状态
								</td>
							</tr>

							<c:forEach items="${userList}" var="item" varStatus="status">
								<tr
									onMouseOver="this.className='tableitem9';this.style.cursor='hand';"
									onMouseOut="this.className='tableitem${6-status.index%2}';this.style.cursor='hand';"
									class="tableitem${6-status.index%2}"
									onclick="chooseRadioByParent(this);">
									<td><input type="checkbox" value="${item.id}"
									class="dmg-checkbox" name="selectIds" />
									</td>
								<td id="name${item.id}"><c:out value="${item.userName}" />
								</td>
								<td><c:out value="${item.userAlias}" />
								</td>
								<td><c:out value="${item.userNum}" />
								</td>
								<td><ld:option groupName="available"
										value="${item.available}" />
								</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="buttonbg">
						<div class="divbutton">
							<input type="button" value="新增" class="button2"
								onMouseOver="this.className='button2Over'"
								onMouseOut="this.className='button2Out'" onclick="addSelectItem('selectIds','name');" />
						</div>
					</div>
					<div class="tablebottom">
						<div class="tablebottomright">
							<form
								action="${basePath}core/roleUserInsert!getUserToInsertRoleUser.action?role.id=${role.id}&areaMark=${areaMark}"
								method="post" name="pagerForm" class="dmg-listli-item2">
								<ld:pager type="form" action="pagerForm" />
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>

