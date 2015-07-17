// JavaScript Document
function showtable(tableid) {
	whichdiv = eval("div" + tableid);
	whichClass = eval("divC" + tableid);
	if (whichdiv.style.display == "none") {
		eval("div" + tableid + ".style.display=\"\";");
		eval("divC" + tableid + ".className=\"menutitler menutitlerUP\";");
	} else {
		eval("div" + tableid + ".style.display=\"none\";");
		eval("divC" + tableid + ".className=\"menutitler menutitlerdown\";");
	}
}
function hideLeft() {
	var img = document.getElementById("hideImg");
	if (window.top.left.cols == "1,10,*") {
		window.top.left.cols = "180,10,*";
		img.src = "css/images/left.gif";
	} else {
		window.top.left.cols = "1,10,*";
		img.src = "css/images/right.gif";
	}
}
