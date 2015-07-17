/*
	版权所有 2009-2012 武汉命运科技有限公司
	保留所有权利
	官方网站：http://www.ncmem.com/
	产品首页：http://www.ncmem.com/webplug/http-uploader3/index.aspx
	在线演示：http://www.ncmem.com/products/http-uploader3/demo/index.html
	产品介绍：http://www.cnblogs.com/xproer/archive/2012/02/17/2355440.html
	开发文档-ASP：http://www.cnblogs.com/xproer/archive/2012/02/17/2355458.html
	开发文档-PHP：http://www.cnblogs.com/xproer/archive/2012/02/17/2355467.html
	开发文档-JSP：http://www.cnblogs.com/xproer/archive/2012/02/17/2355462.html
	开发文档-ASP.NET：http://www.cnblogs.com/xproer/archive/2012/02/17/2355469.html
	升级日志：http://www.cnblogs.com/xproer/archive/2012/02/17/2355449.html
	示例下载：http://www.ncmem.com/download/HttpUploader3-demo.rar
	Discuz!X2插件：http://www.ncmem.com/download/HttpUploader3-DiscuzX2.rar
	文档下载：http://www.ncmem.com/download/HttpUploader3-doc.rar
	问题反馈：http://www.ncmem.com/blog/guestbook.asp
	Windows数字证书补丁：http://www.ncmem.com/download/rootsupd.rar
	VC运行库：http://www.microsoft.com/download/en/details.aspx?displaylang=en&id=29
	联系信箱：1085617561@qq.com
	联系QQ：1085617561
*/

//删除元素值
Array.prototype.remove = function(val)
{
	for (var i = 0, n = 0; i < this.length; i++)
	{
		if (this[i] != val)
		{
			this[n++] = this[i]
		}
	}
	this.length -= 1
}

//全局对象
var HttpUploaderMgrInstance = null; //上传管理器实例

