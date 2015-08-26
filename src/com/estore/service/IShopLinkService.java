package com.estore.service;

import java.util.List;

import com.estore.entities.ShopLink;
import com.landicorp.core.service.base.IBaseService;

public interface IShopLinkService extends IBaseService<ShopLink,Integer> {
	public List<ShopLink> getShopLinkAll();
}
