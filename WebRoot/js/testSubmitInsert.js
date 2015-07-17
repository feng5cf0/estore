var validateVal;//校验版本号的定时器
//全角转半角
	function FtoHValue(str){
　　		var result="";
	　　for (var i = 0; i < str.length; i++){ 
	　　　if (str.charCodeAt(i)==12288){ 
	　　　　result+= String.fromCharCode(str.charCodeAt(i)-12256); 
	　　　　continue; 
	　　　} 
	　　　if (str.charCodeAt(i)>65280 && str.charCodeAt(i)<65375) result+= String.fromCharCode(str.charCodeAt(i)-65248); 
	　　　else result+= String.fromCharCode(str.charCodeAt(i)); 
	　　}
　　		return result; 
　	} 
	
function setVersionName(){
	var versionName = document.getElementById('testSubmit.versionName');
	versionName.value = "";
	document.getElementById('tdVersionName').innerHTML = "";
	var upload = FtoHValue(document.getElementById('testSubmit.fileName').value);//把全角转为半角
	//var fileIndex = upload.lastIndexOf("\\");
	var allname = upload.substring(0,upload.length-4);
	var allnameLen = allname.split("-");
	if(allnameLen.length==6){
		//var name = upload.substring(0,upload.length-11);
		var versionIndex = allname.lastIndexOf("-");
		var version = allname.substring(versionIndex+1);
		/*验证版本号*/
		var resultVersion ="";
		if(version.length>6){
			var v1 = version.substring(0,2);
			var v2 = version.substring(2,4);
			var v3 = version.substring(4);
			resultVersion = v1+"-"+v2+"-"+v3;
			if(isValidVersionDate(resultVersion)){
				versionName.value = resultVersion;
				document.getElementById('tdVersionName').innerHTML = resultVersion;
			}else if(isValidVersionStart(resultVersion) && ")"==resultVersion.substring(resultVersion.length-1)){
				versionName.value = resultVersion;
				document.getElementById('tdVersionName').innerHTML = resultVersion;
			}else{
				alert("归档包名称中的版本号格式不对，其格式为:XX-YY-ZZ,或者：XX-YY-ZZ(XXX)");
				document.getElementById('button_ok').disabled=true;
				return false;
			}
		}else if(version.length==6){
			var v1 = version.substring(0,2);
			var v2 = version.substring(2,4);
			var v3 = version.substring(4);
			resultVersion = v1+"-"+v2+"-"+v3;
			if(isValidVersion(resultVersion)){
				versionName.value = resultVersion;
				document.getElementById('tdVersionName').innerHTML = resultVersion;
			}else{
				alert("归档包名称中的版本号格式不对，其格式为:XX-YY-ZZ,或者：XX-YY-ZZ(XXX)");
				document.getElementById('button_ok').disabled=true;
				return false;
			}
		}else{
			alert("归档包名称中的版本号格式不对，其格式为:XX-YY-ZZ,或者：XX-YY-ZZ(XXX)");
			document.getElementById('button_ok').disabled=true;
			return false;
		}
	}else{
		alert("归档包名称中的版本号格式不对，其格式为:XX-YY-ZZ,或者：XX-YY-ZZ(XXX)");
		document.getElementById('button_ok').disabled=true;
		return false;
	}
	return isVersionName();
}
//上传归档包
function showFileUploadWindow(selectFlag,fileType){
	var winFeatures='dialogHeight:320px;dialogWidth:480px;center:yes;resizable=yes';
	var parameterObj = new Array();
	parameterObj.selectFlag = selectFlag;
	parameterObj.fileType = fileType;
	var arrayStr = window.showModalDialog("fileTrList!showUpload.action",parameterObj,winFeatures);
	if(arrayStr!=null){
		var resultAry = arrayStr[0].split(";");
		document.getElementById("testSubmit.fileName").value = resultAry[0].substr(resultAry[0].lastIndexOf("\\")+1); 
		document.getElementById("spanFileName").innerHTML = resultAry[0].substr(resultAry[0].lastIndexOf("\\")+1); 
		var resultValue = setVersionName();//验证版本名称
		if(!resultValue){
			validateUploadFile(resultAry[0]); 
			//validateVal=setInterval(validateUploadFile(resultAry[0]),15000);//校验归档包
		}
	}
}
//是否存在版本名称
function isVersionName()
{
	document.getElementById('versionName_error').innerHTML="";
	var app_Id =document.getElementById('appId').value;
	var versionName =document.getElementById('testSubmit.versionName').value;
	var testSubmitId =document.getElementById('testSubmit.id').value;
	var url = path+"lams/testSubmitInsert!isVersionNameWithOutId.action";
	if(versionName!=null && versionName.trim().length!=0)
	{
		$.ajax({
			url:url,
			type:'post',
			data:{
				appId:app_Id,
				testSubmitId:testSubmitId,
				versionName:versionName
			},
				dataType:'text',
				timeout:60000,
				error: function(e) {},
				success: function(result){
				var obj = eval(result);
				if(obj)
				{
					document.getElementById('versionName_error').innerHTML="版本名称已存在，请重新填写版本名称!";
					document.getElementById('button_ok').disabled=true;
					return false;
				}
				else
				{
					//document.getElementById('versionName_error').innerHTML="与归档包地址中的一致，且格式为:XX-YY-ZZ 如：01-01-01";
					document.getElementById('button_ok').disabled=false;
					return true;
				}

			}
		});				
	}else{
		alert("版本名称不能为空!");
		document.getElementById('button_ok').disabled=true;
		return false;
	}
}	
		
