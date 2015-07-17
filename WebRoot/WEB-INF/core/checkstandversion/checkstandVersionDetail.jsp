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
						您当前位置：系统管理 &gt; 软件升级 &gt; 软件版本详情
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
										版本信息
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
									项目名称
								</td>
								<td class="tableitem3">
									${checkstandVersion.project.projectName}
								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									平台
								</td>
								<td class="tableitem2">
									${checkstandVersion.platform.platformName}
								</td>
							</tr>
							<tr>
								<td class="tableitem1">
									终端类型
								</td>
								<td class="tableitem3">
									${checkstandVersion.posType.id}
								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									是否强制升级
								</td>
								<td class="tableitem2">
									<ld:option value="${checkstandVersion.isForceUpdate}"
										groupName="yesOrNoInt" />
								</td>
							</tr>
							<tr>

								<td class="tableitem1">
									版本编码
								</td>
								<td class="tableitem3">
									${checkstandVersion.versionNum}
								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									版本名称
								</td>
								<td class="tableitem2">
									${checkstandVersion.versionName}
								</td>
							</tr>
							<tr>
								<td class="tableitem1">
									文件路径
								</td>
								<td class="tableitem3">
									${checkstandVersion.filePath}
								</td>

							</tr>

							<tr>

								<td class="tableitem4">
									创建人
								</td>
								<td class="tableitem2">
									${checkstandVersion.genUser}
								</td>
							</tr>
							<tr>
								<td class="tableitem1">
									创建时间
								</td>
								<td class="tableitem3">
									<f:formatDate value="${checkstandVersion.genTime}"
										pattern="yyyy-MM-dd HH:mm:ss" />
								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									修改人
								</td>
								<td class="tableitem2">
									${checkstandVersion.updateUser}
								</td>
							</tr>
							<tr>
								<td class="tableitem1">
									修改时间
								</td>
								<td class="tableitem3">
									<f:formatDate value="${checkstandVersion.updateTime}"
										pattern="yyyy-MM-dd HH:mm:ss" />
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


