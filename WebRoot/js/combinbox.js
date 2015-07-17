/*
	组合框
	说明：需要配合JQuery使用
	更新记录：
		2012-4-2 创建
*/
function CombinBoxMgr()
{
	this.Config = {
		"EncodeType"		: "UTF-8"
		, "CompanyLicensed"	: "福建联迪商用设备有限公司"
		, "FileFilter"		: FileFilterType//文件类型。所有类型：*。自定义类型：jpg,bmp,png,gif,rar,zip,7z,doc
		, "FileSizeLimit"	: "0"//自定义允许上传的文件大小，以字节为单位。0表示不限制。
		, "AllowMultiSelect": selectMult//多选开关。1:开启多选。0:关闭多选
		, "AppPath"			: ""//网站虚拟目录名称。子文件夹 web
		, "CabPath"			: "http://lams.landicorp.com/js/HttpUploader.cab"
		, "UrlCreate"		: "http://lams.landicorp.com/db/ajax_create_fid.jsp"
		, "UrlPost"			: "http://lams.landicorp.com/db/ajax_post.jsp"
		, "UrlProcess"		: "http://lams.landicorp.com/db/ajax_process.jsp"
		, "UrlComplete"		: "http://lams.landicorp.com/db/ajax_complete.jsp"
		, "UrlList"			: "http://lams.landicorp.com/db/ajax_list.jsp"
		, "UrlDel"			: "http://lams.landicorp.com/db/ajax_del.jsp"
		, "ClsidPartition"	: "C8809901-40A5-4b1e-88F1-B7DD22A029DF"
		, "ClsidDroper"		: "BC0F2B14-792C-4d86-B264-C962E0B92FFB"
		, "ClsidUploader"	: "CDDFBDA4-6CA5-40c3-9B84-9E32FEE69035"
		,"uid"				: "0"
	};

	this.upMgr = new HttpUploaderMgr(); //文件上传管理器
	this.flMgr = new FileListerMgr(); //文件列表管理器
	this.upMgr.FileLstMgr = this.flMgr;
	this.upMgr.CombinBox = this;
	this.upMgr.Config = this.Config;
	this.flMgr.UploaderMgr = this.upMgr;
	this.flMgr.CombinBox = this;
	this.flMgr.Config = this.Config;
	
	//获取加载代码
	this.GetHtml = function()
	{
		var html = '<div class="combinBox">';
		html += '<ul id="cbHeader" class="cbHeader">';
		html += '<li id="liPnlUploader" class="hover">上传新文件</li>';
		html += '<li id="liPnlFiles" style="display:none">文件列表</li>';
		html += '</ul>';
		html += '<div class="cbBody" id="cbBody">';
		html += '<ul name="cbItem" class="block"><li id="liUploadPanel"></li></ul>';
		html += '<ul name="cbItem" class="cbItem"><li id="liListerPanel"></li></ul>';
		html += '</div>';
		html += '</div>';
		return html;
	};
	
	//加载到指定的控件中
	this.LoadInControl = function(ctlID)
	{
		var obj = document.getElementById(ctlID);
		obj.innerHTML = this.GetHtml();
	};
	
	//打开上传面板
	this.OpenPnlUpload = function()
	{
		$("#liPnlUploader").click();
	};
	//打开文件列表面板
	this.OpenPnlFiles = function()
	{
		$("#liPnlFiles").click();
	};
	
	//初始化
	this.Init = function()
	{
		this.upMgr.LoadInControl("liUploadPanel");
		this.upMgr.Init();
		this.flMgr.LoadInControl("liListerPanel");
		this.flMgr.Init();
		this.flMgr.LoadData();

		$("#cbHeader li").each(function(n)
		{
			if (this.className == "hover")
			{
				cbItemLast = this;
			}

			$(this).click(function()
			{
				$("ul[name='cbItem']").each(function(i)
				{
					this.style.display = i == n ? "block" : "none"; /*确定主部门显示哪一个对象*/
				});
				if (cbItemLast) cbItemLast.className = "";

				if (this.className == "hover")
				{
					this.className = "";
				}
				else
				{
					this.className = "hover";
				}
				cbItemLast = this;
			});
		});
	};
}