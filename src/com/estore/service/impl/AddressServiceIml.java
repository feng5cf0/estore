package com.estore.service.impl;

import com.estore.dao.IAddressDao;
import com.estore.entities.Address;
import com.estore.service.IAddressService;
import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;

public class AddressServiceIml extends AbstractBaseServiceImpl<Address, Integer> implements IAddressService{
	private IAddressDao addressDao;
	@Override
	public void addressRegister(Address address) {
		addressDao.addressRegister(address);
	}
	
	@Override
	public Address getAddressById(Integer id) {
		return addressDao.getAddressById(id);
	}
	@Override
	public IMyBatisDao<Address, Integer> getMyBatisDao() {
		// TODO Auto-generated method stub
		return this.addressDao;
	}

	public IAddressDao getAddressDao() {
		return addressDao;
	}

	public void setAddressDao(IAddressDao addressDao) {
		this.addressDao = addressDao;
	}


	

	
	
	
}
