package com.estore.dao;

import java.util.List;

import com.estore.entities.Order;
import com.landicorp.core.dao.base.IMyBatisDao;

public interface IOrderDao extends IMyBatisDao<Order, Integer> {
	
	public List<Order> getOrder(Order order);
	
}
