package com.estore.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.estore.dao.IGoodsDao;
import com.estore.entities.Goods;
import com.estore.service.IGoodsService;
import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;
import com.landicorp.core.web.pager.Pager;

public class GoodsServiceImpl extends AbstractBaseServiceImpl<Goods, Integer> implements
		IGoodsService {

	private IGoodsDao goodsDao;
	
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



	public IGoodsDao getGoodsDao() {
		return goodsDao;
	}
	public void setGoodsDao(IGoodsDao goodsDao) {
		this.goodsDao = goodsDao;
	}

}
