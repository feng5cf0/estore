<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%@include file="/headDeclare.jsp"%>
		<script type="text/javascript">

function addItem() {
if(${role.id}=='0'){
		alert("请先在左边选择要管理的角色");
		return;
	}
	var returnValue = showLargeDialog("${basePath}core/roleUserInsert!prepare.action?role.id="+${role.id}+"&pager.curPageNum="+${pager.curPageNum});
	if(!!returnValue){
		window.pagerForm.submit();
	}
}
		
		function deleteItems(){
		if(isCheckboxSelected('deleteForm')){
			document.deleteForm.submit();
			}
		}
		
		function showItem(id){
			showDialog("${basePath}core/userSearch!getUserDetail.action?user.id="+id+"&pager.curPageNum="+${pager.curPageNum});

		}
		
		</script>
	</head>
	<body>
		<div id="rightcontent">
			<div class="roadbody1">
				<c:if test="${role!=null&&role.id!=0}">
					<div class="rightseach2">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							bgcolor="#dcdcdc">
							<tr>
								<td class="tableitem4">
									角色名称
								</td>
								<td class="tableitem3">
									${role.roleName}
								</td>
								<td class="tableitem4">
									是否有效
								</td>
								<td class="tableitem3">
									<ld:option groupName="available" value="${role.available}" />
								</td>
							</tr>
						</table>
					</div>
				</c:if>
				<div class="roadbody">
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
					<div class="buttonbg">
						<div class="divbutton">
							<ld:check mark="roleUserInsert">
								<input type="button" value="新增" class="button2"
									onMouseOver="this.className='button2Over'"
									onMouseOut="this.className='button2Out'" onclick="addItem();" />
							</ld:check>
						</div>
						<div class="divbutton">
							<ld:check mark="roleUserDelete">
								<input type="button" value="删除" class="button2"
									onMouseOver="this.className='button2Over'"
									onMouseOut="this.className='button2Out'"
									onclick="deleteItems();" />
							</ld:check>
						</div>
					</div>
					<div class="divtable">
						<form
							action="${basePath}core/roleUserDelete!deleteRoleUser.action?pager.curPageNum=${pager.curPageNum}&role.id=${role.id}"
							name="deleteForm" method="post" id="form1" name="form1">
							<table width="100%" border="0" cellspacing="1" cellpadding="0"
								bgcolor="#cecece">
								<tr class="listtitle">
									<td class="dmg-listli-title">
										选择
									</td>
									<c:choose>
										<c:when test="${role!=null&&role.id!=0}">
											<td class="dmg-listli-title">
												序号
											</td>
										</c:when>
										<c:otherwise>
											<td class="dmg-listli-title">
												角色名称
											</td>
										</c:otherwise>
									</c:choose>
									<td>
										用户全称
									</td>
									<td>
										登录名称
									</td>
									<td>
										用户编码
									</td>
									<td>
										状态
									</td>
								</tr>

								<c:forEach items="${roleUserList}" var="item" varStatus="status">
									<tr
										onMouseOver="this.className='tableitem9';this.style.cursor='hand';"
										onMouseOut="this.className='tableitem${6-status.index%2}';this.style.cursor='hand';"
										class="tableitem${6-status.index%2}">
										<td>
											<input type="checkbox" name="delete" id="delete"
												class="dmg-checkbox" value="${item.id}" />
										</td>

										<c:choose>
											<c:when test="${role!=null&&role.id!=0}">
												<td>
													${status.count}
												</td>
											</c:when>
											<c:otherwise>
												<td>
													${item.role.roleName}
												</td>
											</c:otherwise>
										</c:choose>

										<td>
											<c:out value="${item.user.userName}" />
										</td>
										<td>
											<c:out value="${item.user.userAlias}" />
										</td>
										<td>
											<c:out value="${item.user.userNum}" />
										</td>
										<td>
											<ld:option groupName="available"
												value="${item.user.available}" />
										</td>
									</tr>
								</c:forEach>
							</table>
						</form>
					</div>
					<div class="tablebottom">
						<div class="tablebottomright">
							<form
								action="${basePath}core/roleUserSearch!searchUserByRole.action?role.id=${role.id}"
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

