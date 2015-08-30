package com.estore.service;

import com.estore.entities.Integral;
import com.landicorp.core.service.base.IBaseService;

public interface IIntegralService extends IBaseService<Integral,Integer>{
	public Integral getIntegralById(Integer id);

}
