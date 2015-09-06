package com.estore.service;

import java.util.List;

import com.estore.entities.Goods;
import com.estore.entities.Onsale;
import com.landicorp.core.service.base.IBaseService;

public interface IOnsaleService extends IBaseService<Onsale, Integer> {
	
	public List<Goods> getOnsaleGoods();
	

}
