package com.estore.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.estore.dao.ICategoryDao;
import com.estore.dao.IGoodsDao;
import com.estore.dao.IGoodsInDao;
import com.estore.entities.Category;
import com.estore.entities.Goods;
import com.estore.entities.GoodsIn;
import com.estore.service.IGoodsInService;
import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;
import com.landicorp.core.web.pager.Pager;

public class GoodsInServiceImpl extends AbstractBaseServiceImpl<GoodsIn, Integer>
		implements IGoodsInService {

	private IGoodsInDao goodsInDao;
	private ICategoryDao categoryDao;
	private IGoodsDao goodsDao;
	
	@Override
	public IMyBatisDao<GoodsIn, Integer> getMyBatisDao() {
		// TODO Auto-generated method stub
		return goodsInDao;
	}

	@Override
	public List<Category> getCategoryGoods() {
		
		List<Category> categoryGoodsList = new ArrayList<Category>();
		List<Goods> goodsList = new ArrayList<Goods>();
		
		categoryGoodsList = this.categoryDao.getForTree();
		goodsList = this.goodsDao.getAllGoods();
		
		Category category = new Category();
		
		for(Goods goods : goodsList){
			category.setId(0-goods.getId());
			category.setCategoryName(goods.getGoodsName());
			category.setIsLeaf(1);
			category.setParentCategory(goods.getCategoryId());
			
			categoryGoodsList.add(category);
		}
		
		return categoryGoodsList;
	}

	@Override
	public List<GoodsIn> getAll(GoodsIn goodsIn, Pager pager) {
		Map<String,Object> map = new HashMap<String,Object>();
		
		if(pager != null){
			pager.setTotalCount(this.goodsInDao.getAllCount(goodsIn));
		}
		
		map.put("goodsIn", goodsIn);
		map.put("pager", pager);
		
		return this.goodsInDao.getAll(map);
	}

	public IGoodsInDao getGoodsInDao() {
		return goodsInDao;
	}
	public void setGoodsInDao(IGoodsInDao goodsInDao) {
		this.goodsInDao = goodsInDao;
	}
	public ICategoryDao getCategoryDao() {
		return categoryDao;
	}
	public void setCategoryDao(ICategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}
	public IGoodsDao getGoodsDao() {
		return goodsDao;
	}
	public void setGoodsDao(IGoodsDao goodsDao) {
		this.goodsDao = goodsDao;
	}

}
