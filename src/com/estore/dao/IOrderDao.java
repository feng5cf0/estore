package com.estore.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.estore.entities.Order;
import com.landicorp.core.dao.base.IMyBatisDao;

public interface IOrderDao extends IMyBatisDao<Order, Integer> {
	
	public List<Order> getOrder(Order order);
	public List<Order> getAll(Map<String,Object> map);
	public Integer getAllCount(Map<String,Object> map);
	public Order getByOrderId(@Param(value="orderId")Integer orderId);
	public void deleteOrder(@Param(value="orderId")Integer orderId);
}
