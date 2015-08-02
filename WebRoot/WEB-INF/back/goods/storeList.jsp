<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>应用类型管理</title>
		<%@include file="/headDeclare.jsp"%>
		<style> 
  			.black_overlay{  
  				display: none;  
  				position: absolute;  
  				top: 0%;  left: 0%;  width: 100%;  height: 100%;  
  				background-color: white;  z-index:1001;  -moz-opacity: 0.8;  
  				opacity:.80;  filter: alpha(opacity=80);  
  			}  
  			.accountDiv {
  				display: none;  position: absolute;  
  				top: 25%;  left: 25%;  width: 50%;  height: 50%;  
  				padding: 16px;  border: 16px solid orange;  background-color: white;  
  				z-index:1002;  overflow: auto;  
  			}
		</style> 
		<script language="javascript">
			function categorySelect(){
				alert();
				document.getElementById('categoryDiv').style.display='block';
				document.getElementById('fade').style.display='block'
			}
			function fileValue(){
			
			}
		}
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
						您当前位置：进销存管理 &gt; 库房管理
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
									库存信息
								</td>
								<td class="tabr">
									&nbsp;
								</td>
							</tr>
						</table>
					</div>
				</div>
				<form name="deleteForm" action="${basePath}back/goodsAction!delete.action" method="post">
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
								库存
							</td>
							<td width="8%">
								前台展示库存
							</td>
							<td width="9%">
								操作
							</td>
						</tr>
						<c:forEach items="${goodsList}" var="item" varStatus="status">
							<tr
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
									${item.backAccount}
								</td>
								<td>
									<a onclick="categorySelect();">${item.frontAccount}</a>
								</td>
								<td>
									
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				</form>
				<div class="tablebottom">
					<div class="tablebottomright">
						<form
							action="${basePath}back/storeAction!loadAll.action"
							id="pagerForm" method="post" name="pagerForm"
							class="dmg-listli-item2">
							
							<ld:pager type="form" action="pagerForm" />
						</form>
					</div>
				</div>
			</div>
		</div>
		<div id="accountDiv" class="accountDiv" >
		  <form name="frontAccountForm" action="">
			<table width="100%" id="table1" border="1" cellpadding="0"
				cellspacing="1" bordercolor="98a8cc"
				style="background-color: ffffff; border-collapse: collapse; display: inherit;"
				frame="border">
			<tr>
				<span>前台展示数量:</span><input type="text" name="goods.frontAccount" id="goods.frontAccount" value="${goods.frontAccount}"/>
			</tr>
			</table>
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
				<tr>
					<td>&nbsp;</td>
					<td align="center">
						<input type="button" value="修 改" class="button4"
							onmouseover="this.className='button4Over'"
							onmouseout="this.className='button4Out'"
							onclick="document.getElementById('categoryDiv').style.display='none';document.getElementById('fade').style.display='none'" />
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td align="center">
						<input type="button" value="关 闭" class="button4"
							onmouseover="this.className='button4Over'"
							onmouseout="this.className='button4Out'"
							onclick="document.getElementById('categoryDiv').style.display='none';document.getElementById('fade').style.display='none'" />
					</td>
				</tr>
			</table>
		  </form>
		</div>
		<div id="fade" class="black_overlay"></div>
	</body>
</html>

