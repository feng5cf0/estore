package com.estore.service.impl;

import java.util.List;

import com.estore.dao.IGoodsDao;
import com.estore.dao.IOnsaleDao;
import com.estore.entities.Goods;
import com.estore.entities.Onsale;
import com.estore.service.IOnsaleService;
import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;

public class OnsaleServiceImpl extends AbstractBaseServiceImpl<Onsale, Integer> implements
		IOnsaleService {
	private IOnsaleDao onsaleDao;
	private IGoodsDao goodsDao;
	
	@Override
	public IMyBatisDao<Onsale, Integer> getMyBatisDao() {
		return onsaleDao;
	}
	
	@Override
	public List<Goods> getOnsaleGoods() {

		
		return this.goodsDao.getOnsaleGoods();
	}
	
	public IOnsaleDao getOnsaleDao() {
		return onsaleDao;
	}
	public void setOnsaleDao(IOnsaleDao onsaleDao) {
		this.onsaleDao = onsaleDao;
	}
	public IGoodsDao getGoodsDao() {
		return goodsDao;
	}
	public void setGoodsDao(IGoodsDao goodsDao) {
		this.goodsDao = goodsDao;
	}



}
