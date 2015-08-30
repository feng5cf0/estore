package com.estore.service.impl;

import com.estore.dao.IIntegralDao;
import com.estore.entities.Integral;
import com.estore.service.IIntegralService;
import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;

public class IntegralServiceImpl extends AbstractBaseServiceImpl<Integral, Integer> implements IIntegralService{
	private IIntegralDao integralDao;
	@Override
	public Integral getIntegralById(Integer id) {
		// TODO Auto-generated method stub
		return integralDao.getIntegralById(id);
	}

	@Override
	public IMyBatisDao<Integral, Integer> getMyBatisDao() {
		// TODO Auto-generated method stub
		return integralDao;
	}

	public IIntegralDao getIntegralDao() {
		return integralDao;
	}

	public void setIntegralDao(IIntegralDao integralDao) {
		this.integralDao = integralDao;
	}
	


}
