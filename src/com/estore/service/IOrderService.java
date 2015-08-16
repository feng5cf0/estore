package com.estore.service;

import java.util.List;

import com.estore.entities.Order;
import com.landicorp.core.service.base.IBaseService;

public interface IOrderService extends IBaseService<Order, Integer> {
	
	public void addOrder(Order order,Integer[] cartIds);
	public List<Order> getOrder(Order order);
}
