<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<html>
	<head>
		<%@include file="/headDeclare.jsp"%>
	</head>

	<body height="100%">
		<div id="rightcontent">
			<div id="road" class="road">
				<div class="roadItem">
					<div class="roadIcon"></div>
					<div class="roadItem2">
						&nbsp;您当前位置：系统管理 &gt; 权限管理
					</div>
				</div>
			</div>
			<div class="quxxcontent">
				<table width="100%" height="100%" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td width="18%" valign="top" class="tree">
							<ld:check mark="rightTree">
								<iframe
									src="${basePath}core/rightSearch!searchRightsForRightTree.action"
									name="rightTree" width="200" height="100%" marginwidth="1"
									marginheight="1" frameborder="0">
								</iframe>
							</ld:check>
						</td>
						<td width="82%" valign="top">
							<ld:check mark="rightSearch">
								<iframe
									src="${basePath}core/rightSearch!searchRightByUpRightId.action?upRightId=1"
									name="rightList" width="100%" height="600" marginwidth="1"
									marginheight="1" frameborder="0">
								</iframe>
							</ld:check>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</body>
</html>