/*
	2009-11-5 文件管理类
	属性：
		UpFileList
*/
function HttpUploaderMgr()
{
	//http://www.ncmem.com/
	this.Domain = "http://" + document.location.host;
	this.ActiveX = {
		"Uploader"		: "LDSY.HttpUploader"
		, "Partition"	: "LDSY.HttpPartition"
	};
	
	//附加参数
	this.Fields = {
		"UserName": "test"
		, "UserPass": "test"
		,"uid":0
		,"fid":0
	};

	HttpUploaderMgrInstance = this;
	this.FileLstMgr = null;
	this.CombinBox = null;
	this.FileFilter = new Array(); //文件过滤器
	this.UploaderListCount = 0; 	//上传项总数
	this.UploaderList = new Object(); //上传项列表
	this.UnUploaderIdList = new Array(); //未上传项ID列表
	this.UploadIdList = new Array(); //正在上传的ID列表
	this.CompleteList = new Array(); //已上传完的HttpUploader列表
	
	//初始化路径
	this.InitPath = function()
	{
		this.Config["CabPath"] = this.Domain + this.Config["AppPath"] + this.Config["CabPath"];
		this.Config["PostUrl"] = this.Domain + this.Config["AppPath"] + this.Config["PostUrl"];
	};

	//获取加载字符串。
	this.GetHtml = function()
	{
		//加载拖拽控件
		var acx = "";
		//acx += '<object id="objFileDroper" classid="clsid:' + this.Config["ClsidDroper"] + '"';
		//acx += ' codebase="' + this.Config["CabPath"] + '" width="192" height="192" >';
		//acx += '</object>';
		//自动安装CAB
		acx += '<div style="display:none">';
		//文件上传控件
		acx += '<object id="objHttpUpLoader" classid="clsid:' + this.Config["ClsidUploader"] + '"';
		acx += ' codebase="' + this.Config["CabPath"] + '" width="1" height="1" ></object>';
		//文件夹选择控件
		acx += '<object id="objHttpUploaderPartition" classid="clsid:' + this.Config["ClsidPartition"] + '"';
		acx += ' codebase="' + this.Config["CabPath"] + '" width="1" height="1" ></object>';
		acx += '</div>';
		//上传列表项模板
		acx += '<div class="UploaderItem" id="UploaderTemplate">';
		acx += '<div class="UploaderItemLeft">';
		acx += '<div class="FileInfo">';
		acx += '<div class="FileName top-space">HttpUploader程序开发.pdf</div>';
		acx += '<div class="FileSize" child="1">100.23MB</div>';
		acx += '</div>';
		acx += '<div class="ProcessBorder top-space"><div class="Process"></div></div>';
		acx += '<div class="PostInf top-space">已上传:15.3MB 速度:20KB/S 剩余时间:10:02:00</div>';
		acx += '</div>';
		acx += '<div class="UploaderItemRight">';
		acx += '<div class="BtnInfo"><span class="Btn" >取消</span></div>';
		acx += '<div class="ProcessNum">35%</div>';
		acx += '</div>';
		acx += '</div>';
		//分隔线
		acx += '<div class="Line" id="FilePostLine"></div>';
		//上传列表
		acx += '<div id="UploaderPanel">';
		//acx += '<div class="header">上传文件</div>';
		acx += '<div class="toolbar">';
		acx += '<input id="btnAddFiles" type="button" value="选择文件" />';
		//acx += '<input id="btnAddFolder" type="button" value="选择文件夹" />';
		acx += '</div>';
		acx += '<div class="content">';
		acx += '<div id="FilePostLister"></div>';
		acx += '</div>';
		//acx += '<div class="footer">';
		//acx += '<a href="javascript:void(0)" class="Btn" id="lnkClearComplete">清除已完成文件</a>';
		//acx += '</div>';
		acx += '</div>';
		return acx;
	};

	//安全检查，在用户关闭网页时自动停止所有上传任务。
	this.SafeCheck = function()
	{
		window.attachEvent("onbeforeunload", function()
		{
			if (HttpUploaderMgrInstance.UploadIdList.length > 0)
			{
				event.returnValue = "您还有程序正在运行，确定关闭？";
			}
		});

		window.attachEvent("onunload", function()
		{
			if (HttpUploaderMgrInstance.UploadIdList.length > 0)
			{
				HttpUploaderMgrInstance.StopAll();
			}
		});
	};
	
	this.Load = function()
	{
		document.write(this.GetHtml());
		this.SafeCheck();
	};

	//加载到指定控件
	this.LoadInControl = function(ctlID)
	{
		var obj = document.getElementById(ctlID);
		obj.innerHTML = this.GetHtml();
		this.SafeCheck();
	};
	
	this.Droper = null;
	//初始化，一般在window.onload中调用
	this.Init = function()
	{
		this.UploaderListDiv = document.getElementById("FilePostLister");
		this.UploaderTemplateDiv = document.getElementById("UploaderTemplate");
		this.Droper = document.getElementById("objFileDroper");
		var mgr = this;
		if (null != this.Droper) this.Droper.OnFileDrop = function()
		{
			var list = mgr.Droper.GetSelectedFiles();
			for (var index = list.lbound(1); index <= list.ubound(1); ++index)
			{
				if (!mgr.Exist(list.getItem(index)))
				{
					mgr.AddFile(list.getItem(index));
				}
			}
			mgr.PostFirst();
		};
		//添加多个文件
		obj = document.getElementById("btnAddFiles");
		obj.attachEvent("onclick", function() { mgr.OpenFileDialog(); });
		//添加文件夹
		//obj = document.getElementById("btnAddFolder");
		//if (obj) obj.attachEvent("onclick", function() { mgr.OpenFolderDialog(); });
		//清空已完成文件
		//obj = document.getElementById("lnkClearComplete");
		//if (obj) obj.attachEvent("onclick", function() { mgr.ClearComplete(); });
	};
	
	//清除已完成文件
	this.ClearComplete = function()
	{
		for(var i = 0 ; i < this.CompleteList.length ; ++i)
		{
			this.Delete(this.CompleteList[i].FileID);
		}
		this.CompleteList.length = 0;
	};

	//上传队列是否已满
	this.IsPostQueueFull = function()
	{
		//目前只支持同时上传三个文件
		//注意：JSP服务器只支持1个文件上传
		if (this.UploadIdList.length > 0)
		{
			return true;
		}
		return false;
	};

	//添加一个上传ID
	this.AppendUploadId = function(fid)
	{
		this.UploadIdList.push(fid);
	};

	/*
	从当前上传ID列表中删除指定项。
	此函数将会重新构造一个Array
	*/
	this.RemoveUploadId = function(fid)
	{
		if (this.UploadIdList.length < 1) return;
		
		for (var i = 0, l = this.UploadIdList.length; i < l; ++i)
		{
			if (this.UploadIdList[i] == fid)
			{
				this.UploadIdList.remove(fid);
			}
		}
	};

	//停止所有上传项
	this.StopAll = function()
	{
		for (var i = 0, l = this.UploadIdList.length; i < l; ++i)
		{
			this.UploaderList[this.UploadIdList[i]].StopManual();
		}
		this.UploadIdList.length = 0;
	};

	/*
	添加到上传列表
	参数
	fid 上传项ID
	uploaderItem 新的上传对象
	*/
	this.AppenToUploaderList = function(fid, uploaderItem)
	{
		this.UploaderList[fid] = uploaderItem;
		this.UploaderListCount++;
	};

	/*
	添加到上传列表层
	1.添加到上传列表层
	2.添加分隔线
	参数：
	fid 上传项ID
	uploaderDiv 新的上传信息层
	返回值：
		新添加的分隔线
	*/
	this.AppendToUploaderListDiv = function(fid, uploaderDiv)
	{
		this.UploaderListDiv.appendChild(uploaderDiv);

		var split = "<div class=\"Line\" style=\"display:block;\" id=\"FilePostLine" + fid + "\"></div>";
		this.UploaderListDiv.insertAdjacentHTML("beforeEnd", split);
		var obj = document.getElementById("FilePostLine" + fid);
		return obj;
	};

	//传送当前队列的第一个文件
	this.PostFirst = function()
	{
		//上传列表不为空
		if (this.UnUploaderIdList.length > 0)
		{
			while (this.UnUploaderIdList.length > 0)
			{
				//上传队列已满
				if (this.IsPostQueueFull()) return;
				var index = this.UnUploaderIdList.shift();
				this.UploaderList[index].Post();
			}
		}
	};

	/*
	验证文件名是否存在
	参数:
	[0]:文件名称
	*/
	this.Exist = function()
	{
		var fn = arguments[0];

		for (a in this.UploaderList)
		{
			if (this.UploaderList[a].LocalFile == fn)
			{
				return true;
			}
		}
		return false;
	};

	/*
	根据ID删除上传任务
	参数:
	fid 上传项ID。唯一标识
	*/
	this.Delete = function(fid)
	{
		var obj = this.UploaderList[fid];
		if (null == obj) return;

		//删除div
		this.UploaderListDiv.removeChild(obj.div);
		//删除分隔线
		this.UploaderListDiv.removeChild(obj.spliter);
		obj.LocalFile = "";
		obj.Dispose();
	};

	/*
		设置文件过滤器
		参数：
			filter 文件类型字符串，使用逗号分隔(exe,jpg,gif)
	*/
	this.SetFileFilter = function(filter)
	{
		this.FileFilter.length = 0;
		this.FileFilter = filter.split(",");
	};

	/*
	判断文件类型是否需要过滤
	根据文件后缀名称来判断。
	*/
	this.NeedFilter = function(fname)
	{
		if (this.FileFilter.length == 0) return false;
		var exArr = fname.split(".");
		var len = exArr.length;
		if (len > 0)
		{
			for (var i = 0, l = this.FileFilter.length; i < l; ++i)
			{
				//忽略大小写
				if (this.FileFilter[i].toLowerCase() == exArr[len - 1].toLowerCase())
				{
					return true;
				}
			}
		}
		return false;
	};
	
	//打开文件选择对话框
	this.OpenFileDialog = function()
	{
		var obj = new ActiveXObject(this.ActiveX["Partition"]);
		obj.FileFilter = this.Config["FileFilter"];
		obj.AllowMultiSelect = this.Config["AllowMultiSelect"];
		if (!obj.ShowDialog()) return;

		var list = obj.GetSelectedFiles();
		if (list == null) return;
		if (list.lbound(1) == null) return;

		for (var index = list.lbound(1); index <= list.ubound(1); index++)
		{
			if (!this.Exist(list.getItem(index)))
			{
				this.AddFile(list.getItem(index));
			}
		}
		this.PostFirst();
	};
	
	//打开文件夹选择对话框
	this.OpenFolderDialog = function()
	{
		var obj = new ActiveXObject(this.ActiveX["Partition"]);
		if (!obj.ShowFolder()) return;

		var list = obj.GetSelectedFiles();
		if (list == null) return;
		if (list.lbound(1) == null) return;

		for (var index = list.lbound(1); index <= list.ubound(1); index++)
		{
			if (!this.Exist(list.getItem(index)))
			{
				this.AddFile(list.getItem(index));
			}
		}
		this.PostFirst();
	};
	
	//检查续传大小是否合法。必须为全数字
	this.IsNumber = function(num)
	{
		var reg = /\D/;
		return reg.test(num);
	};
	
	/*
		添加一个续传文件
		参数：
			filePath 本地文件路径(urlencode编码)。D:/Soft/QQ2010.exe
			postedLength 已上传字节。控件将从此位置开始续传数据
			postedPercent 已上传百分比。示例：20%
			md5 文件MD5值。32个字符
			sfid 与服务器对应的fid，必须唯一
	*/
	this.AddResumeFile = function(filePath, postedLength, postedPercent, md5, sfid)
	{
		//本地文件名称存在
		if (this.Exist(filePath)) return;

		var fileName = filePath.substr(filePath.lastIndexOf("/") + 1);
		var fid = this.UploaderListCount;
		this.UnUploaderIdList.push(fid);

		var upFile = new HttpUploader(fid, filePath, this);
		var newTable = this.UploaderTemplateDiv.cloneNode(true);
		newTable.style.display = "block";
		newTable.id = "item" + fid;

		var divLeft = newTable.children(0);
		var divRight = newTable.children(1);
		var objFileName = divLeft.children(0).children(0);
		objFileName.innerText = fileName;
		objFileName.title = fileName;
		var fileSize = divLeft.children(0).children(1);
		fileSize.innerText = upFile.FileSize;
		upFile.pProcess = divLeft.childNodes(1).children(0);
		upFile.pProcess.style.width = postedPercent;
		upFile.pMsg = divLeft.children(2);
		upFile.pMsg.innerText = "";
		upFile.pButton = divRight.children(0).children(0);
		upFile.pButton.fid = fid;
		upFile.pButton.domid = "item" + fid;
		upFile.pButton.lineid = "FilePostLine" + fid;
		upFile.pButton.attachEvent("onclick", BtnControlClick);
		upFile.pPercent = divRight.children(1);
		upFile.pPercent.innerText = postedPercent;
		upFile.Manager = this; 
		upFile.ATL.PostedLength = parseInt(postedLength); //设置续传位置
		upFile.ATL.MD5 = md5;
		upFile.MD5 = md5;
		upFile.fid = sfid;
		upFile.ResetFields(); //设置UID,FID等附加字段信息

		//添加到上传列表
		this.AppenToUploaderList(fid, upFile);
		//添加到上传列表层
		upFile.spliter = this.AppendToUploaderListDiv(fid, newTable);
		upFile.div = newTable;
		//upFile.Post(); //开始上传
		upFile.Ready(); //准备
	};
}

