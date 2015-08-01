package com.estore.action.back;

import com.landicorp.core.action.BaseActionSupport;

public class GoodsAction extends BaseActionSupport {

	public String addGoods(){
		return "addGoods";
	}

	public String loadAll(){
		return "loadAllGoods";
	}
	
	public String loadByCategory(){
		return "loadByCategory";
	}
}
