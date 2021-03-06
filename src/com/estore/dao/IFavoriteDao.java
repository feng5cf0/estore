package com.estore.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.estore.entities.Favorite;
import com.landicorp.core.dao.base.IMyBatisDao;

public interface IFavoriteDao extends IMyBatisDao<Favorite, Integer> {

	List<Favorite> getByMemberId(@Param(value="memberId") Integer memberId);

	void deleteFavorite(@Param(value="favoriteId")Integer favoriteId);

	public List<Favorite> isExist(Map<String,Object> map);

}
