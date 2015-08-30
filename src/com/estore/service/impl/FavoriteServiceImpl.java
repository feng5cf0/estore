package com.estore.service.impl;

import java.util.List;

import com.estore.dao.IFavoriteDao;
import com.estore.entities.Favorite;
import com.estore.service.IFavoriteService;
import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;

public class FavoriteServiceImpl extends AbstractBaseServiceImpl<Favorite, Integer>
		implements IFavoriteService {

	private IFavoriteDao favoriteDao;
	
	@Override
	public IMyBatisDao<Favorite, Integer> getMyBatisDao() {
		return this.favoriteDao;
	}

	@Override
	public int add(Favorite favorite) {
		return this.favoriteDao.save(favorite);
	}

	@Override
	public void deleteFavorite(Integer favoriteId) {
		this.favoriteDao.deleteFavorite(favoriteId);
	}
	public IFavoriteDao getFavoriteDao() {
		return favoriteDao;
	}
	public void setFavoriteDao(IFavoriteDao favoriteDao) {
		this.favoriteDao = favoriteDao;
	}

	@Override
	public List<Favorite> getByMemberId(Integer memberId) {
		return this.favoriteDao.getByMemberId(memberId);
	}

	
}
