<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%@include file="/headDeclare.jsp"%>
	</head>

	<body>
		<div id="rightcontent">
				<div id="road" class="road">
					<div class="roadItem">
						<div class="roadIcon"></div>
						<div class="roadItem2">
							您当前位置：系统管理 &gt; 部门管理 &gt; 部门详情
						</div>
					</div>
				</div>
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
										部门信息
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
						<table width="100%" border="0" cellspacing="1" cellpadding="0"
							bgcolor="#cecece">
							<tr>
								<td class="tableitem1">
									部门名称：
								</td>
								<td class="tableitem3">
									<c:out value="${area.areaName}" />
								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									部门标识：
								</td>
								<td class="tableitem2">
									<c:out value="${area.areaMark}" />
								</td>
							</tr>
							<tr>
								<td class="tableitem1">
									是否有效：
								</td>
								<td class="tableitem3">
									<ld:option groupName="available" value="${area.available}" />
								</td>
							</tr>
							<tr>
								<td width="200" class="tableitem4">
									备注：
								</td>
								<td class="tableitem2">
									<c:out value="${area.memo}" />
								</td>
							</tr>
						</table>
					</div>
					<div class="tablebottom">
						<div class="button5body">
							<table width="100%" border="0" align="center" cellpadding="0"
								cellspacing="1">
								<tr>
									<td width="120" align="center">
										<input type="button" value="关 闭" class="button4"
											onmouseover="this.className='button4Over'"
											onmouseout="this.className='button4Out'"
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


