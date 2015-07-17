<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>应用类型管理</title>
		<link href="../css/css.css" rel="stylesheet" type="text/css" />
		<%@include file="/headDeclare.jsp"%>
		<script type="text/javascript">
function showItem(id) {
	showDialog("${basePath}core/operateLogDetail!getOperateLogById.action?id="
			+ id);

}
</script>
	</head>

	<body>
		<div id="rightcontent">
			<div id="road" class="road">
				<div class="roadItem">
					<div class="roadIcon"></div>
					<div class="roadItem2">
						您当前位置：实时监控 &gt; 操作监控
					</div>
				</div>
			</div>
			<div class="roadbody1">
				<div class="roadbody">
					<form
						action="${basePath}core/operateLogSearch!searchOperateLog.action"
						name="searchForm" method="post">
						<table class="rightseach2">
							<tr>
								<td width="16%" align="right">
									<label for="textfield">
										操作用户：
									</label>
								</td>
								<td width="16%" align="left">
									<input type="text" name="operator" id="operator"
										value="${operator}" />
								</td>
								<td width="7%" align="right">
									<label for="textfield">
										操作名称：
									</label>
								</td>
								<td width="12%" align="left">
									<input type="text" name="operateName" id="operateName"
										value="${operateName}" />
								</td>
							</tr>
							<tr>
								<td width="16%" align="right">
									<label for="textfield">
										是否合法：
									</label>
								</td>
								<td width="16%" align="left">
									<ld:select groupName="yesOrNoInt" name="isLegal"
										value="${isLegal}" />
								</td>
								<td width="7%" align="right">
									<label for="textfield">
										起始时间：
									</label>
								</td>
								<td width="12%" align="left">
									<input name="startDate" type="text" id="startDate"
										class="dmg-input Wdate"
										onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
										value="<f:formatDate value="${startDate}"
											pattern="yyyy-MM-dd HH:mm:ss" />" />
								</td>

								<td width="7%" align="right">
									<label for="textfield">
										结束时间：
									</label>
								</td>
								<td width="24%" align="left">
									<input name="endDate" type="text" id="endDate"
										class="dmg-input Wdate"
										onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
										value="<f:formatDate value="${endDate}"
											pattern="yyyy-MM-dd HH:mm:ss" />" />
								</td>
							</tr>
							<tr>
								<td width="11%" align="right">
									<label for="textfield">
										操作时长：
									</label>
								</td>
								<td colspan="3" align="left">
									<input type="text" name="minValue" id="minValue"
										value="${minValue}" onkeydown='return onlyAmount(this.value)'
										class="dmg-input" />
									-
									<input type="text" name="maxValue" id="maxValue"
										value="${maxValue}" onkeydown='return onlyAmount(this.value)'
										class="dmg-input" />
								</td>
								<td width="24%">
									<input type="submit" value="查询" class="button2"
										onmouseover="this.className='button2Over'"
										onmouseout="this.className='button2Out'" />
								</td>
							</tr>
						</table>
					</form>
				</div>
				<div class="righttitle">
					<div class="tab2">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td class="tabl">
									&nbsp;
								</td>
								<td class="tabm">
									日志
								</td>
								<td class="tabr">
									&nbsp;
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="divtable">
					<table width="100%" border="0" cellspacing="1" cellpadding="0"
						bgcolor="#cecece">
						<tr class="listtitle">
							<td width="10%">
								序号
							</td>
							<td width="8%">
								操作名称
							</td>
							<td width="8%">
								操作状态
							</td>
							<td width="8%">
								是否合法
							</td>
							<td width="8%">
								客户端ip
							</td>
							<td width="8%">
								操作用户
							</td>
							<td width="9%">
								操作时间
							</td>
							<td width="9%">
								操作时长(毫秒)
							</td>
						</tr>
						<c:forEach items="${operateLogList}" var="item" varStatus="status">
							<tr onclick="showItem(${item.id});"
								class="tableitem${6-status.index%2}"
								onMouseOver="this.className='tableitem9';this.style.cursor='hand';"
								onMouseOut="this.className='tableitem${6-status.index%2}';this.style.cursor='hand';"
								<ld:check mark="operateLogDetail">onclick="showItem(${item.id});"</ld:check>>
								<td>
									 ${status.count}
								</td>
								<td>
									<c:choose>
										<c:when test="${item.right==null}">
									非法URL
									</c:when>
										<c:otherwise>
									${item.right.rightName}
									</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${item.status==1}">成功</c:when>
										<c:otherwise>失败</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${item.isLegal==1}">是</c:when>
										<c:otherwise>否</c:otherwise>
									</c:choose>
								</td>
								<td>
									${item.clientIp}
								</td>
								<td>
									<c:choose>
										<c:when test="${item.user==null}">
									未知用户
									</c:when>
										<c:otherwise>
									${item.user.userName}
									</c:otherwise>
									</c:choose>
								</td>
								<td>
									<f:formatDate value="${item.time}"
										pattern="yyyy-MM-dd HH:mm:ss" />
								</td>
								<td>
									${item.lastingTime}
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="tablebottom">
					<div class="tablebottomright">
						<form
							action="${basePath}core/operateLogSearch!searchOperateLog.action"
							id="pagerForm" method="post" name="pagerForm"
							class="dmg-listli-item2">
							<input type="hidden" name="startDate"
								value="<f:formatDate value="${startDate}"
											pattern="yyyy-MM-dd HH:mm:ss" />" />
							<input type="hidden" name="endDate"
								value="<f:formatDate value="${endDate}"
											pattern="yyyy-MM-dd HH:mm:ss" />" />
							<input type="hidden" name="operator" value="${operator}" />
							<input type="hidden" name="operateStatus"
								value="${operateStatus}" />
							<input type="hidden" name="maxValue" value="${maxValue}" />
							<input type="hidden" name="minValue" value="${minValue}" />
							<input type="hidden" name="isLegal" value="${isLegal}" />
							<input type="hidden" name="operateName" value="${operateName}" />
							<ld:pager type="form" action="pagerForm" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>