/*
添加一个文件到上传队列
参数:
fileName 包含完整路径的文件名称。D:/Soft/QQ.exe
*/
HttpUploaderMgr.prototype.AddFile = function(filePath)
{
	//本地文件名称存在
	if (this.Exist(filePath)) return;
	//此类型为过滤类型
	if (this.NeedFilter(filePath)) return;

	var fileName = filePath.substr(filePath.lastIndexOf("/") + 1);
	var fid = this.UploaderListCount;
	this.UnUploaderIdList.push(fid);

	var upFile = new HttpUploader(fid, filePath, this);
	var newTable = this.UploaderTemplateDiv.cloneNode(true);
	newTable.style.display = "block";
	newTable.id = "item" + fid;

	var divLeft = newTable.children(0);
	var divRight = newTable.children(1);
	var objFileName = divLeft.children(0).children(0);
	objFileName.innerText = fileName;
	objFileName.title = fileName;
	var fileSize = divLeft.children(0).children(1);
	fileSize.innerText = upFile.FileSize;
	upFile.pProcess = divLeft.childNodes(1).children(0);
	upFile.pMsg = divLeft.children(2);
	upFile.pMsg.innerText = "";
	upFile.pButton = divRight.children(0).children(0);
	upFile.pButton.fid = fid;
	upFile.pButton.domid = "item" + fid;
	upFile.pButton.lineid = "FilePostLine" + fid;
	upFile.pButton.attachEvent("onclick", BtnControlClick);
	upFile.pPercent = divRight.children(1);
	upFile.pPercent.innerText = "0%";
	upFile.Manager = this;

	//添加到上传列表
	this.AppenToUploaderList(fid, upFile);
	//添加到上传列表层
	upFile.spliter = this.AppendToUploaderListDiv(fid, newTable);
	upFile.div = newTable;
	//upFile.Post(); //开始上传
	upFile.Ready(); //准备
}

