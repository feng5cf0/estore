package com.estore.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.estore.dao.ICartDao;
import com.estore.entities.Cart;
import com.estore.service.ICartService;
import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;

public class CartServiceImpl extends AbstractBaseServiceImpl<Cart, Integer> implements
		ICartService {
	private ICartDao cartDao;
	
	@Override
	public IMyBatisDao<Cart, Integer> getMyBatisDao() {
		return this.cartDao;
	}

	@Override
	public List<Cart> getByCartIds(Integer[] idItems) {

		return this.cartDao.getByCartIds(idItems);
	}

	@Override
	public List<Cart> getByMemberId(Integer memberId) {

		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberId", memberId);
		return this.cartDao.getByMemberId(map);
	}
	
	
	@Override
	public int add(Cart t) {
		
		return this.cartDao.save(t);
	}

	public ICartDao getCartDao() {
		return cartDao;
	}

	public void setCartDao(ICartDao cartDao) {
		this.cartDao = cartDao;
	}


}
