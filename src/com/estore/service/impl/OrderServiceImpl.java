package com.estore.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.estore.dao.IOrderCartDao;
import com.estore.dao.IOrderDao;
import com.estore.entities.Address;
import com.estore.entities.Order;
import com.estore.entities.OrderCart;
import com.estore.service.IOrderService;
import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;
import com.landicorp.core.web.pager.Pager;

public class OrderServiceImpl extends AbstractBaseServiceImpl<Order, Integer> implements
		IOrderService {

	private IOrderDao orderDao;
	private IOrderCartDao orderCartDao;
	@Override
	public IMyBatisDao<Order, Integer> getMyBatisDao() {
		
		return this.orderDao;
	}
	
	@Override
	public int add(Order t) {
		
		return this.add(t);
	}

	@Override
	public void addOrder(Order order,Integer[] cartIds,Address address) {
		
		//新增地址表
		
		
		
		//添加order表
		this.orderDao.save(order);
		
		OrderCart orderCart = new OrderCart();
		for(int i=0;i<cartIds.length;i++){
			orderCart.setCartId(cartIds[i]);
			orderCart.setOrderId(order.getId());
			this.orderCartDao.save(orderCart);
		}
	
	}

	@Override
	public List<Order> getOrder(Order order) {
		return this.orderDao.getOrder(order);
	}


	@Override
	public List<Order> getAll(Order order, Pager pager) {

		Map<String,Object> map = new HashMap<String,Object>();
		
		if(pager != null){
			pager.setTotalCount(this.orderDao.getAllCount(map));
		}
		
		map.put("order", order);
		map.put("pager", pager);
		
		
		return this.orderDao.getAll(map);
	}

	public IOrderDao getOrderDao() {
		return orderDao;
	}
	public void setOrderDao(IOrderDao orderDao) {
		this.orderDao = orderDao;
	}
	public IOrderCartDao getOrderCartDao() {
		return orderCartDao;
	}
	public void setOrderCartDao(IOrderCartDao orderCartDao) {
		this.orderCartDao = orderCartDao;
	}



}
