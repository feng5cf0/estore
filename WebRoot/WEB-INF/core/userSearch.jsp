<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%@include file="/headDeclare.jsp"%>
		<c:if test="${operateSuccess}">
			<script type="text/javascript">
window.parent.rightTree.location.reload();
</script>
		</c:if>
		<script type="text/javascript">
function resetPassword(id, page) {
	var r = confirm("确定重置密码吗？");
	if (r) {
		document.getElementById("statusForm").action = "${basePath}core/userUpdate!updatePassword.action?user.id="
				+ id + '&pager.curPageNum=' + page;
		document.statusForm.submit();
	}
}
function setAvailable(id, page) {
	if (id == 1) {
		alert("该用户为系统的超级管理员用户，不得设为无效");
	} else {
		document.getElementById("statusForm").action = "${basePath}core/userUpdate!updateStatus.action?user.id="
				+ id + '&pager.curPageNum=' + page;
		document.statusForm.submit();
	}
}
</script>
		<script type="text/javascript">

function addItem() {
	var returnValue = showLargeDialog("${basePath}core/userInsert!prepare.action");
	if (!!returnValue) {
		showLargeDialog("${basePath}core/userSearch!getUserDetail.action?user.id="
				+ returnValue);
		document.pagerForm['pager.curPageNum'].value = 1;
		document.pagerForm['user.userName'].value = "";
		document.pagerForm['user.userAlias'].value = "";
		document.pagerForm['user.userNum'].value = "";
		document.pagerForm.submit();
	}
	document.pagerForm.submit();

}

