package com.estore.action.back;

import java.util.List;

import com.estore.entities.Order;
import com.estore.service.IOrderService;
import com.landicorp.core.action.BaseActionSupport;

public class OrderAction extends BaseActionSupport {

	private IOrderService orderService;
	private List<Order> orderList;
	private Order order;
	
	/**
	 * 后台查询订单
	 * @return
	 */
	public String loadOrder(){
		
		this.orderList = this.orderService.getAll(this.order,getPager());
		
		return "loadOrder";
	}

	public IOrderService getOrderService() {
		return orderService;
	}
	public void setOrderService(IOrderService orderService) {
		this.orderService = orderService;
	}
	public List<Order> getOrderList() {
		return orderList;
	}
	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
}
