<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%@include file="/headDeclare.jsp"%>
		<script type="text/javascript">

			function checkValue(){
			
				
				var year = document.getElementById("year").value;
				var beginDate = document.getElementById("beginDate").value;
				var endDate = document.getElementById("endDate").value;
				
				if(year==""){
					alert("年份不能为空！");
					return false;
				}
				if(beginDate==""){
					alert("年份不能为空！");
					return false;
				}
				if(endDate==""){
					alert("年份不能为空！");
					return false;
				}
				
				if(beginDate>endDate){
					alert("开始时间晚于结束时间！");
					document.getElementById("beginDate").value = "";
					document.getElementById("endDate").value = "";
					return false;
				}
				return true;
			}
			function reset2(){
				document.getElementById("year").value="";
				document.getElementById("beginDate").value="";
				document.getElementById("endDate").value="";
			}
		</script>
	</head>
	<body>
		<div id="rightcontent">
			<div id="road" class="road">
				<div class="roadItem">
					<div class="roadIcon"></div>
					<div class="roadItem2">
						您当前位置：数据管理 &gt; 学费信息导出
					</div>
				</div>
			</div>
			<div class="righttitle">
				<div class="tab1">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td class="tabl">
										&nbsp;
							</td>
							<td class="tabm">
										学费信息
							</td>
							<td class="tabr">
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="buttonbg">
				<div class="divbutton2">
					<input type="button" value="数据导出" class="button3"
									onMouseOver="this.className='button3Over'"
									onMouseOut="this.className='button3Out'" onclick="exportPay();" />
				</div>
			</div>
			<div class="roadbody">
						<form action="${basePath}core/ttAction!exportPay.action" onsubmit="return checkValue();" method="post" encType="multipart/form-data">
							<table class="rightseach2">
								<tr>
									<td width="10%" align="center">
										<label for="textfield">
											缴费日期：
										</label>
									</td>
									<td width="6%" align="left">
										<input name="year" type="text" class="Wdate" style="width:50px;height:20px;"
											id="year" value="${year }" readonly="readonly" onfocus="WdatePicker({maxDate:'%y-%M-%d',dateFmt:'yyyy'});"/>年
									</td>
									<td width="6%" align="left">
										<input name="beginDate" type="text" class="Wdate" style="width:50px;height:20px;"
											id="beginDate" value="${beginDate }" readonly="readonly" onfocus="WdatePicker({maxDate:'%y-%M-%d',dateFmt:'MM-dd'});"/>
									</td>
									<td width="6%" align="left">至
										<input name="endDate" type="text" class="Wdate" style="width:50px;height:20px;"
											id="endDate" value="${endDate }" readonly="readonly" onfocus="WdatePicker({maxDate:'%y-%M-%d',dateFmt:'MM-dd'});"/>
									</td>
									<td width="16%">
										<input type="button" value="重置" class="button2" onclick="reset2();"
											onmouseover="this.className='button2Over'"
											onmouseout="this.className='button2Out'"/>
										<input type="submit" value="导出" class="button2"
											onmouseover="this.className='button2Over'"
											onmouseout="this.className='button2Out'" />
										<input type="hidden" value="0" name="pager.curPageNum" />
									</td>
									<td width="16%"></td>
									<td width="16%"></td>
									<td width="24%"></td>
								</tr>
							</table>
						</form>
					</div>
		</div>
		
		<!-- 刷新页面使用 -->
		<form action="core/ttAction!loadTTInfo.action" id="updateJsp">
		
		</form>
	</body>
</html>