//校验归档包
function validateUploadFile(tmpDirec)
{
	//显示校验的进度条
	alertinfo('alertdiv');
	var app_Id =document.getElementById('appId').value;
	var url = path+"lams/testSubmitInsert!validateArcPkg.action";
	if(app_Id!=null && app_Id.trim().length!=0){
		$.ajax({
			url:url,
			type:'post',
			data:{
				appId:app_Id,
				uploadDirectory:tmpDirec
			},
				dataType:'text',
				timeout:60000,
				error: function(e) {},
				success: function(result){
				var resArray = result.split("###");
				var obj = eval(resArray[0]);
				if(!obj){
					document.getElementById('error').innerHTML=resArray[1];
					document.getElementById('button_ok').disabled=true;
					//取消校验进度条
					closediv('alertdiv');
					clearInterval(validateVal);
				}else{
					document.getElementById('error').innerHTML="";
					document.getElementById('testSubmit.filePath').value = resArray[1];
					//document.getElementById('button_ok').disabled=false;
					//取消校验进度条
					closediv('alertdiv');
					clearInterval(validateVal);
				}
			}
		});				
	}else{
		//取消进度条
		closediv('alertdiv');
		alert("应用不能为空！");
	}
}
function alertinfo(id){
	//显示弹出层
	var obj = document.getElementById(id); 
	var W = screen.width;//取得屏幕分辨率宽度
	var H = screen.height;//取得屏幕分辨率高度
	var yScroll;//取滚动条高度
	if (self.pageYOffset) { 
		yScroll = self.pageYOffset; 
	}else if(document.documentElement && document.documentElement.scrollTop){ 
		yScroll = document.documentElement.scrollTop; 
	}else if(document.body) {
		yScroll = document.body.scrollTop; 
	} 
	//obj.style.marginLeft= (W/2 - 200) + "px";
	obj.style.top= (H/2 - 200　+　yScroll) + "px";
	document.getElementById("bg").style.display="block";
	obj.style.display="block"; var scrollstyle = scrolls();
	scrollstyle.style.overflowX = "hidden"; 
	scrollstyle.style.overflowY = "hidden"; 
} 
 
function closediv(id){
	//关闭弹出层
	document.getElementById(id).style.display="none"; 
	document.getElementById("bg").style.display="none";
	var scrollstyle = scrolls(); 
	scrollstyle.style.overflowY = "auto"; 
	scrollstyle.style.overflowX = "hidden";
} 
 
function scrolls(){
	//取浏览器类型
	var temp_h1 = document.body.clientHeight; 
	var temp_h2 = document.documentElement.clientHeight; 
	var isXhtml = (temp_h2<=temp_h1&&temp_h2!=0)?true:false; 
	var htmlbody = isXhtml?document.documentElement:document.body;
	return htmlbody; 
}

function isValidVersion( nickname ) {
	var regex = /^[0-9]{2}[\-][0-9]{2}[\-][0-9]{2}$/;
	if ( regex.test( nickname ) == false ) {
		return false;
	} 
	return true;
}

//是否为有效的版本编号，格式 xx-xx-xx(yyyyMMdd) 如：01-01-02(20120614)
function isValidVersionDate( nickname ) {
	var regex = /^[0-9]{2}[\-][0-9]{2}[\-][0-9]{2}[\(][0-9]{8}[\)]$/;
	if ( regex.test( nickname ) == false ) {
		return false;
	} 
	return true;
}
//是否为有效的版本编号，格式 xx-xx-xx(yyyyMMdd) 如：01-01-02(20120614)
function isValidVersionStart( nickname ) {
	var regex = /^[0-9]{2}[\-][0-9]{2}[\-][0-9]{2}[\(]/;
	if ( regex.test( nickname ) == false ) {
		return false;
	} 
	return true;
}