package com.estore.service;

import java.util.List;

import com.estore.entities.Category;
import com.estore.entities.GoodsIn;
import com.landicorp.core.service.base.IBaseService;

public interface IGoodsInService extends IBaseService<GoodsIn, Integer> {
	
	public List<Category> getCategoryGoods();
}
