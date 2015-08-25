package com.estore.service;

import java.util.List;
import java.util.Map;

import com.estore.entities.Attribute;
import com.estore.entities.Category;
import com.estore.entities.Goods;
import com.landicorp.core.service.base.IBaseService;

public interface IGoodsService extends IBaseService<Goods, Integer> {
	public List<Category> getCategoryGoods();
	public List<Goods> getLocaleById(Integer goodsId,Integer localeType);
	public void addLocale(Goods goods);
	
	/**
	 * 前台根据类别搜索商品
	 * @param categoryId
	 * @param localeType
	 * @return
	 */
	public List<Goods> getByCategoryId(Integer categoryId,Integer localeType);
	
	public Goods getByGoodsId(Integer goodsId,Integer localeType);
	public List<Goods> getByGoodsCode(String goodsCode);
	
	public Goods getDetailForFront(Integer goodsId);
	
	public List<Attribute> getGoodsAttribute(Integer goodsId);
	
	public List<Goods> getByBrandId(Integer brandId);
	public List<Goods> getByCondition(Map<String,Object> map);
	public List<Goods> getRecommend();
}
