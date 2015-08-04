<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
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
		window.location.href="${basePath}back/moneyAction!addPrepare.action";
	}
		 
		function editItem(id){
			//var returnValue = showLargeDialog("${basePath}core/rightUpdate!prepare.action?right.id=" +id);
			//if(!!returnValue){
				//showLargeDialog("${basePath}core/rightSearch!getRightDetail.action?right.id="+returnValue);
				//window.pagerForm.submit();
			//}
			//window.parent.rightTree.location.reload();
			window.location.href="${basePath}back/moneyAction!updatePrepare.action?money.id=" +id;
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
					<div id="road" class="road">
				<div class="roadItem">
					<div class="roadIcon"></div>
					<div class="roadItem2">
						您当前位置：系统管理 &gt; 汇率管理
					</div>
				</div>
			</div>
			<div class="roadbody">
				<div class="righttitle">
					<div class="tab2">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td class="tabl">
									&nbsp;
								</td>
								<td class="tabm">
									货币列表
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
									货币名称
								</td>
								<td class="listtitle">
									对人民币汇率
								</td>
								<td class="listtitle">
									操作
								</td>
							</tr>
							<!--  <input type="hidden" name="upRightId" value="${upRightId}" />-->
							<c:forEach items="${moneyList}" var="item" varStatus="status">
								<tr class="tableitem${6-status.index%2}"
									onMouseOver="this.className='tableitem9';this.style.cursor='hand';"
									onMouseOut="this.className='tableitem${6-status.index%2}';this.style.cursor='hand';"
									<ld:check mark="moneyManager">onclick="showItem(${item.id});"</ld:check>>
									<td>
										<input type="checkbox" name="delete" id="delete"
											value="${item.id}" />
									</td>
									<td>${status.count}</td>
								<td><c:out value="${item.moneyName}" /></td>
								<td><c:out value="${item.rate}" /></td>
								<td>
									<div class="button3body">
										<table border="0" align="center" cellpadding="0"
												cellspacing="2">
											<tr>
													<ld:check mark="rightUpdate">
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
						<form action="${basePath}back/moneyAction!loadMoney.action"
							method="post" name="pagerForm">
							<ld:pager type="form" action="pagerForm" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>