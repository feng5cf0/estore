package com.estore.service.impl;

import java.util.List;

import com.estore.dao.IShopLinkDao;
import com.estore.entities.ShopLink;
import com.estore.service.IShopLinkService;
import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;

public class ShopLinkServiceImpl extends AbstractBaseServiceImpl<ShopLink, Integer> implements IShopLinkService{
	private IShopLinkDao shopLinkDao;
	//获取所有
	@Override
	public List<ShopLink> getShopLinkAll() {
		return shopLinkDao.getShopLinkAll();
	}

	@Override
	public IMyBatisDao<ShopLink, Integer> getMyBatisDao() {
		// TODO Auto-generated method stub
		return shopLinkDao;
	}

	public IShopLinkDao getShopLinkDao() {
		return shopLinkDao;
	}

	public void setShopLinkDao(IShopLinkDao shopLinkDao) {
		this.shopLinkDao = shopLinkDao;
	}
	

}
