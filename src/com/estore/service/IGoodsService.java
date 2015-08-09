package com.estore.service;

import java.util.List;

import com.estore.entities.Category;
import com.estore.entities.Goods;
import com.landicorp.core.service.base.IBaseService;

public interface IGoodsService extends IBaseService<Goods, Integer> {
	public List<Category> getCategoryGoods();
	public List<Goods> getLocaleById(Integer goodsId,Integer localeType);
	public void addLocale(Goods goods);
}