//单击控制按钮
function BtnControlClick()
{
	var obj = event.srcElement; //<a fid=""></a>
	var objup = HttpUploaderMgrInstance.UploaderList[obj.fid];

	switch (obj.innerText)
	{
		case "暂停":
		case "停止":
			objup.Stop(obj.fid);
			break;
		case "取消":
			{
				//var lister = HttpUploaderMgrInstance.UploaderListDiv;
				//lister.removeChild(objup.div);
				//lister.removeChild(objup.spliter);
				objup.Stop();
				HttpUploaderMgrInstance.Delete(objup.FileID);
			}
			break;
		case "续传":
			objup.Upload();
			break;
		case "重试":
			objup.Post();
			break;
	}
	return false;
}

var HttpUploaderErrorCode = {
	"0": "连接服务器错误"
	, "1": "发送数据错误"
	, "2": "接收数据错误"
	, "3": "未设置本地文件"
	, "4": "本地文件不存在"
	, "5": "打开本地文件错误"
	, "6": "不能读取本地文件"
	, "7": "公司未授权"
	, "8": "未设置IP"
	, "9": "域名未授权"
	, "10": "文件大小超过限制"//默认为2G
	//md5
	, "200": "无打打开文件"
	, "201": "文件大小为0"
};

var HttpUploaderState = {
	Ready: 0,
	Posting: 1,
	Stop: 2,
	Error: 3,
	GetNewID: 4,
	Complete: 5,
	WaitContinueUpload: 6,
	None: 7,
	Waiting: 8
};

