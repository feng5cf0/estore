package com.estore.service.impl;

import java.util.List;

import com.estore.dao.ICustomerSerDao;
import com.estore.entities.customerSer;
import com.estore.service.ICustomerSerService;
import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;

public class CustomerSerServiceImpl extends AbstractBaseServiceImpl<customerSer, Integer> 
	implements ICustomerSerService{
	private ICustomerSerDao customerSerDao;
	
	
	@Override
	public void updateCusSer(customerSer customerSer) {
		// TODO Auto-generated method stub
		customerSerDao.updateCusSer(customerSer);
	}

	@Override
	public customerSer getCustomerSerById(Integer id) {
		// TODO Auto-generated method stub
		return customerSerDao.getCustomerSerById(id);
	}
	
	
	@Override
	public void deleteCusSer(Integer id) {
		customerSerDao.deleteCusSer(id);
	}
	
	@Override
	public List<customerSer> getCustomerSer() {
		
		return customerSerDao.getCustomerSer();
	}
	@Override
	public void addCustomerSer(customerSer customerSer) {
		customerSerDao.addCustomerSer(customerSer);
		
	}

	@Override
	public IMyBatisDao<customerSer, Integer> getMyBatisDao() {
		// TODO Auto-generated method stub
		return customerSerDao;
	}

	public ICustomerSerDao getCustomerSerDao() {
		return customerSerDao;
	}

	public void setCustomerSerDao(ICustomerSerDao customerSerDao) {
		this.customerSerDao = customerSerDao;
	}

	
	

	
	
	
}
