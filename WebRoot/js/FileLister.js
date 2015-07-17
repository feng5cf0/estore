/*
	文件列表控件
	参数：
		htmlID 存放文件列表控件的父控件ID
	更新记录：
		2012-4-1 创建
*/
var FileListerMgrInstance = null;
function FileListerMgr()
{
	FileListerMgrInstance = this;
	this.CombinBox = null;
	this.UploaderMgr = null; //文件上传管理器
	this.FileLister = null; //文件列表容器
	this.FileItemTemp = null;//文件项模板
	this.FileItemCtls = new Array();//文件列表项集合
	this.uid = 0;
	this.FileItems = new Array(); //文件项集合
	
	this.$ = function(id) { return document.getElementById(id); };

	this.GetHtml = function()
	{
		var html = '<div id="divFileLister" class="FileListerBox">';
		html += '<ul class="ulFileHead">';
		html += '<li class="hcb"><input type="checkbox" /></li>';
		html += '<li class="hname">文件名称</li>';
		html += '<li class="hsize">大小</li>';
		html += '<li class="hper">进度</li>';
		html += '<li class="hop">操作</li>';
		html += '</ul>';
		html += '<div id="FileItems" class="FileItems">';
		html += '</div>';
		html += '</div>';
		//temp
		html += '<div class="divHidden"><ul id="FileItemTemp">';
		html += '<li class="fcb"><input type="checkbox" /></li>';
		html += '<li class="fname">文件名称</li>';
		html += '<li class="fsize">大小</li>';
		html += '<li class="fper">进度</li>';
		html += '<li class="fop">操作</li>';
		html += '</ul></div>';
		return html;
	};

	//加载控件
	this.Load = function()
	{
		document.write(this.GetHtml());
	};

	//加载到指定控件
	this.LoadInControl = function(ctlID)
	{
		var obj = document.getElementById(ctlID);
		obj.innerHTML = this.GetHtml();
	};
	
	//初始化
	this.Init = function()
	{
		this.FileLister = this.$("FileItems");
		this.FileItemTemp = this.$("FileItemTemp");
	};

	//从服务器加载数据
	this.LoadData = function()
	{
		var ref = this;
		$.ajax({
			type: "GET"
			, url: this.Config["UrlList"]
			, data: { uid: this.uid,time:Date()}
		, success:
		function(msg)
		{
			var json = eval(msg);
			$.each(json, function(idx, item)
			{
				ref.AddItem( item);
			});
		}
        , error: function() { alert("加载文件列表错误！"); }

		});
	};
	
	//添加一项元素
	this.AddItem = function(item)
	{
		this.FileItems[item.fid] = item;
		var ctl = this.FileItemTemp.cloneNode(true);
		ctl.children(1).innerText = item.FileNameLocal;
		ctl.children(1).title = ctl.children(1).innerText;
		ctl.children(2).innerText = item.FileSize;
		ctl.children(3).innerText = item.PostedPercent;
		
		if ("True" == item.PostComplete)
		{
			ctl.children(4).innerHTML = '<span fid="' + item.fid + '" onclick="FileItemRemove(' + item.fid + ');">删除</span>';
		}
		else
		{
			ctl.children(4).innerHTML = '<span fid="' + item.fid + '" onclick="FileItemResumer(' + item.fid + ')">续传</span>|<span onclick="FileItemRemove(' + item.fid + ');">删除</span>';
		}
		//添加到文件列表项集合
		this.FileItemCtls[item.fid] = ctl;
		this.FileLister.appendChild(ctl);
	};

	//添加一个新项
	this.AddItemHttpUploader = function(obj)
	{
		var item = {
			fid: obj.fid
			, uid: obj.uid
			, FileNameLocal: obj.FileName
			, FileNameRemote: ""
			, FilePathLocal: obj.PathLocal
			, FilePathRemote: ""
			, FilePathRelat: obj.PathRelat
			, FileMD5: obj.MD5
			, FileLength: obj.FileLength
			, FileSize: obj.FileSize
			, FilePos: ""
			, PostedLength: obj.FileLength
			, PostedPercent: "100%"
			, PostComplete: "True"
			, PostedTime: ""
			, IsDeleted: "False"
		};
		this.AddItem(item);
	};

	//上传完成，将操作改为删除。
	this.UploadComplete = function(fid, refHttpUploader)
	{
		//文件已存在
		if (typeof (this.FileItems[fid]) != "undefined")
		{
			this.FileItemCtls[fid].children(3).innerText = "100%";
			this.FileItemCtls[fid].children(4).innerHTML = '<span fid="' + fid + '" onclick="FileItemRemove(' + fid + ');">删除</span>';
		}
		else
		{
			this.AddItemHttpUploader(refHttpUploader);
		}
	};

	//续传文件
	this.ResumerFile = function(fid)
	{
		var item = this.FileItems[fid];
		var path = decodeURIComponent(item.FilePathLocal);
		this.UploaderMgr.AddResumeFile(path, item.PostedLength, item.PostedPercent, item.FileMD5, item.fid);
		this.CombinBox.OpenPnlUpload(); //打开上传面板
		this.UploaderMgr.PostFirst();
	};
	
	//删除文件
	this.RemoveFile = function(fid)
	{
		var ref = this;
		var item = this.FileItems[fid];
		var ctl = this.FileItemCtls[fid];

		$.ajax({
			type: "GET"
			, url: this.Config["UrlDel"]
			, data: { uid: item.uid, fid: fid,time:Date()}
		, success:
		function(msg)
		{
			//删除成功
			if (parseInt(msg) == 1)
			{
				//删除HTML控件
				ref.FileLister.removeChild(ctl);
			}
		}
        , error: function() { alert("发送删除文件信息失败！"); }

		});
	};
}

//删除文件
function FileItemRemove(fid)
{
	FileListerMgrInstance.RemoveFile(fid);
}

//续传文件
function FileItemResumer(fid)
{
	FileListerMgrInstance.ResumerFile(fid);
}