//文件上传对象
function HttpUploader(fileID, filePath, mgr)
{
	//this.pMsg;
	//this.pProcess;
	//this.pPercent;
	//this.pButton
	//this.div
	//this.split
	//this.FileID
	this.Manager = mgr; //上传管理器指针
	this.FileLstMgr = mgr.FileLstMgr;//文件列表管理器
	this.Config = mgr.Config;
	this.Fields = mgr.Fields;
	this.ActiveX = mgr.ActiveX;
	this.State = HttpUploaderState.None;
	this.FileName = filePath.substr(filePath.lastIndexOf("/") + 1);
	//添加附加信息
	upload_totalNum +=1;
	var currentD = new Date();
	this.Fields.diretoryName=currentD.getYear()+""+(currentD.getMonth() + 1)+""+currentD.getDate()+""
	+currentD.getHours()+""+currentD.getMinutes()+""+currentD.getSeconds()+""+currentD.getMilliseconds();
	//upload_filename += this.Fields.diretoryName+","+this.FileName+";";
	
	this.MD5 = "";
	this.ATL = new ActiveXObject(this.ActiveX["Uploader"]);
	this.ATL.Object = this;
	this.ATL.PostUrl = this.Config["UrlPost"];
	this.ATL.EncodeType = this.Config["EncodeType"];
	this.ATL.OnPost = HttpUploader_Process;
	this.ATL.OnStateChanged = HttpUploader_StateChanged;
	this.ATL.LocalFile = filePath;
	this.ATL.PostedLength = "0"; //续传位置。
	this.ATL.FileSizeLimit = this.Config["FileSizeLimit"];
	this.ATL.CompanyLicensed = this.Config["CompanyLicensed"];
	this.ATL.FileID = fileID;
	this.LocalFile = filePath;
	this.FileID = fileID;
	this.FileSize = this.ATL.FileSize;//格式化后的文件大小 50MB
	this.FileLength = this.ATL.FileLength;//以字节为单位的字符串
	this.PathLocal = encodeURIComponent(filePath); //URL编码后的本地路径
	this.PathRelat = ""; //文件在服务器中的相对地址。示例：http://www.ncmem.con/upload/201204/03/QQ2012.exe
	this.fid = 0; //与服务器数据库对应的fid
	this.uid = this.Fields["uid"];
	
	
	//重置附加信息
	this.ResetFields = function()
	{
		//添加附加信息
		this.ATL.ClearFields(); //清空附加字段
		for (var field in this.Fields)
		{
			this.ATL.AddField(field, this.Fields[field]);
		}
		this.ATL.AddField("fid", this.fid);
		this.ATL.AddField("uid", this.uid);
		this.ATL.AddField("pathLocal",this.PathLocal);
	};
	
	//准备
	this.Ready = function()
	{
		//this.pButton.style.display = "none";
		this.pMsg.innerText = "正在上传队列中等待...";
		this.State = HttpUploaderState.Ready;
	};

	this.Post = function()
	{
		if (this.MD5.length > 0)
		{
			this.Upload();
		}
		else
		{
			this.CheckFile();
		}
	};
	
	//上传
	this.Upload = function()
	{
		this.pButton.style.display = "";
		this.pButton.innerText = "停止";
		//this.pMsg.innerText = "正在连接服务器....";
		this.State = HttpUploaderState.Posting;
		this.Manager.AppendUploadId(this.FileID);

		this.ATL.Post();
	};
	
	//检查文件
	this.CheckFile = function()
	{
		this.ATL.CheckFile();		
	};

	//启动下一个传输
	this.PostNext = function()
	{
		if (this.Manager.UnUploaderIdList.length > 0)
		{
			var index = this.Manager.UnUploaderIdList.shift();
			var obj = this.Manager.UploaderList[index];

			//空闲状态
			if (HttpUploaderState.Ready == obj.State)
			{
				obj.Post();
			}
		}
	};
	
	//手动停止，一般在StopAll中调用
	this.StopManual = function()
	{
		if (HttpUploaderState.Posting == this.State)
		{
			this.pButton.innerText = "续传";
			this.pMsg.innerText = "传输已停止....";
			this.ATL.Stop();
			this.State = HttpUploaderState.Stop;

			//从上传列表中删除
			this.Manager.RemoveUploadId(this.FileID);
			//添加到未上传列表
			this.Manager.UnUploaderIdList.push(this.FileID);
		}
	};
	
	//停止传输，一般在用户点击停止按钮时调用
	this.Stop = function()
	{
		this.pButton.innerText = "续传";
		this.pMsg.innerText = "传输已停止....";
		this.ATL.Stop();
		this.State = HttpUploaderState.Stop;

		//从上传列表中删除
		this.Manager.RemoveUploadId(this.FileID);
		//添加到未上传列表
		this.Manager.UnUploaderIdList.push(this.FileID);
		//传输下一个
		this.PostNext();
	};

	//释放内存
	this.Dispose = function()
	{
		delete this.ATL;
	};
	
	//快速上传完成，
	this.QuickComplete = function()
	{
		this.pButton.style.display = "none";
		this.pProcess.style.width = "100%";
		this.pPercent.innerText = "100%";
		this.pMsg.innerText = "服务器存在相同文件，快速上传成功。";
		this.Manager.CompleteList.push(this);
		this.State = HttpUploaderState.Complete;
		//从上传列表中删除
		this.Manager.RemoveUploadId(obj.FileID);
		this.Dispose();
		//添加到文件列表
		this.FileLstMgr.UploadComplete(this.fid, this);
		this.PostNext();
	};
}

