package com.estore.service;

import java.util.List;

import com.estore.entities.Address;
import com.estore.entities.Order;
import com.landicorp.core.service.base.IBaseService;
import com.landicorp.core.web.pager.Pager;

public interface IOrderService extends IBaseService<Order, Integer> {
	
	public void addOrder(Order order,Integer[] cartIds,Address address);
	public List<Order> getOrder(Order order);
	
	public List<Order> getAll(Order order ,Pager pager);
	public Order getByOrderId(Integer orderId);
	public void deleteOrder(Integer orderId);
	public void addOrder(Order order, Integer[] cartIds, Integer addressId);
}
