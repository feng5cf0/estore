<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
	<c:if test="${operateSuccess}">
	<script type="text/javascript">
window.parent.rightTree.location.reload();
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
		window.location.href("${basePath}core/rightInsert!prepare.action?right.upRightId="+${upRightId});
	}
		 
		function editItem(id){
			var returnValue = showLargeDialog("${basePath}core/rightUpdate!prepare.action?right.id=" +id);
			if(!!returnValue){
				showLargeDialog("${basePath}core/rightSearch!getRightDetail.action?right.id="+returnValue);
				window.pagerForm.submit();
			}
			window.parent.rightTree.location.reload();
		}
		function deleteItems(){
		if(isCheckboxSelected('deleteForm')){
			document.deleteForm.submit();
			}
		}
		
		function showItem(id){
			showDialog("${basePath}core/rightSearch!getRightDetail.action?right.id="+id+"&pager.curPageNum="+${pager.curPageNum});
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
									权限列表
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
					action="${basePath}core/rightDelete!deleteRight.action?pager.curPageNum=${pager.curPageNum}"
					method="post" name="deleteForm">
					<div class="buttonbg">
						<div class="divbutton2">
							<ld:check mark="rightInsert">
								<input type="button" value="新增" class="button2"
									onMouseOver="this.className='button2Over'"
									onMouseOut="this.className='button2Out'" onclick="addItem();" />
							</ld:check>
						</div>
						<div class="divbutton2">
						<ld:check mark="rightDelete"> 
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
									权限名称
								</td>
								<td class="listtitle">
									权限标识
								</td>
								<td class="listtitle">
									URL指向
								</td>
								<td class="listtitle">
									是否菜单项
								</td>
								<td class="listtitle">
									状态
								</td>
								<td class="listtitle">
									是否记录
								</td>
								<td class="listtitle">
									授权方式
								</td>
								<td class="listtitle">
									操作
								</td>
							</tr>

							<input type="hidden" name="upRightId" value="${upRightId}" />
							<c:forEach items="${rightList}" var="item" varStatus="status">
								<tr class="tableitem${6-status.index%2}"
									onMouseOver="this.className='tableitem9';this.style.cursor='hand';"
									onMouseOut="this.className='tableitem${6-status.index%2}';this.style.cursor='hand';"
									<ld:check mark="rightDetail">onclick="showItem(${item.id});"</ld:check>>
									<td>
										<input type="checkbox" name="delete" id="delete"
											value="${item.id}" />
									</td>
									<td>${status.count}</td>
								<td><a
									href="javascript:checkIsInherit(${item.id},${item.isInherit})"><font
										class="font9">${item.rightName} </font> </a></td>
								<td><c:out value="${item.rightMark}" /></td>
								<td><c:out value="${item.rightURL}" /></td>
								<td>
										<ld:option groupName="yesOrNoInt" value="${item.isMenu}" />
									</td>
								<td><ld:rightMark>
										<ld:check mark="rightStatusUpdate">
											<a
												href="javascript:setAvailable(${item.id},${item.upRightId},${pager.curPageNum});">
												<ld:option groupName="available" value="${item.available}" />
											</a>
										</ld:check>
										<ld:fail>
											<ld:option groupName="available" value="${item.available}" />
										</ld:fail>
									</ld:rightMark></td>
								<td>
									<ld:option groupName="yesOrNoInt" value="${item.logable}"/>
								</td>
								<td><ld:option groupName="authorization"
										value="${item.isInherit}" /></td>
									<td>
										<div class="button3body">
											<table border="0" align="center" cellpadding="0"
												cellspacing="2">
												<tr>
												<c:if test="${isDebugMod}">
													<ld:check mark="rightUpdate">
													<td>
														<input type="button" value="编辑" class="button3"
															onMouseOver="this.className='button3Over'"
															onMouseOut="this.className='button3Out'"
															onclick="editItem(${item.id});" />
													</td>
													</ld:check>
													<ld:check mark="rightOrderUpdate">
														<c:choose>
															<c:when
																test="${status.last==false&&rightList[status.index+1]!=null}">
																<td><input type="button" value="下移" class="button3"
																	onMouseOver="this.className='button3Over'"
																	onMouseOut="this.className='button3Out'"
																	onclick="window.location.href='${basePath}core/rightUpdateOrder!updateOrder.action?lastId=${rightList[status.index+1].id}&currentId=${item.id}&pager.curPageNum=${pager.curPageNum}&upRightId=${upRightId}';" />
																</td>
															</c:when>
															<c:when test="${status.last==true&&status.count!=1}">
																<td><input type="button" value="上移" class="button3"
																	onMouseOver="this.className='button3Over'"
																	onMouseOut="this.className='button3Out'"
																	onclick="window.location.href='${basePath}core/rightUpdateOrder!updateOrder.action?lastId=${rightList[status.index-1].id}&currentId=${item.id}&pager.curPageNum=${pager.curPageNum}&upRightId=${upRightId}';" />
																</td>
															</c:when>
														</c:choose>
													</ld:check>
												</c:if>
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
						<form action="${basePath}core/rightSearch!searchRightByUpRightId.action"
							method="post" name="pagerForm">
							<input type="hidden" name="upRightId" value="${upRightId}" />
							<ld:pager type="form" action="pagerForm" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>