//上传错误
function HttpUploader_Error(obj)
{
	obj.pMsg.innerText = HttpUploaderErrorCode[obj.ATL.ErrorCode];
	//文件大小超过限制
	if (10 == obj.ATL.ErrorCode)
	{
		obj.pButton.innerText = "取消";
	}
	else
	{
		obj.pButton.innerText = "续传";
	}
	obj.State = HttpUploaderState.Error;
	//从上传列表中删除
	obj.Manager.RemoveUploadId(obj.FileID);
	obj.PostNext();
}

//上传完成，向服务器传送信息
function HttpUploader_Complete(obj)
{
	obj.pButton.style.display = "none";
	obj.pProcess.style.width = "100%";
	obj.pPercent.innerText = "100%";
	obj.pMsg.innerText = "上传完成";
	obj.Manager.CompleteList.push(obj);
	obj.State = HttpUploaderState.Complete;
	//从上传列表中删除
	obj.Manager.RemoveUploadId(obj.FileID);
	obj.Dispose();

	$.ajax({
		type: "POST"
		, url: obj.Config["UrlComplete"]
		, data: { md5: obj.MD5, uid: obj.Fields["uid"], fid: obj.fid, time: Date() }
		, success:
		function(msg)
		{
			upload_filename += msg + ";";
			//添加到文件列表
			obj.FileLstMgr.UploadComplete(obj.fid, obj);
			obj.PostNext();
			upload_compNum +=1;
			if(upload_compNum==upload_totalNum){
				var returnValue = new Array(2);
			    returnValue[0] = upload_filename;//名称
			    window.returnValue = returnValue;
			    window.close();
			}
		}
        , error: function() { alert("向服务器发送Complete信息错误！"); }
	});
}

