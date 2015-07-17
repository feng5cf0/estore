function isCheckboxSelected(formName){
   var elements = eval("document."+formName+".elements");
   var msg="";
   for (var i=0;i<elements.length;i++)
	{
        var checked = false;
        if (elements[i].type=="checkbox")
        {
        	checked |= elements[i].checked;
        	if (checked) {
        	     var showMsg="\n确定要删除记录吗？";
        	     if(msg!=''&&msg!=undefined){
        	       showMsg=msg+showMsg;
        	     }
        		 var flat = window.confirm(showMsg);
        		if(flat){
        			return true;
        		}else{
        			return false; 
        		}
        	}
        	
        }
	}
	alert("请先选择要删除的记录!");
	return false;
}
function selectCheckboxAll(formName,checkBox){
   var elements = eval("document."+formName+".elements");
   for (var i=0;i<elements.length;i++)
	{
        var checked = false;
        if (elements[i].type=="checkbox")
        {
        	elements[i].checked=checkBox.checked;        	
        }
	}
}