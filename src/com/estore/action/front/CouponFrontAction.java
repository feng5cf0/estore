package com.estore.action.front;

import com.estore.service.ICouponService;
import com.opensymphony.xwork2.ActionSupport;

public class CouponFrontAction extends ActionSupport{
	private ICouponService couponService;
	
	public String get(){
		
		return "get";
	}

	public ICouponService getCouponService() {
		return couponService;
	}
	public void setCouponService(ICouponService couponService) {
		this.couponService = couponService;
	}
	
	
}
