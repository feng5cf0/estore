package com.estore.dao;

import java.util.List;
import java.util.Map;

import com.estore.entities.Goods;
import com.landicorp.core.dao.base.IMyBatisDao;

public interface IGoodsDao extends IMyBatisDao<Goods, Integer> {
	public List<Goods> getAll(Map<String,Object> map);
	public Integer getAllCount(Goods goods);
}
