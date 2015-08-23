package com.estore.service;

import java.util.List;

import com.estore.entities.customerSer;
import com.landicorp.core.service.base.IBaseService;

public interface ICustomerSerService extends IBaseService<customerSer, Integer>{
	public List<customerSer> getCustomerSer();
	public void addCustomerSer(customerSer customerSer);
	public void deleteCusSer(Integer id);
	public void updateCusSer(customerSer customerSer);
	public customerSer getCustomerSerById(Integer id);
}
