(function() {
	var ab = new AlertBox("idBox"), lock = false;
	//锁定键盘
	function lockup(e) {
		e.preventDefault();
	}
	//高亮层不锁定
	function lockout(e) {
		e.stopPropagation();
	}
	ab.onShow = function() {
		if (lock) {
			$$E.addEvent(document, "keydown", lockup);
			$$E.addEvent(this.box, "keydown", lockout);
			OverLay.show();
		}
	}
	ab.onClose = function() {
		$$E.removeEvent(document, "keydown", lockup);
		
		$$E.removeEvent(this.box, "keydown", lockout);
		OverLay.close();
	}
	$$("idBoxClose").onclick = function() {
		ab.close();
	}
	$$("idOverlay").onclick = function() {
		lock = true;
		ab.center = true;
		ab.fixed = true;
		ab.show();
	}
})()