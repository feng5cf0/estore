package com.estore.service;

import java.util.List;

import com.estore.entities.Address;
import com.landicorp.core.service.base.IBaseService;

public interface IAddressService extends IBaseService<Address,Integer> {
	public void addressRegister(Address address);
	public Address getAddressById(Integer id);
	public List<Address> getByMemberId(Integer id);
}