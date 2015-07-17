<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<html>
	<head>
		<script type="text/javascript">
var cur;
var total = 8;
var flag = 0;
function addDiv(cont,tar,index){
	var tr1 = document.getElementById("tr1");
	for(var i = 1 ; i <= total ;i++){
		var td = tr1.children[i];	
		var tdId = td.id.substr(2,1);
		if(td.style.display=="none"){
			continue;
		}
		var ct = td.innerHTML;
				if(ct!="&nbsp;"){
						
						if(ct.indexOf(">"+cont+"<")!=-1){
							switchToContent(parseInt(tdId)+1);
							break;
						}
				}
				if(ct.trim()=="&nbsp;"){
				if(i==total){ //当到最后一个，判断是否还有隐藏的，若有删除，在添加新的  id注意 。 保持ID与frameset一致
					resetDisplay();
				}
				cur= i;
				 parent.contentFrame.document.getElementById("content"+( parseInt(tdId)+1)).src=tar;	
				td.width="100";
				if(cont.length>4){
					changeTdWidth(cont,td);
				}
				if(cont.length>6){
				td.innerHTML = "<div class=\"title2div\"  style=\"cursor:pointer;\" ><table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" onmouseout=\"this.style.cursor='hand';\" onmousemove=\"this.style.cursor='hand';\"  onclick=\"switchToContent( "+(parseInt(tdId)+1)+")\" ondblclick=\"removeThis(this.rows[0].cells[this.rows[0].cells.length-1].children[0].children[0],"+parseInt(tdId)+");\"><tr><td class=\"title2letf\">&nbsp;</td><td class=\"title2M\" ><marquee  align=\"left\" loop=\"-1\" scrollamount=\"8\" scrolldelay=\"100\" style='display:none; width:110px' onMouseOut=\"changeCnt(this,'"+cont+"','"+tdId+"');\">"
+cont+"</marquee><span   align=\"left\" onMouseOver=\"changeMar(this,'"+cont +"');\"  onMouseOut=\"changeSpan(this);\">"+cont.substr(0,6)+"</span></td><td valign=\"top\" class=\"tiele2right\"><div class=\"imagedel\" id=\"image" +parseInt(tdId)+"\"><img src=\"css/images/deldd.png\"  width=\"22\" height=\"25\" onmouseout=\"this.src='css/images/deldd.png'\" onmousemove=\"this.src='css/images/delddon.png'\" onclick=\"removeThis(this,"+parseInt(tdId)+");window.event.cancelBubble = true;\"  /></div></td> </tr></table></div> ";
}else{
	td.innerHTML = "<div class=\"title2div\"  style=\"cursor:pointer;\" ><table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" onmouseout=\"this.style.cursor='hand';\" onmousemove=\"this.style.cursor='hand';\"  onclick=\"switchToContent( "+(parseInt(tdId)+1)+")\" ondblclick=\"removeThis(this.rows[0].cells[this.rows[0].cells.length-1].children[0].children[0],"+parseInt(tdId)+");\"><tr><td class=\"title2letf\">&nbsp;</td><td class=\"title2M\">"+cont+"</td><td valign=\"top\" class=\"tiele2right\"><div class=\"imagedel\" id=\"image" +parseInt(tdId)+"\"><img src=\"css/images/deldd.png\"  width=\"22\" height=\"25\" onmouseout=\"this.src='css/images/deldd.png'\" onmousemove=\"this.src='css/images/delddon.png'\" onclick=\"removeThis(this,"+parseInt(tdId)+");window.event.cancelBubble = true;\"  /></div></td> </tr></table></div> ";
}
				flag=1;
				switchToContent(parseInt(tdId)+1);
				break;
				}
	}
}


function changeCnt(obj,cont,tdId){
	obj.stop();
	obj.style.display="none";
	obj.parentElement.children[1].style.display="";
}

function changeMar(obj,cont){
	obj.style.display="none";
	obj.parentElement.children[0].style.display="";
	obj.parentElement.children[0].start();
	
}

function changeSpan(obj){

}

