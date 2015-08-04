<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
	<c:if test="operatorSuccess">
	<script type="text/javascript">
		window.parent.categoryTree.location.reload();
	</script>
	</c:if>
<script type="text/javascript">

function checkIsInherit(id, isInherit) {
	if (isInherit == 1) {
		alert("该权限的授权方式是继承，无下级权限");
	} else {
		window.location.href = "${basePath}core/rightSearch!searchRightByUpRightId.action?upRightId="
				+ id;

	}
}
function setAvailable(id, upRightId, page) {
	if (id == 2) {
		alert("不得将系统管理设为无效！");
	} else {
		window.location.href = "${basePath}core/rightUpdate!updateStatus.action?right.id="
				+ id + "&upRightId=" + upRightId + "&pager.curPageNum=" + page;
	}
}
function addItem() {
	//var returnValue
//	= showLargeDialog("${basePath}core/rightInsert!prepare.action?right.upRightId="+${upRightId});
		//	if(!!returnValue){
			//	showLargeDialog("${basePath}core/rightSearch!getRightDetail.action?right.id="+returnValue);
				//document.pagerForm['pager.curPageNum'].value=1;
				//window.pagerForm.submit();
			//}
			//、window.parent.rightTree.location.reload();
		window.location.href="${basePath}back/categoryAction!addPrepare.action?category.parentCategory="+${category.parentCategory};
	}
		 
		function editItem(id){
			//var returnValue = showLargeDialog("${basePath}core/rightUpdate!prepare.action?right.id=" +id);
			//if(!!returnValue){
				//showLargeDialog("${basePath}core/rightSearch!getRightDetail.action?right.id="+returnValue);
				//window.pagerForm.submit();
			//}
			//window.parent.rightTree.location.reload();
			window.location.href="${basePath}core/rightUpdate!prepare.action?right.id=" +id;
		}
		function deleteItems(){
			if(isCheckboxSelected('deleteForm')){
				document.deleteForm.submit();
			}
		}
		
		function showItem(id){
			window.location.href="${basePath}core/rightSearch!getRightDetail.action?right.id="+id+"&pager.curPageNum="+${pager.curPageNum};
		}
</script>
	
	</head>
	<body>
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
									商品类别列表
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
					action="${basePath}back/categoryAction!deleteCategory.action?pager.curPageNum=${pager.curPageNum}"
					method="post" name="deleteForm">
					<div class="buttonbg">
						<div class="divbutton2">
							<ld:check mark="categoryManager">
								<input type="button" value="新增" class="button2"
									onMouseOver="this.className='button2Over'"
									onMouseOut="this.className='button2Out'" onclick="addItem();" />
							</ld:check>
						</div>
						<div class="divbutton2">
						<ld:check mark="categoryManager"> 
							<input type="submit" value="删除" class="button2"
								onMouseOver="this.className='button2Over'"
								onMouseOut="this.className='button2Out'"
								onclick="deleteItems();" />
						</ld:check>
						</div>
					</div>
					<div class="divtable">
						<table id="tb" width="100%" border="0" cellspacing="1"
							cellpadding="0" bgcolor="#cecece">
							<tr>

								<td class="listtitle">
									选择
								</td>
								<td class="listtitle">
									序号
								</td>
								<td class="listtitle">
									类别名称
								</td>
								<td class="listtitle">
									是否有效
								</td>
								<td class="listtitle">
									类别图片
								</td>
								<td class="listtitle">
									操作
								</td>
							</tr>

							<input type="hidden" name="category.parentCategory" value="${category.parentCategory}" />
							<c:forEach items="${categoryList}" var="item" varStatus="status">
								<tr class="tableitem${6-status.index%2}"
									onMouseOver="this.className='tableitem9';this.style.cursor='hand';"
									onMouseOut="this.className='tableitem${6-status.index%2}';this.style.cursor='hand';"
									<ld:check mark="categoryManager">onclick="showItem(${item.id});"</ld:check>>
									<td>
										<input type="checkbox" name="delete" id="delete"
											value="${item.id}" />
									</td>
									<td>${status.count}</td>
								<td><c:out value="${item.categoryName}"/></td>
								<td>
									<ld:option value="${item.isAvaliable}" groupName="yesOrNoIn"/>
								</td>
								<td><c:out value="${item.picture}" /></td>
								<td>
								<div class="button3body">
									<table border="0" align="center" cellpadding="0"
												cellspacing="2">
												<tr>
													<ld:check mark="categoryManager">
													<td>
														<input type="button" value="编辑" class="button3"
															onMouseOver="this.className='button3Over'"
															onMouseOut="this.className='button3Out'"
															onclick="editItem(${item.id});" />
													</td>
													</ld:check>
												</tr>
												<c:set value="${item}" var="last" />
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
						<form action="${basePath}back/categoryAction!loadCategoryByParentId.action"
							method="post" name="pagerForm">
							<input type="hidden" name="category.parentCategory" value="${category.parentCategory}" />
							<ld:pager type="form" action="pagerForm" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>