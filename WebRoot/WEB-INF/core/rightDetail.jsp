<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<body>
		<div id="rightcontent">
			<div id="road" class="road">
					<div class="roadItem">
						<div class="roadIcon"></div>
						<div class="roadItem2">
							您当前位置：系统管理 &gt; 权限管理  &gt; 权限详情
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
										权限信息
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
									权限名称：
								</td>
								<td class="tableitem3">
									${right.rightName}
								</td>
							</tr>
							<tr>
								<td width="200" class="tableitem4">
									权限标示：
								</td>
								<td class="tableitem2">
									${right.rightMark}
								</td>
							</tr>
							<tr>
								<td class="tableitem1">
									URL指向：
								</td>
								<td class="tableitem3">
									${right.rightURL}
								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									是否有效：
								</td>
								<td class="tableitem2">
									<ld:option groupName="available" value="${right.available}" />
								</td>
							</tr>
							<tr>
								<td class="tableitem1">
									是否菜单：
								</td>
								<td class="tableitem3">
									<ld:option groupName="yesOrNoInt" value="${right.isMenu}" />
									
								</td>
							</tr>
							<tr>
								<td class="tableitem1">
									是否记录：
								</td>
								<td class="tableitem3">
									<ld:option groupName="yesOrNoInt" value="${right.logable}"/>

								</td>
							</tr>

							<tr>
								<td class="tableitem4">
									授权方式：
								</td>
								<td class="tableitem2">
									<ld:option groupName="authorization"
												value="${right.isInherit}" />
								</td>
							</tr>
							<tr>
								<td class="tableitem1">
									创建时间：
								</td>
								<td class="tableitem3">
									<f:formatDate value="${right.createTime}"
										pattern="yyyy-MM-dd HH:mm:ss" />
								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									创建人：
								</td>
								<td class="tableitem2">
									${right.creator.userName}
								</td>
							</tr>
							<tr>
								<td class="tableitem1">
									备注：
								</td>
								<td class="tableitem3">
									${right.memo}
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