function changeTdWidth(cont,td){
	if(cont.length==5){
		td.width="120";
	}
	if(cont.length>=6){
		td.width="140";
	}
	
}

	function changeLabelCss(id){
		for(var i = 1 ; i <= total ;i++){
			var td = document.getElementById("td"+i);
			if(td==null){
				continue;
			}
			var ct = td.innerHTML;
			try{
			if(ct!="&nbsp;"&&td.style.display!="none"){
				if(i!=id){ 
					var div = td.children[0];
					div.className="title3div";
					div.children[0].onmousemove=function(){changeStyle(this);}
					div.children[0].onmouseout=function(){removeStyle(this);}
					var tr = div.children[0].rows[0];
					tr.cells[0].className="title3letf";
					tr.cells[1].className="title3M";
					tr.cells[2].className="tiele3right";
					document.getElementById("image" + i).style.display="none";
				}else{
					var div = td.children[0];
					div.className="title2div";
					div.children[0].onmousemove=function(){this.style.cursor="hand";}
					div.children[0].onmouseout=function(){this.style.cursor="hand";}
					div.children[0].style.cursor="hand";
					var tr = div.children[0].rows[0];
					tr.cells[0].className="title2letf";
					tr.cells[1].className="title2M";
					tr.cells[2].className="tiele2right";
					
					document.getElementById("image" + i).style.display="";
				}
			}
			}catch(e){
			
			}
		}
		var titleImg = document.getElementById("titleImg");
		if(id==0){
			titleImg.src="css/images/title1on.png";
			titleImg.onmouseout="";
		}else{
			titleImg.src="css/images/title1.png";
			titleImg.onmouseout="this.src='css/images/title1.png'";
			titleImg.onmousemove="this.src='css/images/title1on.png'"
		}
	}


// 取值1-8,1为主控台
	function switchToContent(id){
	

		switch(id){
			
			case 1:parent.contentFrame.cols="*,0,0,0,0,0,0,0,0";break;
			case 2:parent.contentFrame.cols="0,*,0,0,0,0,0,0,0";break;
			case 3:parent.contentFrame.cols="0,0,*,0,0,0,0,0,0";break;
			case 4:parent.contentFrame.cols="0,0,0,*,0,0,0,0,0";break;
			case 5:parent.contentFrame.cols="0,0,0,0,*,0,0,0,0";break;
			case 6:parent.contentFrame.cols="0,0,0,0,0,*,0,0,0";break;
			case 7:parent.contentFrame.cols="0,0,0,0,0,0,*,0,0";break;
			case 8:parent.contentFrame.cols="0,0,0,0,0,0,0,*,0";break;
			case 9:parent.contentFrame.cols="0,0,0,0,0,0,0,0,*";break;
		}
	
		changeLabelCss(id-1);
		
	}


function removeThis(obj,tdId){
	
	    var oRow = obj.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement;
		oRow.innerHTML="&nbsp;";
		oRow.style.display="none";
		var td = document.getElementById("td8");
		if(td.innerHTML!="&nbsp;"||td.style.display=="none"){
			resetDisplay();
	   }
	  show();
	  cur = cur-1;
}

