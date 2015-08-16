package com.estore.service;

import java.util.List;

import com.estore.entities.Cart;
import com.landicorp.core.service.base.IBaseService;

public interface ICartService extends IBaseService<Cart, Integer> {
	public List<Cart> getByCartIds(Integer[] idItems);
	public List<Cart> getByMemberId(Integer memberId);
}