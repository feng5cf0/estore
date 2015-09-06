package com.estore.service.impl;

import com.estore.dao.ICouponDao;
import com.estore.entities.Coupon;
import com.estore.service.ICouponService;
import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;

public class CouponServiceImpl extends AbstractBaseServiceImpl<Coupon, Integer> implements
		ICouponService {
	private ICouponDao couponDao;
	
	@Override
	public IMyBatisDao<Coupon, Integer> getMyBatisDao() {
		return couponDao;
	}
	
	public ICouponDao getCouponDao() {
		return couponDao;
	}
	public void setCouponDao(ICouponDao couponDao) {
		this.couponDao = couponDao;
	}

	
}
