package com.estore.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import com.estore.dao.IAttributeDao;
import com.estore.dao.ICategoryDao;
import com.estore.dao.IGoodsAttributeDao;
import com.estore.dao.IGoodsDao;
import com.estore.entities.Attribute;
import com.estore.entities.AttributeValue;
import com.estore.entities.Category;
import com.estore.entities.Goods;
import com.estore.entities.GoodsAttribute;
import com.estore.service.IGoodsService;
import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;
import com.landicorp.core.web.pager.Pager;

public class GoodsServiceImpl extends AbstractBaseServiceImpl<Goods, Integer> implements
		IGoodsService {

	private IGoodsDao goodsDao;
	private ICategoryDao categoryDao;
	private IGoodsAttributeDao goodsAttributeDao;
	private IAttributeDao attributeDao;
	@Override
	public IMyBatisDao<Goods, Integer> getMyBatisDao() {
		
		return goodsDao;
	}

	@Override
	public List<Goods> getAll(Goods goods, Pager pager) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		if(pager != null){
			pager.setTotalCount(this.goodsDao.getAllCount(goods));
		}
		
		map.put("pager", pager);
		map.put("goods", goods);
		
		return this.goodsDao.getAll(map);
	}

	//获取商品树
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
	public List<Goods> getLocaleById(Integer goodsId,Integer localeType) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("goodsId", goodsId);
		map.put("localeType", localeType);
		
		return this.goodsDao.getLocaleById(map);
	}
	
	@Override
	public void addLocale(Goods goods) {
		this.goodsDao.saveLocale(goods);
	}

	@Override
	public List<Goods> getByCategoryId(Integer categoryId, Integer localeType) {

		Map<String,Object> map = new HashMap<String,Object>();
		//List<Goods> goodsList = new ArrayList<Goods>();
//		List<Category> categoryList = new ArrayList<Category>();
//		
//		//获取所有子类别
//		map.put("categoryId", categoryId);
//		map.put("localeType", localeType);
//		categoryList = this.categoryDao.getByParentId(map);
//		List<Category> tempList = categoryList;
//		for(Category category : tempList){
//			map.put("categoryId",category.getId());
//			
//			for(Category a:this.categoryDao.getByParentId(map)){
//				categoryList.add(a);
//			}
//		}
//		categoryList.add(this.categoryDao.getByCategoryId(map)
		
		
		map.put("categoryId", categoryId);
		map.put("localeType", localeType);
		
		
		return this.goodsDao.getByCategoryId(map);
	}

	@Override
	public Goods getByGoodsId(Integer goodsId, Integer localeType) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("goodsId", goodsId);
		map.put("localeType", localeType);
		
		List<Goods> goodsList = this.goodsDao.getLocaleById(map);
		
		Goods goods = null;
		
		if(goodsList.size() >0){
			goods = goodsList.get(0);
		}
		
		return goods;
	}
	
	@Override
	public List<Goods> getByGoodsCode(String goodsCode) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("goodsCode", goodsCode);
		
		return this.goodsDao.getByGoodsCode(map);
	
	}
	
	@Override
	public Goods getDetailForFront(Integer goodsId) {
		
		return this.goodsDao.getDetailForFront(goodsId);
	}
	
	@Override
	public List<Attribute> getGoodsAttribute(Integer goodsId) {

		List<Attribute> attributeList = new ArrayList<Attribute>();
		
		List<GoodsAttribute> list = this.goodsAttributeDao.getByGoodsId(goodsId);
		
		Attribute attribute = null;
		
		//第一属性
		
		if(list.get(0).getAttributeValueId1() != null && list.get(0).getAttributeValueId1() != 0){
			
			attribute = new Attribute();
			attribute.setId(list.get(0).getAttributeValue1().getAttributeId());
			attribute.setAttributeName(this.attributeDao.getById(attribute.getId()).getAttributeName());
			attribute.setAttributeValueSet(new HashSet<AttributeValue>());
			for(GoodsAttribute ga : list){
				attribute.getAttributeValueSet().add(ga.getAttributeValue1());
			}
			
			attributeList.add(attribute);
			
		}
		
		//第二属性
		
		if(list.get(0).getAttributeValueId2() != null && list.get(0).getAttributeValueId2() != 0){
			
			attribute = new Attribute();
			attribute.setId(list.get(0).getAttributeValue2().getAttributeId());
			attribute.setAttributeName(this.attributeDao.getById(attribute.getId()).getAttributeName());
			attribute.setAttributeValueSet(new HashSet<AttributeValue>());
			for(GoodsAttribute ga : list){
				attribute.getAttributeValueSet().add(ga.getAttributeValue2());
			}
			
			attributeList.add(attribute);
			
		}

		//第三属性
		
		if(list.get(0).getAttributeValueId3() != null && list.get(0).getAttributeValueId3() != 0){
			
			attribute = new Attribute();
			attribute.setId(list.get(0).getAttributeValue3().getAttributeId());
			attribute.setAttributeName(this.attributeDao.getById(attribute.getId()).getAttributeName());
			attribute.setAttributeValueSet(new HashSet<AttributeValue>());
			for(GoodsAttribute ga : list){
				attribute.getAttributeValueSet().add(ga.getAttributeValue3());
			}
			
			attributeList.add(attribute);
			
		}
		
		return attributeList;
	}
	
	public IGoodsDao getGoodsDao() {
		return goodsDao;
	}
	public void setGoodsDao(IGoodsDao goodsDao) {
		this.goodsDao = goodsDao;
	}
	public ICategoryDao getCategoryDao() {
		return categoryDao;
	}
	public void setCategoryDao(ICategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}
	public IGoodsAttributeDao getGoodsAttributeDao() {
		return goodsAttributeDao;
	}
	public void setGoodsAttributeDao(IGoodsAttributeDao goodsAttributeDao) {
		this.goodsAttributeDao = goodsAttributeDao;
	}
	public IAttributeDao getAttributeDao() {
		return attributeDao;
	}
	public void setAttributeDao(IAttributeDao attributeDao) {
		this.attributeDao = attributeDao;
	}

}