function editItem(id) {
	var returnValue = showLargeDialog("${basePath}core/userUpdate!prepare.action?user.id="
			+ id);
	if (!!returnValue) {
		showLargeDialog("${basePath}core/userSearch!getUserDetail.action?user.id="
				+ returnValue);
		window.pagerForm.submit();
	}
}
function setRight(id) {
showUpdateDialog("${basePath}core/roleUpdateRight!prepare.action?targetRoleId=" +id+"&pager.curPageNum=${pager.curPageNum}");
		}
		function deleteItems(){
		if(isCheckboxSelected('deleteForm')){
			document.deleteForm.submit();
			}
		}
		
		function showItem(id){
			showDialog("${basePath}core/userSearch!getUserDetail.action?user.id="+id+"&pager.curPageNum=${pager.curPageNum}");

		}
		
		
		</script>
	</head>
	<body>
		<div id="rightcontent">
			<div id="road" class="road">
				<div class="roadItem">
					<div class="roadIcon"></div>
					<div class="roadItem2">
						您当前位置：系统管理 &gt; 用户管理
					</div>
				</div>
			</div>
			<div class="roadbody1">
				<div class="roadbody">
					<div class="roadbody">
						<form action="${basePath}core/userSearch!searchUser.action">
							<table class="rightseach2">
								<tr>
									<td width="16%" align="right">
										<label for="textfield">
											登录名称：
										</label>
									</td>
									<td width="16%" align="left">
										<input name="user.userAlias" type="text" class="dmg-input"
											id="user.userAlias" value="${user.userAlias}" />
									</td>
									<td width="7%" align="right">
										<label for="textfield">
											用户编码：
										</label>
									</td>
									<td width="12%" align="left">
										<input name="user.userNum" type="text" class="dmg-input"
											id="user.userNum" value="${user.userNum}" />
									</td>
									<td width="24%"></td>
								</tr>
								<tr>
									<td width="16%" align="right">
										<label for="textfield">
											用户全称：
										</label>
									</td>
									<td width="16%" align="left">
										<input name="user.userName" type="text" class="dmg-input"
											id="user.userName" value="${user.userName}" />
									</td>
									<td width="16%" align="right">
										<label for="textfield">
											用户状态：
										</label>
									</td>
									<td width="16%" align="left">
										<ld:select id="user.available" name="user.available"
											groupName="availableAll" value="${user.available}"
											className="dmg-select" />
									</td>
									<td width="24%">
										<input type="submit" value="查询" class="button2"
											onmouseover="this.className='button2Over'"
											onmouseout="this.className='button2Out'" />
										<input type="hidden" value="0" name="pager.curPageNum" />
									</td>
								</tr>
							</table>
						</form>
					</div>
					<div class="righttitle">
						<div class="tab1">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td class="tabl">
										&nbsp;
									</td>
									<td class="tabm">
										用户管理
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
					<div class="buttonbg">
						<div class="divbutton">
							<ld:check mark="userInsert">
								<input type="button" value="新增" class="button2"
									onMouseOver="this.className='button2Over'"
									onMouseOut="this.className='button2Out'" onclick="addItem();" />
							</ld:check>
						</div>
					</div>
					<div class="divtable">
						<table width="100%" border="0" cellspacing="1" cellpadding="0"
							bgcolor="#cecece">
							<form action="${basePath}core/userSearch!searchUser.action"
								method="post" name="statusForm" id="statusForm">
								<input name="user.userName" type="hidden"
									value="${user.userName}" />
								<input name="user.userAlias" type="hidden"
									value="${user.userAlias}" />
								<input name="user.userNum" type="hidden" value="${user.userNum}" />
								<input name="user.available" type="hidden"
									value="${user.available}" />
							</form>
							<tr class="listtitle">
								<td>
									序号
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
								<td>
									创建时间
								</td>
								<td>
									创建人
								</td>
								<td>
									操作
								</td>
							</tr>

							<c:forEach items="${userList}" var="item" varStatus="status">
								<tr
									onMouseOver="this.className='tableitem9';this.style.cursor='hand';"
									onMouseOut="this.className='tableitem${6-status.index%2}';this.style.cursor='hand';"
									class="tableitem${6-status.index%2}"
									<ld:check mark="userDetail">onclick="showItem(${item.id});"</ld:check>>
									<td>
										${status.count}
									</td>
									<td>
										<c:out value="${item.userAlias}" />
									</td>
									<td>
										<c:out value="${item.userNum}" />
									</td>
									<td>
										<c:out value="${item.userName}" />
									</td>

									<td>
										<ld:rightMark>
											<ld:check mark="userStatusUpdate">
												<a
													href="javascript:setAvailable(${item.id},${pager.curPageNum});"><ld:option
														groupName="available" value="${item.available}" /> </a>
											</ld:check>
											<ld:fail>
												<ld:option groupName="available" value="${item.available}" />
											</ld:fail>
										</ld:rightMark>
									</td>
									<td>
										<f:formatDate value="${item.createTime}"
											pattern="yyyy-MM-dd HH:mm:ss" />
									</td>
									<td>
										<c:out value="${item.creator.userName}" />
									</td>
									<td>
										<div class="button3body">
											<table border="0" align="center" cellpadding="0"
												cellspacing="2">
												<tr>
													<td>
														<ld:check mark="userUpdate">
															<input type="button" value="编辑" class="button3"
																onMouseOver="this.className='button3Over'"
																onMouseOut="this.className='button3Out'"
																onclick="editItem(${item.id});" />
														</ld:check>
													</td>
													<td>
														<ld:check mark="userPasswordReset">
															<input type="button" value="密码重置" class="button3"
																onMouseOver="this.className='button3Over'"
																onMouseOut="this.className='button3Out'"
																onclick="javascript:resetPassword(${item.id},${pager.curPageNum});" />
														</ld:check>
													</td>
													<td width="17" class="line">
														&nbsp;
													</td>
												</tr>
											</table>
										</div>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="tablebottom">
						<div class="tablebottomright">
							<form
								action="${basePath}core/userSearch!searchUser.action"
								method="post" name="pagerForm" class="dmg-listli-item2">
								<input name="user.userName" type="hidden"
									value="${user.userName}" />
								<input name="user.userAlias" type="hidden"
									value="${user.userAlias}" />
								<input name="user.userNum" type="hidden" value="${user.userNum}" />
								<input name="user.available" type="hidden"
									value="${user.available}" />
								<ld:pager type="form" action="pagerForm" />
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>

