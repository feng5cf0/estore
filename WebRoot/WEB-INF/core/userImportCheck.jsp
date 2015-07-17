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
								校验文件结果
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
			<div class="divtable">
				<table width="100%" border="0" cellspacing="1" cellpadding="0"
					id="tb" bgcolor="#cecece">
					<tr class="listtitle">
						<td>
							excel行号
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
							所在部门
						</td>
						<td>
							备注
						</td>
						<td>
							校验结果
						</td>
					</tr>
					<c:forEach items="${userList}" var="item" varStatus="status">
						<c:if test="${item.validResult!=null&&item.validResult!=''}">
							<tr id="tr1" class="tableitem${6-status.index%2}"
								onMouseOver="this.className='tableitem9';this.style.cursor='hand';"
								onMouseOut="this.className='tableitem${6-status.index%2}';this.style.cursor='hand';">
								<td>
									<c:out value="${item.rowNum}" />
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
									<c:out value="${item.areaName}" />
								</td>
								<td id="memoTd">
									<c:out value="${item.memo}" />
								</td>
								<td id="memoTd">
									<c:out value="${item.validResult}" />
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
			</div>
			<div class="tablebottom">
				<div class="button4body">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="1">
						<tr>
							<td align="center">
								<input type="button" value="关 闭" class="button4"
									onMouseOver="this.className='button4Over'"
									onMouseOut="this.className='button4Out'"
									onclick="history.back();" />
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</html>