//传输进度。频率为每秒调用一次
function HttpUploader_Process(obj, speed, postedLength, percent, time)
{
	obj.pPercent.innerText = percent;
	obj.pProcess.style.width = percent;
	var str = "已上传:" + postedLength + " 速度:" + speed + "/S 剩余时间:" + time;
	obj.pMsg.innerText = str;

	$.ajax({
		type: "POST"
		, url: obj.Config["UrlProcess"]
		, data: { uid: obj.Config["uid"], fid: obj.fid, PostedLength: obj.ATL.PostedLength, Percent: percent, time: Date() }
		, success: function(msg) { }
        , error: function() { obj.pMsg.innerText = "向服务器发送更新文件上传进度信息错误"; }
	});
}

//服务器连接成功
function HttpUploader_Connected(obj)
{
	obj.pMsg.innerText = "服务器连接成功";
}

//MD5计算中
function HttpUploader_MD5_Working(obj)
{
	var msg = "正在扫描本地文件，已完成：" + obj.ATL.Md5Percent + "%";
	obj.pMsg.innerText = msg;
}

//MD5计算完毕
function HttpUploader_MD5_Complete(obj)
{
	var md5 = obj.ATL.MD5;
	obj.MD5 = md5;
	//在此处增加服务器验证代码。
	obj.pMsg.innerText = "MD5计算完毕，开始连接服务器...";

	$.ajax({
		type: "POST"
		, url: obj.Config["UrlCreate"]
		, data: { md5: obj.MD5, diretoryName:obj.Fields["diretoryName"], uid: obj.Fields["uid"], fileLength: obj.FileLength, fileSize: obj.FileSize, pathLocal: obj.PathLocal, time: Date() }
		, success:
		function(msg)
		{
			var json = eval(msg)
			json = json[0];
			obj.fid = json.fid;
			obj.ResetFields();
			//服务器已存在相同文件，且已上传完成
			if ("True" == json.PostComplete)
			{
				obj.QuickComplete();
			} //服务器文件没有上传完成
			else
			{
				obj.ATL.PostedLength = json.PostedLength;
				obj.pProcess.style.width = json.PostedPercent;
				obj.pPercent.innerText = json.PostedPercent;
				obj.Upload();
			}
		}
        , error: function() { alert("向服务器发送MD5信息错误！"); }

	});
}

/*
	HUS_Leisure			=0	//空闲
	,HUS_Uploading		=1	//上传中 
	,HUS_Stop  			=2	//停止 
	,HUS_UploadComplete	=3	//传输完毕 
	,HUS_Error 			=4	//错误 
	,HUS_Connected 		=5	//服务器已连接
	,HUS_Md5Working		=6	//MD5计算中
	,HUS_Md5Complete	=7	//MD5计算完毕
*/
function HttpUploader_StateChanged(obj,state)
{
	switch(state)
	{
		case 0:
			break;
		case 1:
			break;
		case 2:
			break;
		case 3:
			HttpUploader_Complete(obj);
			break;
		case 4:
			HttpUploader_Error(obj);
			break;
		case 5:
			HttpUploader_Connected(obj);
			break;
		case 6:
			HttpUploader_MD5_Working(obj);
			break;
		case 7:
			HttpUploader_MD5_Complete(obj);
			break;
	}
}