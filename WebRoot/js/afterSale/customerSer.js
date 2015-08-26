function toAdd(){
	window.location.href="front/customerSerAction!toAdd";
}

function toUpdatePage(id){
	window.location.href="front/customerSerAction!toUpdate?id="+id;
}
//详情
function detailCustomerSer(id){
	window.location.href="front/customerSerAction!detail?id="+id;
}
$(function(){
//添加客服
	$("#btnSave").click(function(){
		
		$.ajax({
			type:"post",
			dataType:"json",
			url:"front/customerSerAction!addCustomerSer",
			data:$("#addForm").serialize(),
			ansyc:false,
			success:function(data){
				if(data.msg=="success"){
					alert("添加成功");
					window.location.href="front/customerSerAction!getCustomerSerAll";
				}else{
					alert("添加失败");
				}
			},
			error:function(request){
				alert("系统异常，请联系管理员");
			}
		});
	});
		
	
});
//删除
function deleteCustomerSer(id){
	$.ajax({
		type:"post",
		dataType:"json",
		url:"front/customerSerAction!deleteCusSer",
		data:{
			id:id
		},
		ansyc:false,
		success:function(data){
			if(data.msg=="success"){
				alert("删除成功");
				window.location.href="front/customerSerAction!getCustomerSerAll";
			}else{
				alert("删除失败");
			}
		},
		error:function(request){
			alert("系统异常，请联系管理员");
		}
	});
}
//修改更新
function updateCustomerSer(){
	
		$.ajax({
			type:"post",
			dataType:"json",
			url:"front/customerSerAction!updateCustomerSer",
			data:$("#updateForm").serialize(),
			ansyc:false,
			success:function(data){
				if(data.msg=="success"){
					alert("修改成功");
					window.location.href="front/customerSerAction!getCustomerSerAll";
				}else{
					alert("修改失败");
				}
			},
			error:function(request){
				alert("系统异常，请联系管理员");
			}
		});
	
}

