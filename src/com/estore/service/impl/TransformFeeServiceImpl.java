package com.estore.service.impl;

import com.estore.dao.ITransformFeeDao;
import com.estore.entities.TransformFee;
import com.estore.service.ITransformFeeService;
import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;

public class TransformFeeServiceImpl extends AbstractBaseServiceImpl<TransformFee, Integer>
		implements ITransformFeeService {
	
	private ITransformFeeDao transformFeeDao;
	
	@Override
	public IMyBatisDao<TransformFee, Integer> getMyBatisDao() {
		// TODO Auto-generated method stub
		return this.transformFeeDao;
	}

	public ITransformFeeDao getTransformFeeDao() {
		return transformFeeDao;
	}
	public void setTransformFeeDao(ITransformFeeDao transformFeeDao) {
		this.transformFeeDao = transformFeeDao;
	}

	@Override
	public Float getPriceByCode(String locationCode) {
		
		Float price = this.transformFeeDao.getPriceByCode(locationCode);
		
		if(price == null){
			//加载默认运费
			price = this.transformFeeDao.getPriceByCode("0");
			return price;
		}else{
			return price;
		}
		
	}
	
}
