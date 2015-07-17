<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%@include file="/headDeclare.jsp"%>
		<script type="text/javascript">

function addItem() {
	var returnValue
= showLargeDialog("${basePath}core/areaInsert!prepare.action?area.superAreaId="+${superAreaId});
			if(!!returnValue){
				//打开详情页面
				showLargeDialog("${basePath}core/areaSearch!getAreaDetail.action?area.id="+returnValue);
				
				//新增数据后需要跳转至第一页
				document.pagerForm['pager.curPageNum'].value=1;
				
				window.pagerForm.submit();
			}
			
			window.parent.areaTree.location.reload();
		}
		function editItem(id){
			var returnValue = showLargeDialog("${basePath}core/areaUpdate!prepare.action?area.id=" +id);
			if(!!returnValue){
				//打开详情页面
				showLargeDialog("${basePath}core/areaSearch!getAreaDetail.action?area.id="+returnValue);
				window.pagerForm.submit();
			}
			window.parent.areaTree.location.reload();
		}
		function deleteItems(){
		if(isCheckboxSelected('deleteForm')){
			document.deleteForm.submit();
			window.parent.areaTree.location.reload();
			}
		}
		
		function showItem(id){
			showDialog("${basePath}core/areaSearch!getAreaDetail.action?area.id="+id+"&pager.curPageNum="+${pager.curPageNum});
		}
</script>
	</head>
	<div class="roadbody1">
		<div class="roadbody">
			<div class="righttitle">
				<div class="tab2">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td class="tabl">
								&nbsp;
							</td>
							<td class="tabm">
								部门列表
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
			<form
				action="${basePath}core/areaDelete!deleteArea.action?pager.curPageNum=${pager.curPageNum}"
				method="post" name="deleteForm">
				<div class="buttonbg">
					<div class="divbutton2">
						<ld:check mark="areaInsert">
							<input type="button" value="新增" class="button2"
								onMouseOver="this.className='button2Over'"
								onMouseOut="this.className='button2Out'" onclick="addItem();" />
						</ld:check>
					</div>
				</div>
				<div class="divtable">
					<table width="100%" border="0" cellspacing="1" cellpadding="0"
						id="tb" bgcolor="#cecece">
						<tr class="listtitle">
							<td>
								选择
							</td>
							<td>
								部门名称
							</td>
							<td>
								部门标识
							</td>
							<td>
								状态
							</td>
							<td>
								备注
							</td>
							<td>
								操作
							</td>
						</tr>
						<input type="hidden" name="superAreaId" value="${superAreaId}" />
						<c:forEach items="${areaList}" var="item" varStatus="status">

							<tr id="tr1" class="tableitem${6-status.index%2}"
								onMouseOver="this.className='tableitem9';this.style.cursor='hand';"
								onMouseOut="this.className='tableitem${6-status.index%2}';this.style.cursor='hand';"
								<ld:check mark="areaDetail">onclick="showItem(${item.id});"	</ld:check>>
								<td>
									<input type="checkbox" name="delete" id="delete"
										value="${item.id}" />
								</td>
								<td>
									<a
										href="${basePath}core/areaSearch!searchAreaBySuperAreaId.action?superAreaId=${item.id}"><c:out
											value="${item.areaName}" /> </a>
								</td>
								<td>
									${item.areaMark}
								</td>
								<td>
									<ld:rightMark>
											<ld:check mark="areaStatusUpdate">
												<a
													href="${basePath}core/areaUpdate!updateStatus.action?area.id=${item.id}&area.available=${item.available}&area.superAreaId=${superAreaId}&pager.curPageNum=${pager.curPageNum}"><ld:option
														groupName="available" value="${item.available}" /> </a>
											</ld:check>
											<ld:fail>
												<ld:option groupName="available" value="${item.available}" />
											</ld:fail>
										</ld:rightMark>
								</td>
								<td>
									<font id="available1" class="font9"><c:out
											value="${item.memo}" /> </font>
								</td>
								<td>
									<div class="button3body">
										<table border="0" align="center" cellpadding="0"
											cellspacing="2">
											<tr>
												<td>
													<ld:check mark="areaUpdate">
														<input type="button" value="编辑" class="button3"
															onMouseOver="this.className='button3Over'"
															onMouseOut="this.className='button3Out'"
															onclick="editItem(${item.id});" />
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
					<form
						action="${basePath}core/areaSearch!searchAreaBySuperAreaId.action"
						method="post" name="pagerForm">
						<input type="hidden" name="superAreaId" value="${superAreaId}" />
						<ld:pager type="form" action="pagerForm" />
					</form>
				</div>
			</div>
		</div>
	</div>
</html>


