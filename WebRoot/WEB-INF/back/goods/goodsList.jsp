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
function showItem() {
	window.location.href("${basePath}back/goodsInAction!addPrepare.action");

}
function addItem(){
	window.location.href("${basePath}back/goodsAction!addPrepare.action");
}
</script>
	</head>
	<body>
		<div id="rightcontent">
			<div id="road" class="road">
				<div class="roadItem">
					<div class="roadIcon"></div>
					<div class="roadItem2">
						您当前位置：商品管理 &gt; 商品信息管理
					</div>
				</div>
			</div>
			<div class="roadbody1">
				<!-- 
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
				搜索栏end-->
				<div class="righttitle">
					<div class="tab2">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td class="tabl">
									&nbsp;
								</td>
								<td class="tabm">
									商品信息
								</td>
								<td class="tabr">
									&nbsp;
								</td>
							</tr>
						</table>
					</div>
				</div>
					<div class="buttonbg">
						<div class="divbutton2">
							<ld:check mark="rightInsert">
								<input type="button" value="新增" class="button2"
									onMouseOver="this.className='button2Over'"
									onMouseOut="this.className='button2Out'" onclick="addItem();" />
							</ld:check>
						</div>
						<div class="divbutton2">
						<ld:check mark="rightDelete"> 
							<input type="submit" value="删除" class="button2"
								onMouseOver="this.className='button2Over'"
								onMouseOut="this.className='button2Out'"
								onclick="deleteItems();" />
						</ld:check>
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
								商品名称
							</td>
							<td width="8%">
								所属类别
							</td>
							<td width="8%">
								商品价格
							</td>
							<td width="8%">
								展示数量
							</td>
							<td width="8%">
								库存
							</td>
							<td width="9%">
								操作
							</td>
						</tr>
						<c:forEach items="${goodsList}" var="item" varStatus="status">
							<tr onclick="showItem(${item.id});"
								class="tableitem${6-status.index%2}"
								onMouseOver="this.className='tableitem9';this.style.cursor='hand';"
								onMouseOut="this.className='tableitem${6-status.index%2}';this.style.cursor='hand';"
								<ld:check mark="operateLogDetail">onclick="showItem(${item.id});"</ld:check>>
								<td>
									 ${status.count}
								</td>
								<td>
									${item.goodsName}
								</td>
								<td>
									${item.categoryId}
								</td>
								<td>
									${item.goodsPrice}
								</td>
								<td>
									${item.frontAccount}
								</td>
								<td>
									${item.backAccount}
								</td>
								<td>
									
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="tablebottom">
					<div class="tablebottomright">
						<form
							action="${basePath}back/goodsAction!loadAll.action"
							id="pagerForm" method="post" name="pagerForm"
							class="dmg-listli-item2">
							
							<ld:pager type="form" action="pagerForm" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>

