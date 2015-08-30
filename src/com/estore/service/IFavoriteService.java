package com.estore.service;

import java.util.List;

import com.estore.entities.Favorite;
import com.landicorp.core.service.base.IBaseService;

public interface IFavoriteService extends IBaseService<Favorite, Integer> {
	public List<Favorite> getByMemberId(Integer memberId);
	public void deleteFavorite(Integer favoriteId);
}
