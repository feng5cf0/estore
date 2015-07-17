<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@include file="/headDeclare.jsp"%>
	</head>
	<body style="overflow: auto">
		<div id="rightcontent">
			<div id="road" class="road">
				<div class="roadItem">
					<div class="roadIcon"></div>
					<div class="roadItem2">
						您当前位置：系统管理 &gt; 系统设置
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
										系统设置
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
					<div class="divtable">
						<form action="core/systemOptionManage!updateOption.action"
							method="post">
							<table width="100%" border="0" cellspacing="1" cellpadding="0"
								bgcolor="#cecece">

								<tr id="list_content">
									<td align="right" width="22%" class="tableitem4">
										分页大小：
									</td>
									<td width="78%" align="left" class="tableitem2">
										&nbsp;每页显示
										<select name="defaultPageSize">
											<c:forEach items="${pageSizeChoices}" var="item">
												<c:choose>
													<c:when test="${item.value==defaultPageSize}">
														<option value="${item.value}" selected="selected">
															${item.key}
														</option>
													</c:when>
													<c:otherwise>
														<option value="${item.value}">
															${item.key}
														</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
										条数据。
									</td>
								</tr>
								<tr bgcolor="#efefef">
									<td align="left">
										<div class="buttonbg"></div>
									</td>
									<td align="left">
										<div class="buttonbg">
											<div class="divbutton">
												<ld:check mark="systemOptionManageUpdate">
													<input type="submit" value="确定" class="button2"
														onMouseOver="this.className='button2Over'"
														onMouseOut="this.className='button2Out'" />
												</ld:check>
											</div>
										</div>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>