function show(){  //删除后显示
	var tr1 = document.getElementById("tr1");
	var showFlag = 0 ;
	for(var i = 1 ;i <=7; i++){
		var td = tr1.children[i];	
		if(td.style.display!="none"&&td.innerHTML.trim()!="&nbsp;"){
			showFlag=1;
			var s = td.id.substr(2,1);
			switchToContent(parseInt(s)+1);
		}
	}
	if(showFlag==0){
		resetMenu();
	}
}
//选中样式
function changeStyle(obj){	
	var td = obj.parentElement.parentElement;
	var tdId = td.id.substr(2,1);
	var div = td.children[0];
	div.className="title4div";
	var tr = div.children[0].rows[0];
	tr.cells[0].className="title4letf";
	tr.cells[1].className="title4M";
	tr.cells[2].className="tiele4right";
	document.getElementById("image" + tdId).style.display="";

}
//离开时的样式
function removeStyle(obj){	
	var td = obj.parentElement.parentElement;
	var tdId = td.id.substr(2,1);
	var div = td.children[0];
	div.className="title3div";
	var tr = div.children[0].rows[0];
	tr.cells[0].className="title3letf";
	tr.cells[1].className="title3M";
	tr.cells[2].className="tiele3right";
	document.getElementById("image" + tdId).style.display="none";
}
function resetDisplay(){
		var tr1 = document.getElementById("tr1");
		for(var j = 1 ; j<=total ; j++){
					var td = tr1.children[j];	
					var tdId = td.id.substr(2,1);
					if(td.style.display=="none"){
						td.removeNode(td);
						var td1 = tr1.insertCell();
						td1.width = "100";
						td1.id="td"+parseInt(tdId);
						td1.align = "left";
						td1.innerHTML="&nbsp;";    
						parent.document.getElementById("content"+(parseInt(tdId)+1)).src="";
					}
	}
}
function resetMenu(){
	var tr1 = document.getElementById("tr1");
		for(var i= 1 ;i<=total ;i++){
			var td = document.getElementById("td"+i);
				//td.removeNode(td);
				td.innerHTML = '&nbsp;';
				td.width="100";
				td.align="left";
				parent.document.getElementById("content"+(i+1)).src="";
		}
	//tr1.toString();
	//alert("1");
	//for(var i= 1 ;i<=7 ;i++){
	//		var td1 = tr1.insertCell();
	//					td1.width = "100";
	//					td1.id="td"+i;
	//					td1.align = "left";
	//					td1.innerHTML="&nbsp;";    
	//					
	//	
	//}
	switchToContent(1);
}

function replaceTd(replaceTd){
	var j = replaceTd;
	  for(var i = replaceTd ; i <= total ;i++){
		 
		var td = document.getElementById("td"+i);
		if(td==null){
			continue;
		}
		var str = td.innerHTML;
		if(str!="&nbsp;" ){ 
			 str = str.replace("removeThis(this,"+i+");","removeThis(this,"+j+");");
			 document.getElementById("td"+j).innerHTML= str;
		
			 if(i!=j){
				 document.getElementById("td"+i).innerHTML= "&nbsp;";
				
			 }
			 j++;
		}
	}
}
function selectConsole(title){
	title.src="css/images/title1on.png";
	title.onmouseout="";
	switchToContent(1);
}
function closeAllTag(){
  if (confirm("确认关闭全部标签吗?"))
    {
   	 resetMenu();
    }
}
</script>
	</head>

	<body>
		<div class="dmg-title">
			<table style="float: left;" border="0" cellspacing="0"
				cellpadding="0">
				<tr id="tr1" align="left" style="word-break: keep-all;">
					<td width="180">
						<img id="titleImg" src="css/images/title1.png"
							style="cursor: pointer;" width="180" height="40"
							onmouseout="this.src='css/images/title1.png'"
							onmousemove="this.src='css/images/title1on.png'"
							onclick="selectConsole(this)" />
					</td>
					<td width="100" align="left" id="td1">
						&nbsp;
					</td>
					<td width="100" align="left" id="td2">
						&nbsp;
					</td>
					<td width="100" align="left" id="td3">
						&nbsp;
					</td>
					<td width="100" align="left" id="td4">
						&nbsp;
					</td>
					<td width="100" align="left" id="td5">
						&nbsp;
					</td>
					<td width="100" align="left" id="td6">
						&nbsp;
					</td>
					<td width="100" align="left" id="td7">
						&nbsp;
					</td>
					<td width="100" align="left" id="td8">
						&nbsp;
					</td>
				</tr>
			</table>
			<div
				style="margin-top: 5px; margin-right: 10px; width: 35; float: right;">
				<img src="css/images/off.png" width="26" height="26"
					onmouseout="this.src='css/images/off.png'"
					onmousemove="this.src='css/images/offon.png'"
					onclick="closeAllTag();" style="cursor: pointer;" title="全部删除" />
			</div>
		</div>
	</body>
</html>
