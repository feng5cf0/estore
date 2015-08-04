package com.estore.service;

import com.estore.entities.Address;
import com.landicorp.core.service.base.IBaseService;

public interface IAddressService extends IBaseService<Address,Integer> {
	public void addressRegister(Address address);
	public Address getAddressById(Integer id);
}