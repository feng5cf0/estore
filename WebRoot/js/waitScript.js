function Show(message) {
	//HideElement();
	//var eSrc = (document.all) ? window.event.srcElement : arguments[1];
	var alertFram = document.createElement("DIV");
	var height = "50px";
	alertFram.id = "alertFram";
	alertFram.style.position = "absolute";
	alertFram.style.width = "200px";
	alertFram.style.height = height;
	alertFram.style.left = "25%";
	//alertFram.style.top = document.body.clientHeight;
//	alertFram.style.marginLeft =  "25%";
	alertFram.style.marginTop = -75 + document.documentElement.scrollTop + "px";
	//	alertFram.style.background = "#fff";
	alertFram.style.textAlign = "center";
	//	alertFram.style.lineHeight = height;
	alertFram.style.zIndex = "10001";
	strHtml = " <div class=\"doing\"\">";
	//	strHtml += " <img src="imageswait.png"><br>";
	if (typeof (message) == "undefined") {
		strHtml += " ";
	} else {
		strHtml += "<div class=\"font24\">" + message + "</div>";
	}
	strHtml += " </div>";

	//	strHtml += "<iframe src="" style="position:absolute; visibility:inherit;top:0px; left:0px; width:300px; height:100px; z-index:-1; filter='progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0)';"></iframe>";
	alertFram.innerHTML = strHtml;
	var frame = window.parent.document.frames;
	for ( var i = 0; i < frame.length; i++) {
		var shield = document.createElement("DIV");
		shield.id = "shield";
		shield.style.zIndex = "1";
		shield.style.position = "absolute";
		shield.style.left = "-100";
		shield.style.top = "-100";
		//		shield.style.width = window.screen.availWidth;
		shield.style.width = "1200%";
		//		shield.style.height = ((document.documentElement.clientHeight > document.documentElement.scrollHeight) ? document.documentElement.clientHeight : document.documentElement.scrollHeight) + "px";
		//		shield.style.height = document.body.scrollHeight;
		//		shield.style.height = window.screen.availHeight;
		shield.style.height = "1000%";
		shield.style.background = "#33393C";
		shield.style.textAlign = "center";
		shield.style.zIndex = "10000";
		shield.style.filter = "alpha(opacity=80)";
		shield.style.opacity = "0.80";
		var body = frame[i].document.body;
		frame[i].document.body.style.overflow = "hidden";
		frame[i].document.body.appendChild(shield);
	}
	document.body.appendChild(alertFram);
	this.setOpacity = function(obj, opacity) {
		if (opacity >= 1) {
			opacity = opacity / 100;
		}
		try {
			obj.style.opacity = opacity;
		} catch (e) {
		}
		try {
			if (obj.filters.length > 0 && obj.filters("alpha")) {
				obj.filters("alpha").opacity = opacity * 100;
			} else {
				obj.style.filter = "alpha(opacity=\"" + (opacity * 100) + "\")";
			}
		} catch (e) {
			alert("error");
		}
	};
	var c = 0;
	this.doAlpha = function() {
		if (++c > 20) {
			clearInterval(ad);
			return 0;
		}
		setOpacity(shield, c);
	};
	var ad = setInterval("doAlpha()", 1);

	//eSrc.blur();
	document.body.onselectstart = function() {
		return false;
	};
	document.body.oncontextmenu = function() {
		return false;
	};
}
function HideElement() {
	var HideElementTemp = new Array("IMG", "SELECT", "OBJECT", "IFRAME");
	for ( var j = 0; j < HideElementTemp.length; j++) {
		try {
			var strElementTagName = HideElementTemp[j];
			for (i = 0; i < document.all.tags(strElementTagName).length; i++) {
				var objTemp = document.all.tags(strElementTagName)[i];
				if (!objTemp || !objTemp.offsetParent) {
					continue;
				}
				//objTemp.style.visibility="hidden";
				objTemp.disabled = "disabled";
			}
		} catch (e) {
		}
	}
}
function resumeElement() {
	var HideElementTemp = new Array("IMG", "SELECT", "OBJECT", "IFRAME");
	for ( var j = 0; j < HideElementTemp.length; j++) {
		try {
			var strElementTagName = HideElementTemp[j];
			for (i = 0; i < document.all.tags(strElementTagName).length; i++) {
				var objTemp = document.all.tags(strElementTagName)[i];
				if (!objTemp || !objTemp.offsetParent) {
					continue;
				}
				//objTemp.style.visibility="hidden";
				objTemp.disabled = "enable";
			}
		} catch (e) {
		}
	}
}
function Close() {
	var frame = window.parent.document.frames;
	try {
		for ( var i = 0; i < frame.length; i++) {
			var shield = document.createElement("DIV");
			frame[i].document.body.style.overflow = "auto";
			frame[i].document.body.removeChild(frame[i].document
					.getElementById("shield"));
		}
	} catch (error) {

	}
	var shield = $Customer("shield");
	var alertFram = $Customer("alertFram");
	if (shield != null) {
		document.body.removeChild(shield);
	}
	if (alertFram != null) {
		document.body.removeChild(alertFram);
	}
	document.body.onselectstart = function() {
		return true;
	};
	document.body.oncontextmenu = function() {
		return true;
	};
	//	resumeElement();
}
function $Customer() {
	var elements = new Array();
	for ( var i = 0; i < arguments.length; i++) {
		var element = arguments[i];
		if (typeof element == "string") {
			element = document.getElementById(element);
		}
		if (arguments.length == 1) {
			return element;
		}
		elements.push(element);
	}
	return elements;
}
