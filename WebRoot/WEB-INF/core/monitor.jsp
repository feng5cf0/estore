<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<html>
	<head>
	</head>

	<body>
		<div class="dmg-right-body1">
			<table width="492" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="216">
						<ld:check mark="systemMonitor">
							<img src="css/images/system_monitor_normal.png"
								style="cursor: pointer;" width="206" height="87"
								onmouseout="this.src='css/images/system_monitor_normal.png'"
								onmousemove="this.src='css/images/system_monitor_hover.png'"
								onclick="show('系统信息','${basePath}/core/systemMonitor!collectSystemMessage.action');" />
						</ld:check>
					</td>
					<td>
						<ld:check mark="operateLogManage">
							<img src="css/images/menu46.png" style="cursor: pointer;"
								width="206" height="87"
								onmouseout="this.src='css/images/menu46.png'"
								onmousemove="this.src='css/images/menu46on.png'"
								onclick="show('操作监控','${basePath}core/operateLogSearch!searchOperateLog.action');" />
						</ld:check>
					</td>
					<td>
					</td>
				</tr>
			</table>
		</div>
	</body>
</html>
