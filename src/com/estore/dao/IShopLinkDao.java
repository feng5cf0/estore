package com.estore.dao;

import java.util.List;

import com.estore.entities.ShopLink;
import com.landicorp.core.dao.base.IMyBatisDao;

public interface IShopLinkDao extends IMyBatisDao<ShopLink, Integer>{
		public List<ShopLink> getShopLinkAll();
}
