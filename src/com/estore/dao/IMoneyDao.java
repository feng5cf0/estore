package com.estore.dao;

import java.util.List;
import java.util.Map;

import com.estore.entities.Money;
import com.landicorp.core.dao.base.IMyBatisDao;

public interface IMoneyDao extends IMyBatisDao<Money, Integer> {
	
	public Float getRate(Integer id);
	
	public List<Money> getAll(Map<String,Object> map);
	public Integer getAllCount(Money money);
	
}
