<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@include file="/headDeclare.jsp"%>
	</head>

	<body>
		<div id="rightcontent">
			<div id="road" class="road">
					<div class="roadItem">
						<div class="roadIcon"></div>
						<div class="roadItem2">
							您当前位置：系统管理 &gt; 用户管理  &gt; 用户详情
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
										用户信息
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
								<td width="200" class="tableitem1">
									登录名称：
								</td>
								<td class="tableitem3">
									${user.userAlias}
								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									用户编码：
								</td>
								<td class="tableitem2">
									${user.userNum}
								</td>
							</tr>
							<tr>
								<td width="200" class="tableitem1">
									用户全称：
								</td>
								<td class="tableitem3">
									${user.userName}
								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									是否有效：
								</td>
								<td class="tableitem2">
									<ld:option groupName="available" value="${user.available}" />
										
								</td>
							</tr>
							<tr>
								<td class="tableitem1">
									所属部门：
								</td>
								<td class="tableitem3">
									${user.belongArea.areaName}
								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									上次登录时间：
								</td>
								<td class="tableitem2">
									<f:formatDate value="${user.lastLoginTime}"
										pattern="yyyy-MM-dd HH:mm:ss" />
								</td>
							</tr>
							<tr>
								<td class="tableitem1">
									上次登录ip：
								</td>
								<td class="tableitem3">
									${user.lastLoginIP}
								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									备注：
								</td>
								<td class="tableitem2">
									${user.memo }	</td>
							</tr>
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




