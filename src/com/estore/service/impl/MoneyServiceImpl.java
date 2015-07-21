package com.estore.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.estore.dao.IMoneyDao;
import com.estore.entities.Money;
import com.estore.service.IMoneyService;
import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;
import com.landicorp.core.web.pager.Pager;

public class MoneyServiceImpl extends AbstractBaseServiceImpl<Money, Integer> implements
		IMoneyService {

	private IMoneyDao moneyDao;
	
	@Override
	public Float loadRate(Integer id) {
		// TODO Auto-generated method stub
		
		return moneyDao.getRate(id);
	}

	@Override
	public IMyBatisDao<Money, Integer> getMyBatisDao() {
		
		return moneyDao;
	}

	@Override
	public int add(Money money) {
		return this.moneyDao.save(money);
	}

	@Override
	public void delete(Money arg0) {
		this.moneyDao.deleteEntity(arg0);
	}

	@Override
	public List<Money> get(Money arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Money> getAll(Money money, Pager pager) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		if(pager != null){
			pager.setTotalCount(moneyDao.getAllCount(money));
		}
		
		map.put("money", money);
		map.put("pager", pager);
		
		return moneyDao.getAll(map);
	}

	@Override
	public List<Money> getAll(Money arg0, String arg1, Pager arg2) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Money getById(Integer arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getCount(Money arg0) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean haveSimilar(Integer arg0, String arg1, Object arg2) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void update(Money arg0) {
		// TODO Auto-generated method stub
	}

	public IMoneyDao getMoneyDao() {
		return moneyDao;
	}
	public void setMoneyDao(IMoneyDao moneyDao) {
		this.moneyDao = moneyDao;
	}

}
