package com.estore.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.estore.entities.Goods;
import com.estore.entities.Onsale;
import com.landicorp.core.dao.base.IMyBatisDao;

public interface IOnsaleDao extends IMyBatisDao<Onsale, Integer> {
	public Onsale getById(@Param(value="onsaleId")Integer onsaleId);
	public List<Goods> getOnsaleGoods();

}
