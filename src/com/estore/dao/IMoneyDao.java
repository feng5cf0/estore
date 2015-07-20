package com.estore.dao;

import java.util.List;

import com.estore.entities.Money;
import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.web.pager.Pager;

public interface IMoneyDao extends IMyBatisDao<Money, Integer> {
	
	public Float getRate(Integer id);
	
	public List<Money> getAll(Money money,Pager pager);
	public Integer getAllCount(Money money);
	
}
