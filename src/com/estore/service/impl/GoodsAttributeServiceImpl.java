package com.estore.service.impl;

import java.util.List;
import java.util.Map;

import com.estore.dao.IGoodsAttributeDao;
import com.estore.entities.GoodsAttribute;
import com.estore.service.IGoodsAttributeService;
import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;

public class GoodsAttributeServiceImpl extends AbstractBaseServiceImpl<GoodsAttribute, Integer>
		implements IGoodsAttributeService {

	private IGoodsAttributeDao goodsAttributeDao;
	
	@Override
	public IMyBatisDao<GoodsAttribute, Integer> getMyBatisDao() {
		// TODO Auto-generated method stub
		return this.goodsAttributeDao;
	}

	@Override
	public List<Integer> getIdByAttribute(Map<String, Object> map) {
		return this.goodsAttributeDao.getIdByAttribute(map);
	}
	@Override
	public List<GoodsAttribute> getByAttribute(Map<String, Object> map) {
		return this.goodsAttributeDao.getByAttribute(map);
	}

	public IGoodsAttributeDao getGoodsAttributeDao() {
		return goodsAttributeDao;
	}
	public void setGoodsAttributeDao(IGoodsAttributeDao goodsAttributeDao) {
		this.goodsAttributeDao = goodsAttributeDao;
	}


}
