package com.estore.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.estore.dao.ICartDao;
import com.estore.dao.IFavoriteDao;
import com.estore.entities.Cart;
import com.estore.entities.Favorite;
import com.estore.service.ICartService;
import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;

public class CartServiceImpl extends AbstractBaseServiceImpl<Cart, Integer> implements
		ICartService {
	private ICartDao cartDao;
	private IFavoriteDao favoriteDao;
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
	
	@Override
	public void addFavorite(Integer cartId, Integer goodsId, Integer memberId) {
		
		this.cartDao.deleteCart(cartId);
		
		Favorite favorite = new Favorite();
		favorite.setGoodsId(goodsId);
		favorite.setMemberId(memberId);
		favorite.setStatus(1);
		
		Map<String,Object> map = new HashMap<String,Object>();
		if(this.favoriteDao.isExist(map).size() == 0){
			this.favoriteDao.save(favorite);
		}
	}
	@Override
	public void deleteCarts(Integer[] cartIds) {
		this.cartDao.deleteCarts(cartIds);
	}

	public ICartDao getCartDao() {
		return cartDao;
	}
	public void setCartDao(ICartDao cartDao) {
		this.cartDao = cartDao;
	}
	public IFavoriteDao getFavoriteDao() {
		return favoriteDao;
	}
	public void setFavoriteDao(IFavoriteDao favoriteDao) {
		this.favoriteDao = favoriteDao;
	}


}
