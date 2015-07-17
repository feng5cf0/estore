<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%@include file="/headDeclare.jsp"%>
		<script type="text/javascript">
function selectContract() {
	var winFeatures = 'dialogHeight:500px;dialogWidth:1024px;center:yes;resizable=yes';
	var parameterObj = new Array();
	parameterObj.selectContract = true;
	parameterObj.dialog = true;

	var re = window.showModalDialog("contractSelect.html", parameterObj,
			winFeatures);
}

function showShoppeDetail(id) {
	showDialog("${basePath}lease/counterSearch!detail.action?counter.id=" + id);

	//var re = window.showModalDialog("counterDetail.html",parameterObj,winFeatures);
}

function showDetail(id) {
	showSmallDialog("${basePath}core/checkstandVersionSearch!detail.action?checkstandVersion.id="
			+ id);
}

function showTable() {
	document.getElementById("table").style.display = "";
	document.getElementById("pager").style.display = "";

}

function addItem() {
	var returnValue = showMediumDialog("${basePath}core/checkstandVersionInsert!prepare.action");
	if (!!returnValue) {
		showSmallDialog("${basePath}core/checkstandVersionSearch!detail.action?checkstandVersion.id="
				+ returnValue);
		document.pagerForm['pager.curPageNum'].value = 1;
		document.pagerForm['checkstandVersion.versionNum'].value = "";
		document.pagerForm['checkstandVersion.posType.id'].value = "";
		document.pagerForm['checkstandVersion.project.id'].value = "";
		document.pagerForm['checkstandVersion.platform.id'].value = "";
		window.pagerForm.submit();
	}
}

function editItem(id) {

	var returnValue = showSmallDialog("${basePath}core/checkstandVersionUpdate!prepare.action?checkstandVersion.id="
			+ id);
	if (!!returnValue) {
		showSmallDialog("${basePath}core/checkstandVersionSearch!detail.action?checkstandVersion.id="
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
				<div id="road" class="road">
					<div class="roadItem">
						<div class="roadIcon"></div>
						<div class="roadItem2">
							您当前位置：系统管理 &gt; 软件升级
						</div>
					</div>
				</div>
			</div>
			<div class="roadbody1">
				<div class="roadbody">
					<div class="roadbody">
						<form action="core/checkstandVersionSearch!query.action"
							method="post">
							<table class="rightseach2">
								<tr>
									<td width="16%" align="right">
										<label for="textfield">
											项目名称：
										</label>
									</td>
									<td width="16%" align="left">
										<ld:select value="${checkstandVersion.project.id}"
											groupName="projectList" name="checkstandVersion.project.id"
											className="dmg-select" />
									</td>
									<td width="16%" align="right">
										<label for="textfield">
											平台：
										</label>
									</td>
									<td width="16%" align="left">
										<ld:select value="${checkstandVersion.platform.id}"
											groupName="platformList" name="checkstandVersion.platform.id"
											className="dmg-select" />
									</td>
								</tr>
								<tr>
									<td width="16%" align="right">
										<label for="textfield">
											终端类型：
										</label>
									</td>
									<td width="16%" align="left">
										<ld:select value="${checkstandVersion.posType}"
											groupName="posType" name="checkstandVersion.posType.id"
											className="dmg-select" />
									</td>
									<td width="16%" align="right">
										<label for="textfield">
											版本编码：
										</label>
									</td>
									<td width="16%" align="left">
										<input name="checkstandVersion.versionNum" type="text"
											class="dmg-input" id="checkstandVersion.versionNum"
											maxlength="5" value="${checkstandVersion.versionNum}"
											onkeydown='return onlyNum()' />
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
						<div class="divbutton">
							<ld:check mark="checkstandVersionInsert">
								<input type="button" value="新增" class="button2"
									onMouseOver="this.className='button2Over'"
									onMouseOut="this.className='button2Out'" onclick="addItem();" />
							</ld:check>
						</div>
						<div class="divbutton2">
							<ld:check mark="checkstandVersionDelete">
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
							<form
								action="${basePath}core/checkstandVersionDelete!delete.action"
								method="post" name="deleteForm">
								<tr class="listtitle">
									<td>
										选择
									</td>
									<td>
										项目名称
									</td>
									<td>
										项目ID
									</td>
									<td>
										平台
									</td>
									<td>
										平台ID
									</td>
									<td>
										终端类型
									</td>
									<td>
										终端类型ID
									</td>
									<td>
										版本编码
									</td>
									<td>
										版本名称
									</td>
									<td>
										是否强制升级
									</td>
									<td>
										操作
									</td>
								</tr>

								<c:forEach items="${checkstanVersionList}" var="item"
									varStatus="status">
									<tr
										onMouseOver="this.className='tableitem9';this.style.cursor='hand';"
										onMouseOut="this.className='tableitem${6-status.index%2}';this.style.cursor='hand';"
										class="tableitem${6-status.index%2}"
										<ld:check mark="checkstandVersionDetail">onclick="showDetail(${item.id});"</ld:check>>
										<td>
											<input type="checkbox" name="delete" id="delete"
												value="${item.id}" />
										</td>
										<td>
											${item.project.projectName}
										</td>
										<td>
											${item.project.id}
										</td>
										<td>
											${item.platform.platformName}
										</td>
										<td>
											${item.platform.id}
										</td>
										<td>
											${item.posType.typeName}
										</td>
										<td>
											${item.posType.id}
										</td>
										<td>
											${item.versionNum}
										</td>
										<td>
											${item.versionName}
										</td>
										<td>
											<ld:option value="${item.isForceUpdate}"
												groupName="yesOrNoInt" />
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
							<form
								action="${basePath}core/checkstandVersionSearch!query.action"
								method="post" name="pagerForm" class="dmg-listli-item2">

								<input name="checkstandVersion.versionNum" type="hidden"
									value="${checkstandVersion.versionNum}" />
								<input name="checkstandVersion.posType.id" type="hidden"
									value="${checkstandVersion.posType.id}" />
								<input name="checkstandVersion.project.id" type="hidden"
									value="${checkstandVersion.project.id}" />
								<input name="checkstandVersion.platform.id" type="hidden"
									value="${checkstandVersion.platform.id}" />
								<ld:pager type="form" action="pagerForm" />
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>

