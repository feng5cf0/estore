package com.estore.dao;

import java.util.List;
import java.util.Map;

import com.estore.entities.GoodsIn;
import com.landicorp.core.dao.base.IMyBatisDao;

public interface IGoodsInDao extends IMyBatisDao<GoodsIn, Integer> {
	public List<GoodsIn> getAll(Map<String,Object> map);
	public Integer getAllCount(GoodsIn goodsIn);
}
