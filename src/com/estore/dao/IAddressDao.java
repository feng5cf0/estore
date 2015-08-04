package com.estore.dao;

import com.estore.entities.Address;
import com.landicorp.core.dao.base.IMyBatisDao;

public interface IAddressDao extends IMyBatisDao<Address, Integer>{
	public Address getAddressById(Integer id);
	public void addressRegister(Address address);
}
