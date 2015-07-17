//获取对话框参数(1280*600)
function getLargeWindowFeatures(){
	var winFeatures='dialogHeight:600px;dialogWidth:1280px;center:yes;resizable=yes;status=no;';
	return winFeatures;
}
//获取对话框参数(1024*600)
function getMediumWindowFeatures(){
	var winFeatures='dialogHeight:600px;dialogWidth:1024px;center:yes;resizable=yes;status=no;';
	return winFeatures;
}
//获取对话框参数(800*500)
function getSmallWindowFeatures(){
	var winFeatures='dialogHeight:500px;dialogWidth:800px;center:yes;resizable=yes;status=no;';
	return winFeatures;
}



/**
  *	打开对话框
  *
  *	url:要打开的地址
  * param:需要传递的参数(非必需)
  *	features:窗口参数(非必需)
  *	model:是否打开模态对话框(取值:true或者false)(非必需)
  */
function showDialog(url,features){
	if(!!!features){
		features = getLargeWindowFeatures();
	}
	
	return window.showModalDialog(url,null,features);
}

/**
  *	打开大窗口对话框(1280*600)
  *
  *	url:要打开的地址
  * param:需要传递的参数(非必需)
  *	features:窗口参数(非必需)
  *	model:是否打开模态对话框(取值:true或者false)(非必需)
  */
function showLargeDialog(url){
	var	features = getLargeWindowFeatures();
	return showDialog(url,features);
}


/**
  *	打开中等窗口对话框(1024*600)
  *
  *	url:要打开的地址
  * param:需要传递的参数(非必需)
  *	features:窗口参数(非必需)
  *	model:是否打开模态对话框(取值:true或者false)(非必需)
  */
function showMediumDialog(url){
	var	features = getMediumWindowFeatures();
	return showDialog(url,features);
}

/**
  *	打开小窗口对话框(800*500)
  *
  *	url:要打开的地址
  * param:需要传递的参数(非必需)
  *	features:窗口参数(非必需)
  *	model:是否打开模态对话框(取值:true或者false)(非必需)
  */
function showSmallDialog(url){
	var	features = getSmallWindowFeatures();
	return showDialog(url,features);
}

/**
  *
  * 打开全屏页面
  */
function winOpenFullScreen(strURL)
{
	var sheight = screen.height-70;
	var swidth = screen.width-10;
	var winoption ="fullscreen,left=0,top=0,height="+sheight+",width="+swidth+",toolbar=yes,menubar=yes,location=yes,status=yes,scrollbars=yes,resizable=yes";
	
	var tmp=window.open(strURL,'',winoption);
	return tmp;
}

/**
  *
  * 取消录入操作
  */
function cancelInput(){
	window.returnValue = null;
	window.close();	
}