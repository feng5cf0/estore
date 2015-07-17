<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@include file="/headDeclare.jsp"%>
		<script type="text/javascript">

function addItem() {
	//打开角色插入页面
	var returnValue = showLargeDialog("${basePath}core/roleInsert!prepare.action");

	//根据返回值判断是否需要打开详情页面
	if (!!returnValue) {
		//打开详情页面
		showLargeDialog("${basePath}core/roleSearch!getRoleDetail.action?role.id="
				+ returnValue);

		//新增数据后需要跳转至第一页
		document.pagerForm['pager.curPageNum'].value = 1;

		//此时需要根据具体情况需要去除查询条件,但要保留需要的参数

		window.pagerForm.submit();
	}
}

function editItem(id) {
	var returnValue = showLargeDialog("${basePath}core/roleUpdate!prepare.action?role.id="
			+ id);
	if (!!returnValue) {
		showLargeDialog("${basePath}core/roleSearch!getRoleDetail.action?role.id="
				+ returnValue);
		//更新后显示当前页并且包含查询条件的列表信息
		window.pagerForm.submit();
	}
}
function setRight(id) {
showDialog("${basePath}core/roleUpdateRight!prepare.action?targetRoleId=" +id+"&pager.curPageNum="+${pager.curPageNum});
	}
	function deleteItems(){
		if(isCheckboxSelected('deleteForm')){
			document.deleteForm.submit();
		}
	}
		
	function showItem(id){
		showDialog("${basePath}core/roleSearch!getRoleDetail.action?role.id="+id+"&pager.curPageNum="+${pager.curPageNum});
	}
		
		
		</script>
	</head>


	<body>
		<div id="rightcontent">
			<div id="road" class="road">
				<div class="roadItem">
					<div class="roadIcon"></div>
					<div class="roadItem2">
						您当前位置：系统管理 &gt; 角色管理
					</div>
				</div>
			</div>
			<div class="quxxcontent">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td valign="top">
							<div class="roadbody1">
								<div class="roadbody">
									<div class="righttitle">
										<div class="tab2">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td class="tabl">
														&nbsp;
													</td>
													<td class="tabm">
														角色列表
													</td>
													<td class="tabr">
														&nbsp;
													</td>
												</tr>
											</table>
										</div>
										<div class="tab4">
											<%--${error}--%>
										</div>
									</div>
									<form
										action="${basePath}core/roleDelete!deleteRole.action?pager.curPageNum=${pager.curPageNum}"
										method="post" name="deleteForm">
										<div class="buttonbg">
											<div class="divbutton2">
												<ld:check mark="roleInsert">
													<input type="button" value="添加" class="button2"
														onMouseOver="this.className='button2Over'"
														onMouseOut="this.className='button2Out'"
														onclick="addItem();" />
												</ld:check>
											</div>
											<div class="divbutton2">
												<ld:check mark="roleDelete">
													<input type="submit" value="删除" class="button2"
														onMouseOver="this.className='button2Over'"
														onMouseOut="this.className='button2Out'"
														onclick="deleteItems();" />
												</ld:check>
											</div>
										</div>
										<div class="divtable">
											<table width="100%" id="tb" border="0" cellspacing="1"
												cellpadding="0" bgcolor="#cecece">
												<tr class="listtitle">
													<td>
														选择
													</td>
													<td>
														序号
													</td>
													<td>
														角色名称
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
												<c:forEach items="${roleList}" var="item" varStatus="status">
													<tr class="tableitem${6-status.index%2}"
														onMouseOver="this.className='tableitem9';this.style.cursor='hand';"
														onMouseOut="this.className='tableitem${6-status.index%2}';this.style.cursor='hand';"
														<ld:check mark="roleDetail">onclick="showItem(${item.id});"</ld:check>>
														<td>
										<input type="checkbox" name="delete" id="delete"
											value="${item.id}" />
									</td>
														<td>
															${status.count}
														</td>
														<td>
															<c:out value="${item.roleName}" />
														</td>
														<td>
															<ld:rightMark>
																<ld:check mark="roleStatusUpdate">
																	<a
																		href="javascript:setAvailable(${item.id},${pager.curPageNum});">
																		<ld:option groupName="available"
																			value="${item.available}" /> </a>
																</ld:check>
																<ld:fail>
																	<ld:option groupName="available"
																		value="${item.available}" />
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
																			<ld:check mark="roleUpdate">
																				<input type="button" value="编辑" class="button3"
																					onMouseOver="this.className='button3Over'"
																					onMouseOut="this.className='button3Out'"
																					onclick="editItem(${item.id});" />
																				</ld:check>
																		</td>
																		<td>
																			<ld:check mark="roleUpdateRight">
																				<input type="button" value="权限设置" class="button3"
																					onmouseover="this.className='button3Over'"
																					onmouseout="this.className='button3Out'"
																					onclick="setRight(${item.id});" />
																			</ld:check>
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
											<form action="${basePath}core/roleSearch!searchRole.action"
												method="post" name="pagerForm">
												<ld:pager type="form" action="pagerForm" />
											</form>
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</body>
</html>


