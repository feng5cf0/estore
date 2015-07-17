<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@include file="/headDeclare.jsp"%>
		<script type="text/javascript">
var currendLeftId = 1;
function changeLeftRight(rightId) {
	document.getElementById(currendLeftId).style.display = "none";
	document.getElementById(rightId).style.display = "";
	currendLeftId = rightId;
}
function checkSubmit() {
	var r = confirm("是否确定对角色权限进行修改？");
	if (!r) {
		return false;
	}
	document.form1.submit();
}
</script>
	</head>

	<body>
		<div id="rightcontent">
			<div id="road" class="road">
				<div class="roadItem">
					<div class="roadIcon"></div>
					<div class="roadItem2">
						您当前位置：系统管理 &gt; 角色管理 &gt; 角色权限设置
					</div>
				</div>
			</div>
			<div class="roadbody1">
				<div class="roadbody">
					<div class="righttitle">
						<div class="tab1">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td class="tabl">
										&nbsp;
									</td>
									<td class="tabm">
										角色权限设置
									</td>
									<td class="tabr">
										&nbsp;
									</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="buttonbg1"></div>
					<div class="divtable">
						<form action="${basePath}core/roleUpdateRight!updateRight.action"
							id="form1" name="form1" method="post">
							<table width="100%" border="0" cellspacing="1" cellpadding="0"
								bgcolor="#cecece">
								<input type="hidden" name="targetRoleId" value="${targetRoleId}" />
								<input type="hidden" name="pager.curPageNum"
									value="${pager.curPageNum}" />
								<tr>
									<td width="200" class="tableitem1" style="text-align: left">
										角色名称：
									</td>
									<td class="tableitem3">
										${role.roleName}
									</td>
								</tr>
								<tr>
									<td class="tableitem4" style="width: 286px; text-align: left"
										valign="top">
										<script type="text/javascript">
var dLeft = new dTree('d');<c:forEach items="${firstRightList}" var="item" varStatus="status">
												<c:if test="${item.id==1}">
dLeft.add(${item.id},${item.upRightId},'${item.rightName}');
	 </c:if>
												<c:if test="${item.upRightId==1}">
dLeft.add(${item.id},${item.upRightId},'${item.rightName}',"javascript:changeLeftRight('${item.id}');");
	 </c:if>

				</c:forEach>
				dLeft.config.useSelection = false;
																						dLeft.config.useIcons=false;
																						document.write(dLeft);
          </script>
									</td>
									<c:forEach items="${firstRightList}" var="firstItem" begin="1"
										varStatus="firstStatus">
										<td class="tableitem2" id="${firstItem.id}"
											style="display: none;" valign="top">

											<script type="text/javascript">
if (${firstStatus.first}) {
document.getElementById(${firstItem.id}).style.display = "";
currendLeftId=${firstItem.id};
}
var d${firstItem.id} = new dTree('d${firstItem.id}');<c:forEach items="${rightList}" var="item">
var logable="否";
if(${item.logable==1}){
	logable="是";
}
<c:choose>
<c:when test="${item.id==firstItem.id&&item.isInherit==0}">
					d${firstItem.id}.add(${item.id},-1,'${item.rightName} [备注：${item.memo}]','',<ld:invoke target="${selected}" methodName="contains" matchType="byName" param1="${item.id}" />);
					</c:when>
<c:otherwise>
<c:if test="${item.upRightId!=1&&item.id!=1&&item.isInherit==0}">
					d${firstItem.id}.add(${item.id},${item.upRightId},'${item.rightName} [备注：${item.memo}]','',<ld:invoke target="${selected}" methodName="contains" matchType="byName" param1="${item.id}" />);
					</c:if>
					</c:otherwise>
					</c:choose>
				</c:forEach>
				
				d${firstItem.id}.config.useSelection = false;
				d${firstItem.id}.config.target='rightList';
				d${firstItem.id}.config.useIcons=false;
				d${firstItem.id}.config.checkBoxName='updateRightIds';
				document.write(d${firstItem.id});
				d${firstItem.id}.openAll();
          </script>

										</td>
									</c:forEach>
								</tr>
							</table>
						</form>
						</td>
						</tr>
						</table>
					</div>
					<div class="tablebottom">
						<div class="button4body">
							<table width="100%" border="0" align="center" cellpadding="0"
								cellspacing="1">
								<tr>
									<td align="center">
										<ld:check mark="roleUpdateRightCommit">
											<input type="submit" value="确 定" class="button4"
												onMouseOver="this.className='button4Over'"
												onMouseOut="this.className='button4Out'"
												onclick="return checkSubmit();" />
										</ld:check>
									</td>
									<td>
										&nbsp;
									</td>
									<td align="center">
										<input type="button" value="关 闭" class="button4"
											onMouseOver="this.className='button4Over'"
											onMouseOut="this.className='button4Out'"
											onclick="window.close();" />
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>



