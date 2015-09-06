package com.estore.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.estore.entities.Goods;
import com.landicorp.core.dao.base.IMyBatisDao;

public interface IGoodsDao extends IMyBatisDao<Goods, Integer> {
	public List<Goods> getAll(Map<String,Object> map);
	public Integer getAllCount(Goods goods);
	public List<Goods> getByCategory(Integer categoryId);
	public List<Goods> getAllGoods();
	public List<Goods> getLocaleById(Map<String,Object> map);
	public void saveLocale(Goods goods);
	public List<Goods> getForTree();
	public List<Goods> getByCategoryId(Map<String, Object> map);
	
	public List<Goods> getByGoodsCode(Map<String,Object> map);
	
	public Goods getDetailForFront(Integer goodsId);
	public List<Goods> getByBrandId(@Param(value="brandId")Integer brandId);
	public List<Goods> getByCondition(Map<String,Object> map);
	public List<Goods> getRecommend();
	public List<Goods> getNewGoods();
	public List<Goods> getOnsaleGoods();
}
