
/**
 * 树实现脚本
 * 作者:陈知
 * 2007-07-26
 * 依赖文件：init.js
 **/
var expandStatus = "out";
var foldStatus = "in";
//加号图标
var inImageSrc = "/" + contextPath + "/images/in.jpg";
var inImageTitle = "\u70b9\u51fb\u56fe\u6807\u5c55\u5f00\u6811";
var inImageId = "inImage";
var inImage = "<img src='" + inImageSrc + "' title='" + inImageTitle + "' id='" + inImageId + "'/>";
//减号图标
var outImageSrc = "/" + contextPath + "/images/out.jpg";
var outImageTitle = "\u70b9\u51fb\u56fe\u6807\u6298\u53e0\u6811";
var outImageId = "inImageId";
var outImage = "<img src='" + outImageSrc + "' title='" + outImageTitle + "' id='" + outImageId + "'/>";
//折线T图标
var breakLineTImage = "<img src='/" + contextPath + "/images/T.gif'/>";
//折线图标
var LImageSrc = "/" + contextPath + "/images/L.gif";
var LImage = "<img src='/" + contextPath + "/images/L.gif'/>";
//竖线图标
var vertica = "<img src='/" + contextPath + "/images/I.gif'/>";
var isLastTree = false;
var isLastNode = false;
var isRootNode = false;
var container = null;//付值容器
var hiddenContainer = null;//id付值容器
var multiple = false;//是否多选
var divisionMark = ",";//分割符号，多选时有效
var tip = "(\u52a0\u8f7d\u6570\u636e\u4e2d...)";
/**
* 显示对象
* 参数说明：obj：树的根节点html对象，url:数据源，container：容器对象，hiddenContainer:付值节点ID
* 存放选择树节点value的值，multiple：是否多选，divisionMark，分割符号，默认为逗号
**/
function showTree(obj, url, container, hiddenContainer, multiple, divisionMark) {
	this.container = container;
	this.multiple = multiple;
	this.hiddenContainer = hiddenContainer;
	if (divisionMark !== undefined) {
		this.divisionMark = divisionMark;
	}
	getTree(obj, url, 0);
}
/**
* 获取树
**/
function getTree(obj, url, level) {
	if (document.getElementById("tip") != null) {
		alert("\u52a0\u8f7d\u6570\u636e\u4e2d,!\u8bf7\u5728\u6570\u636e\u52a0\u8f7d\u5b8c\u6210\u540e\u518d\u64cd\u4f5c!");
		return;
	}
	tipElement = document.createElement("font");
	tipElement.setAttribute("id", "tip");
	tipElement.innerHTML = tip;
	obj.appendChild(tipElement);
	var childNodes = obj.childNodes;
	
    //判断树的状态.折叠还是展开
	var display = "none";
	if (obj.status == foldStatus) {//折叠状态
		display = "block";
		obj.status = expandStatus;
		obj.childNodes[level].src = outImageSrc;
		obj.childNodes[level].title = outImageTitle;
	} else {//展开状态
		display = "none";
		obj.status = foldStatus;
		childNodes[level].src = inImageSrc;
		childNodes[level].title = inImageTitle;
	}
	//节点树
	if (url === undefined || url === "null" || url === null) {
		for (var j = 0; j < childNodes.length; j += 1) {
			var childNode = childNodes[j];
			if (childNode.tagName !== undefined) {
				if (childNode.tagName == "UL") {//有子节点
					childNode.style.display = display;
				}
			}
		}
		obj.removeChild(tipElement);
		return;
	} else {
		deleteChildNode(obj, level);
	}
	//折叠状态时返回
	if (obj.status == foldStatus) {
		obj.removeChild(tipElement);
		return;
	}	
	//防止浏览器不发送请求	
	url += "#" + Math.random();
    //获取树信息
	dojo.io.bind({url:url, load:function (type, data, evt) {
		if (type == "error") {
			alert(_errorMessage);
		} else {
			var xmlDoc = dojo.dom.createDocumentFromText(data);
			//异步调用		  
			xmlDoc.async = true;
			isRootNode = false;
		  //解析树
			var treeElement = xmlDoc.getElementsByTagName("body")[0].childNodes;
			isLastTree = false;
			for (var i = 0; i < treeElement.length; i = i + 1) {
				if (i == (treeElement.length - 1)) {
					isLastTree = true;
				}
				isRootNode = true;
				createTree(obj, treeElement[i], level);
			}
			var objChk = document.getElementById("cb" + obj.id);
			if (objChk != null) {
				doNextCheckBox(obj, objChk);
			}
			obj.removeChild(tipElement);
		}
	}});
}
/**
* 生成树
* 算法:递归
**/
function createTree(obj, treeElement, level) {
	var childNodes = treeElement.childNodes;
	var ulElement = document.createElement("ul");
	obj.appendChild(ulElement);
	var liElement = document.createElement("li");
	var nodeId = treeElement.getAttribute("id");
	liElement.setAttribute("id", nodeId);
	liElement.setAttribute("status", foldStatus);
	liElement.setAttribute("parent", obj.id);
	liElement.setAttribute("level", level + 1);
	//根节点显示
	if (isRootNode) {
		ulElement.style.display = "block";
		isRootNode = false;
	} else {
		ulElement.style.display = "none";
	}
	var verticalLevel = "";
	var statusImage = document.createElement("img");
	var childurl = treeElement.getAttribute("childurl");
    
	//设置展开与折叠的事件
	if (childNodes.length > 0 || childurl !== null) {
		statusImage.setAttribute("src", inImageSrc);
		statusImage.setAttribute("title", inImageTitle);
		statusImage.setAttribute("id", inImageId);
		statusImage.onclick = function () {
			eval("getTree(document.getElementById('" + nodeId + "'), '" + childurl + "', " + (level + 1) + ");");
		};
	} else {
		statusImage.setAttribute("src", outImageSrc);
		statusImage.setAttribute("title", outImageTitle);
		statusImage.setAttribute("id", outImageId);
	}
	
	//树层次轨迹显示
	for (var j = 0; j < level; j = j + 1) {
		if (isLastTree && isLastNode) {
			verticalLevel += LImage;
		} else {
			verticalLevel += vertica;
		}
	}
	liElement.innerHTML = verticalLevel + LImage;
	liElement.appendChild(statusImage);
	var spanElement = document.createElement("span");
	spanElement.innerHTML = "&nbsp;";
	liElement.appendChild(spanElement);
	var url = treeElement.getAttribute("url");
	var input = treeElement.getAttribute("input");
	if (input !== null) {//多选框
		if (input.toLowerCase() == "checkbox") {
			var checkboxElement = document.createElement("INPUT");
			checkboxElement.setAttribute("type", "checkbox");
			checkboxElement.setAttribute("id", ("cb" + nodeId));
			checkboxElement.setAttribute("value", nodeId);
			checkboxElement.onclick = function () {
				doCheckBox();
			};
			liElement.appendChild(checkboxElement);
		}
		if (input.toLowerCase() == "radio") {//单选框
			var groupName = treeElement.getAttribute("groupName");
			if (groupName !== null) {
				var radioElement = document.createElement("INPUT");
				radioElement.setAttribute("type", "radio");
				radioElement.setAttribute("id", ("ra" + nodeId));
				radioElement.setAttribute("value", nodeId);
				radioElement.setAttribute("name", groupName);
			}
		}
	}
	var nodeName = treeElement.getAttribute("name");
	//叶子节点时可选
	var isSelected = treeElement.getAttribute("isSelected");
	var fontElement = document.createElement("font");
	fontElement.innerHTML = nodeName;
	if (isSelected !== null) {
		if (isSelected == "1") {
			fontElement.onclick = function () {
				eval("nodeClick('" + nodeName + "','" + nodeId + "')");
			};
		}
	}
	//超链接
	if (url == null) {
		liElement.appendChild(fontElement);
	} else {
		var aElement = document.createElement("a");
		var target = treeElement.getAttribute("target");
		//http的target属性
		if (target === null) {
			aElement.target = "_blank";
		} else {
			aElement.target = target;
		}
		aElement.innerHTML = nodeName;
		aElement.href = url;
		liElement.appendChild(aElement);
	}//end-超链接
	//title
	var title = treeElement.getAttribute("title");
	if (title !== null) {
		liElement.title = treeElement.getAttribute("title");
	}
	var value = treeElement.getAttribute("value");
	//value
	if (value !== null) {
		liElement.setAttribute("text", value);
	}
	ulElement.appendChild(liElement);
	if (childNodes.length > 0) {//有子节点时		
		isLastNode = false;
		for (var i = 0; i < childNodes.length; i = i + 1) {
		    //最后一个节点时
			if (i == (childNodes.length - 1)) {
				isLastNode = true;
			}
			createTree(liElement, childNodes[i], level + 1);
		}
	} else {
		liElement.onclick = null;
	}
	isLastNode = false;
}
/**
* checkbox
* 参数:节点对象
**/
var parent = null;
function doCheckBox() {
	if (document.getElementById("tip") != null) {
		alert("\u52a0\u8f7d\u6570\u636e\u4e2d,!\u8bf7\u5728\u6570\u636e\u52a0\u8f7d\u5b8c\u6210\u540e\u518d\u64cd\u4f5c!");
		return;
	}
	var ckbox = event.srcElement;
	//向下扫描checkbox节点
	doNextCheckBox(ckbox.parentElement, ckbox);
	//检测该树是否的checkbox是否checked
	isChildChecked = ckbox.checked;
	//parent = document.getElementById(ckbox.value).parent;
	//var obj = document.getElementById(parent);
	isChildChecked = ckbox.checked;
	//向上扫描checkbox节点
	doPreCheckBox(ckbox.parentNode, ckbox);
}
/**
* 向下扫描checkbox
* 参数:节点对象
**/
function doNextCheckBox(obj, ckbox) {
  //判断是否是checkBox控件
	if (obj.tagName !== undefined) {
		if (obj.tagName == "INPUT") {
			if (obj.type == "checkbox") {
				obj.checked = ckbox.checked;
			}
		}
	}
	
	//是否有子节点
	if (obj.childNodes !== null) {
		for (var i = 0; i < obj.childNodes.length; i += 1) {
			if (obj.childNodes[i].tagName !== undefined) {
				doNextCheckBox(obj.childNodes[i], ckbox);
			}
		}
	}
}
/**
* 向上扫描checkbox
* 参数:节点对象
**/
function doPreCheckBox(obj, ckbox) {
	if (obj === null || obj === undefined) {
		return;
	}
	if (obj.parentNode !== null) {
		var ul = obj.parentElement;
		//扫描当前子树
		isChildCheck(ul);
		if (ul.parentNode !== null) {
			var li = ul.parentNode;
			var level = li.level;
			if (level === undefined) {
				return;
			}			
			//
			if (li.childNodes[level + 2] !== undefined) {
				if (li.childNodes[level + 2].tagName == "INPUT") {
					li.childNodes[level + 2].checked = isChildChecked;
				}
			}
			//扫描上一级的所有子树
			isChildCheck(li);
			if (li.childNodes[level + 2] !== undefined) {
				if (li.childNodes[level + 2].tagName == "INPUT") {
					li.childNodes[level + 2].checked = isChildChecked;
				}
			}
			doPreCheckBox(li, ckbox);
		}
	}
}
/**
* 向下扫描checkbox
* 参数:节点对象
**/
function isChildCheck(obj) {
	if (document.getElementById("tip") != null) {
		alert("\u52a0\u8f7d\u6570\u636e\u4e2d,!\u8bf7\u5728\u6570\u636e\u52a0\u8f7d\u5b8c\u6210\u540e\u518d\u64cd\u4f5c!");
		return;
	}
	if (obj === null) {
		isChildChecked = false;
		return;
	}
	var childNodes = obj.childNodes;
	if (childNodes === null) {
		return;
	}
	for (var j = 0; j < childNodes.length; j += 1) {
		if (childNodes[j].tagName !== undefined) {
			if (childNodes[j].tagName.toLowerCase() == "input") {
				if (childNodes[j].type == "checkbox") {
					if (childNodes[j].value != parent) {
						isChildChecked = isChildChecked || childNodes[j].checked;
					}
				}
			}
		}
		if (childNodes[j].childNodes !== null) {
			isChildCheck(childNodes[j]);
		}
	}
}
/**
* 节点点击事情
* 参数:值,id
**/
function nodeClick(value, id) {
	if (document.getElementById("tip") != null) {
		alert("\u52a0\u8f7d\u6570\u636e\u4e2d,!\u8bf7\u5728\u6570\u636e\u52a0\u8f7d\u5b8c\u6210\u540e\u518d\u64cd\u4f5c!");
		return;
	}
	if (document.getElementById("tip") != null) {
		alert("\u52a0\u8f7d\u6570\u636e\u4e2d,!\u8bf7\u5728\u6570\u636e\u52a0\u8f7d\u5b8c\u6210\u540e\u518d\u64cd\u4f5c!");
		return;
	}
	if (container === null && hiddenContainer === null) {
		return;
	}
	if (multiple) {//多选时
		var isSelected = false;
		if (hiddenContainer !== null) {
			if (hiddenContainer.value.length > 0) {
			    //若节点已经选择则不操作
				if (hiddenContainer.value.split(id).length == 1) {
					hiddenContainer.value += divisionMark + id;
					isSelected = true;
				}
			} else {
				hiddenContainer.value = id;
			}
		}
		if (container !== null) {
			if (container.value.length > 0) {
			    //若节点已经选择则不操作
				if (isSelected === true) {
					container.value += divisionMark + value;
				}
			} else {
				container.value = value;
			}
		}
	} else {//单选时
		if (container !== null) {
			container.value = value;
		}
		if (hiddenContainer !== null) {
			hiddenContainer.value = id;
		}
	}
}
/**
* 删除节点的所有子节点
* 参数:值,id
**/
function deleteChildNode(node, level) {
	var childNodes = node.childNodes;
	for (var i = childNodes.length - 1; i >= 0; i -= 1) {
		var childNode = childNodes[i];
		if (childNode != undefined) {
			if (childNode.tagName == "UL") {
				node.removeChild(childNode);
			}
		}
	}
}

