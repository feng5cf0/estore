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
							学号
						</td>
						<td>
							班级
						</td>
						<td>
							姓名
						</td>
						<td>
							缴费期
						</td>
						<td>
							保教费
						</td>
						<td>
							伙食费
						</td>
						<td>
							补收
						</td>
						<td>
							退伙食费
						</td>						
						<td>
							困难补贴
						</td>
						<td>
							实缴金额
						</td>
						<td>
							校验结果
						</td>
					</tr>
					<c:forEach items="${payList}" var="item" varStatus="status">
							<tr id="tr1" class="tableitem${6-status.index%2}"
								onMouseOver="this.className='tableitem9';this.style.cursor='hand';"
								onMouseOut="this.className='tableitem${6-status.index%2}';this.style.cursor='hand';">
								<td>
									<c:out value="${status.index }" />
								</td>
								<td>
									<c:out value="${item.stuNum}" />
								</td>
								<td>
									<c:out value="${item.stuClass}" />
								</td>
								<td>
									<c:out value="${item.stuName}" />
								</td>
								<td>
									<c:out value="${item.payTime}" />
								</td>
								<td>
									<c:out value="${item.payBaoJiao}" />
								</td>
								<td>
									<c:out value="${item.payFood}" />
								</td>
								<td>
									<c:out value="${item.payAdd}" />
								</td>
								<td>
									<c:out value="${item.payReduce}" />
								</td>
								<td>
									<c:out value="${item.paySubsidy}" />
								</td>
								<td>
									<c:out value="${item.payActual}" />
								</td>
								<td>
									<c:out value="${item.checkResult}" />
								</td>
							</tr>
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


