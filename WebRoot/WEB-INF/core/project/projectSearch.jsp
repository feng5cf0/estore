<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%@include file="/headDeclare.jsp"%>
		<script type="text/javascript">

function showDetail(id) {
	showSmallDialog("${basePath}core/projectSearch!detail.action?project.id="
			+ id);
}

function showTable() {
	document.getElementById("table").style.display = "";
	document.getElementById("pager").style.display = "";

}

function addItem() {
	var returnValue = showMediumDialog("${basePath}core/projectInsert!prepare.action");
	if (!!returnValue) {
		showSmallDialog("${basePath}core/projectSearch!detail.action?project.id="
				+ returnValue);
		document.pagerForm['pager.curPageNum'].value = 1;
		document.pagerForm['project.projectName'].value = "";
		window.pagerForm.submit();
	}
}

function editItem(id) {

	var returnValue = showSmallDialog("${basePath}core/projectUpdate!prepare.action?project.id="
			+ id);
	if (!!returnValue) {
		showSmallDialog("${basePath}core/projectSearch!detail.action?project.id="
				+ returnValue);
		//document.pagerForm['pager.curPageNum'].value=1;
		window.pagerForm.submit();
	}
}
function deleteItems() {
	if (isCheckboxSelected('deleteForm')) {
		document.deleteForm.submit();
	}
}
</script>
	</head>
	<body>
		<div id="rightcontent">
			<div id="road" class="road">
				<div class="roadItem">
					<div class="roadIcon"></div>
					<div class="roadItem2">
						您当前位置：系统管理 &gt; 项目管理
					</div>
				</div>
			</div>
			<div class="roadbody1">
				<div class="roadbody">
					<div class="roadbody">
						<form action="core/projectSearch!searchProject.action"
							method="post">
							<table class="rightseach2">
								<tr>
									<td width="16%" align="right">
										<label for="textfield">
											项目名称：
										</label>
									</td>
									<td width="16%" align="left">
										<input name="project.projectName" type="text"
											class="dmg-input" id="project.projectName" maxlength="30"
											value="${project.projectName}" />
									</td>
									<td width="24%">
										<input type="submit" value="查询" class="button2"
											onmouseover="this.className='button2Over'"
											onmouseout="this.className='button2Out'" />
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
										项目管理
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
						<div class="divbutton2">
							<ld:check mark="projectInsert">
								<input type="button" value="新增" class="button2"
									onMouseOver="this.className='button2Over'"
									onMouseOut="this.className='button2Out'" onclick="addItem();" />
							</ld:check>
						</div>
						<div class="divbutton2">
							<ld:check mark="projectDelete">
								<input type="submit" value="删除" class="button2"
									onMouseOver="this.className='button2Over'"
									onMouseOut="this.className='button2Out'"
									onclick="deleteItems();" />
							</ld:check>
						</div>
					</div>
					<div class="divtable">
						<table width="100%" border="0" cellspacing="1" cellpadding="0"
							bgcolor="#cecece">
							<form action="${basePath}core/projectDelete!deleteProject.action"
								method="post" name="deleteForm">
								<tr class="listtitle">
									<td>
										选择
									</td>
									<td>
										项目ID
									</td>
									<td>
										项目名称
									</td>
									<td>
										操作
									</td>
								</tr>

								<c:forEach items="${projectList}" var="item" varStatus="status">
									<tr
										onMouseOver="this.className='tableitem9';this.style.cursor='hand';"
										onMouseOut="this.className='tableitem${6-status.index%2}';this.style.cursor='hand';"
										class="tableitem${6-status.index%2}"
										<ld:check mark="projectDetail">onclick="showDetail(${item.id});"</ld:check>>
										<td>
											<input type="checkbox" name="delete" id="delete"
												value="${item.id}" />
										</td>
										<td>
											${item.id}
										</td>
										<td>
											${item.projectName}
										</td>
										<td>
											<div class="button3body">
												<table border="0" align="center" cellpadding="0"
													cellspacing="2">
													<tr>
														<td>
															<input type="button" value="编辑" class="button3"
																onMouseOver="this.className='button3Over'"
																onMouseOut="this.className='button3Out'"
																onclick="editItem(${item.id});" />
														</td>
													</tr>
												</table>
											</div>
										</td>
									</tr>
								</c:forEach>
						</table>
					</div>
					</form>
					<div class="tablebottom">
						<div class="tablebottomright">
							<form action="${basePath}core/projectSearch!searchProject.action"
								method="post" name="pagerForm" class="dmg-listli-item2">

								<input name="project.projectName" type="hidden"
									value="${project.projectName}" />
								<ld:pager type="form" action="pagerForm" />
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>

