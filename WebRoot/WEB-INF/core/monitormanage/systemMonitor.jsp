<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<script type="text/javascript">
function download(fileName) {
	var url = "${basePath}/core/systemMonitor!downloadLog.action?downloadFileName="
			+ fileName;
	document.location.href = url;
}
</script>
	</head>
	<body>
		<div id="rightcontent">
			<div id="road" class="road">
				<div class="roadItem">
					<div class="roadIcon"></div>
					<div class="roadItem2">
						您当前位置：实时监控 &gt; 系统信息
					</div>
				</div>
			</div>
			<div class="roadbody1">
				<div class="rightseach2">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						bgcolor="#dcdcdc">
						<tr>
							<td class="tableitem4">
								最大可用内存
							</td>
							<td class="tableitem3">
								<f:formatNumber pattern="#,##0.00">
												${maxMemory}
												</f:formatNumber>
								M
							</td>
							<td class="tableitem4">
								占用内存总量
							</td>
							<td class="tableitem3">
								<f:formatNumber pattern="#,##0.00">
												${totalMemory}
												</f:formatNumber>
								M
							</td>
						</tr>
						<tr>
							<td class="tableitem4">
								空闲内存总量
							</td>
							<td class="tableitem3">
								<f:formatNumber pattern="#,##0.00">
												${freeMemory}
												</f:formatNumber>
								M
							</td>
							<td class="tableitem4">
								实际可用内存
							</td>
							<td class="tableitem3">
								<f:formatNumber pattern="#,##0.00">
												${maxMemory - totalMemory + freeMemory}
												</f:formatNumber>
								M
							</td>
						</tr>
					</table>
				</div>
				<div class="roadbody">
					<div class="righttitle">
						<div class="tab1">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td class="tabl">
										&nbsp;
									</td>
									<td class="tabm">
										系统信息
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
					</div>
					<div class="divtable">
						<table width="100%" border="0" cellspacing="1" cellpadding="0"
							bgcolor="#cecece">
							<tr class="listtitle">
								<td>
									序号
								</td>
								<td>
									文件名
								</td>
								<td>
									文件大小
								</td>
								<td>
									操作
								</td>
							</tr>
							<c:forEach items="${logFileInfos}" var="item" varStatus="status">
								<tr
									onMouseOver="this.className='tableitem9';this.style.cursor='hand';"
									onMouseOut="this.className='tableitem${6-status.index%2}';this.style.cursor='hand';"
									class="tableitem${6-status.index%2}">
									<td>
										${status.count}
									</td>
									<td>
										${item.fileName}
									</td>
									<td>
										<f:formatNumber pattern="#,##0.00">
													${item.size}
													</f:formatNumber>
										M
									</td>
									<td>
										<ld:check mark="systemMonitorDownload">
											<input type="button" value="下载" class="button3"
												onmouseover="this.className='button3Over'"
												onmouseout="this.className='button3Out'"
												onclick="download('${item.fileName}');" />
										</ld:check>
									</td>

								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="tablebottom">
						<div class="tablebottomright">
							<form
								action="
												${basePath}core/userSearch!searchUser.action"
								method="post" name="pagerForm" class="dmg-listli-item2">
								<input name="user.userName" type="hidden"
									value="${user.userName}" />
								<input name="user.userAlias" type="hidden"
									value="${user.userAlias}" />
								<input name="user.userNum" type="hidden" value="${user.userNum}" />
								<input name="user.available" type="hidden"
									value="${user.available}" />
								<ld:pager type="form" action="pagerForm" />
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>

