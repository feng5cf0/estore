package com.estore.service;

import com.estore.entities.Money;
import com.landicorp.core.service.base.IBaseService;

public interface IMoneyService extends IBaseService<Money, Integer> {

	public Float loadRate(Integer id);
	
}
