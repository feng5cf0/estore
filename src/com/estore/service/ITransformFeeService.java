package com.estore.service;

import com.estore.entities.TransformFee;
import com.landicorp.core.service.base.IBaseService;

public interface ITransformFeeService extends IBaseService<TransformFee, Integer> {
	public Float getPriceByCode(String locationCode);
}
