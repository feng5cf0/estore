<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>进货</title>
		<style type="text/css">
  			.black_overlay{  
  				display: none;  
  				position: absolute;  
  				top: 0%;  left: 0%;  width: 100%;  height: 100%;  
  				background-color: white;  z-index:1001;  -moz-opacity: 0.8;  
  				opacity:.80;  filter: alpha(opacity=80);  
  			}  
  			.categoryDiv {
  				display: none;  position: absolute;  
  				top: 25%;  left: 25%;  width: 50%;  height: 50%;  
  				padding: 16px;  border: 16px solid orange;  background-color: white;  
  				z-index:1002;  overflow: auto;  
  			}
		</style>
		<script type="text/javascript">
			function categorySelect(){

				document.getElementById('categoryDiv').style.display='block';
				document.getElementById('fade').style.display='block'
			}
			function fileValue(id,name){
				var _id = 0-parseInt(id);
				var _name = name;
				
				document.getElementById('categoryDiv').style.display='none';
				document.getElementById('fade').style.display='none'
				
				document.getElementById("goodsIn.goodsId").value = _id;
				document.getElementById("goodsName").value = _name;
			}
		</script>
	</head>

	<body style="overflow: auto">
		<form action="back/goodsInAction!addBatch.action" method="post">
			<div id="rightcontent">
				<div id="road" class="road">
					<div class="roadItem">
						<div class="roadIcon"></div>
						<div class="roadItem2">
							您当前位置：商品管理 &gt; 进货管理 &gt; 进货登记
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
											进货单信息
										</td>
										<td class="tabr">
										</td>
									</tr>
								</table>
							</div>
							<div class="tab4" id="error">
								<%--${error}--%>
							</div>
						</div>
						<div class="buttonbg1"></div>
						<div class="divtable">
							<table width="100%" border="0" cellspacing="1" cellpadding="0"
								bgcolor="#cecece">
								<input type="hidden" name="pager.curPageNum"
									value="${pager.curPageNum}" />
								<tr>
									<td width="200" class="tableitem1">
										商品名称
									</td>
									<td class="tableitem3">
										<input type="hidden" name="goodsIn.goodsId" id="goodsIn.goodsId" value="${goodsIn.goodsId}"/>
										<input name="goodsName" type="text" class="dmg-input"
											id="goodsName" value="${goodsName}" maxlength="8" onclick="categorySelect();" readonly="readonly"/>
										<FONT color=red>*</FONT>
									</td>
								</tr>
								<tr>
									<td class="tableitem4">
										进价：
									</td>
									<td class="tableitem2">
										<input name="inPrice" type="text" class="dmg-input"
											id="goodsIn.inPrice" value="${goodsIn.inPrice}" maxlength="8" />
										<FONT color=red>*</FONT>
									</td>
								</tr>
								<tr>
									<td width="200" class="tableitem1">
										供应商：
									</td>
									<td class="tableitem3">
										<input type="text" class="dmg-input" id="goodsIn.supplier"
											name="goodsIn.supplier" value="${goodsIn.supplier}" maxlength="8" />
										<FONT color=red>*</FONT>
									</td>
								</tr>
								<tr>
									<td class="tableitem4">
										进货日期：
									</td>
									<td class="tableitem2">
										<input type="text" class="dmg-input" id="inDate"
											name="inDate" value="${inDate}" maxlength="8" />
									</td>
								</tr>
								<tr>
									<td class="tableitem1">
										商品数量：
									</td>
									<td class="tableitem3" id="belongAreaName">
										<input type="text" class="dmg-input" id="goodsIn.inNumber"
											name="goodsIn.inNumber" value="${goodsIn.inNumber}" maxlength="8" />
									</td>
								</tr>
								<tr>
									<td class="tableitem4">
										备注：
									</td>
									<td class="tableitem2">
										<label for="textarea"></label>
										<textarea name="goodsIn.memo" id="goodsIn.memo" cols="45" rows="5">${goodsIn.memo}</textarea>
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
											<ld:check mark="saleManager">
												<input type="submit" value="确 定" class="button4"
													onMouseOver="this.className='button4Over'"
													onMouseOut="this.className='button4Out'"
													onclick="return checkSubmit();" />
											</ld:check>
										</td>
										<td> 
											&nbsp;
										</td>
										<td align="center">
											<input type="button" value="关 闭" class="button4"
												onMouseOver="this.className='button4Over'"
												onMouseOut="this.className='button4Out'"
												onclick="history.go(-1);" />
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		<div id="categoryDiv" class="categoryDiv" >
			<table width="100%" id="table1" border="1" cellpadding="0"
				cellspacing="1" bordercolor="98a8cc"
				style="background-color: ffffff; border-collapse: collapse; display: inherit;"
				frame="border">
			<tr>
				<td>
					<script type="text/javascript">
						d = new dTree('d');
						<c:forEach items="${categoryList}" var="item">
							<c:choose>
								<c:when test="${item.id < 0}">
									var id = ${item.id};
									var name = "${item.categoryName}";
									d.add(${item.id},${item.parentCategory},'${item.categoryName}','javascript:fileValue(${item.id},\''+name+'\');');
								</c:when>
								<c:when test="${item.id > 0}">
									var id = ${item.id};
									var name = "${item.categoryName}";
									d.add(${item.id},${item.parentCategory},'${item.categoryName}');
								</c:when>
							</c:choose>
						</c:forEach>
						d.config.useSelection = false;
						d.config.useIcons=false;
						document.write(d);
     				</script>
				</td>
			</tr>
		</table>
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
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
		</div>
		<div id="fade" class="black_overlay"></div>
	</body>
</html>


