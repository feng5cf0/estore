package com.estore.action.front;

import java.util.Date;
import java.util.List;

import com.estore.entities.Category;
import com.estore.entities.Member;
import com.estore.entities.Order;
import com.estore.service.ICategoryService;
import com.estore.service.IOrderService;
import com.landicorp.core.action.BaseActionSupport;

public class OrderFrontAction extends BaseActionSupport {

	private Integer[] cartIds;
	private IOrderService orderService;
	private Order order;
	private List<Order> orderList;
	
	private List<Category> categoryList;
	private ICategoryService categoryService;
	
	public String addOrder(){
		
		this.categoryList = this.categoryService.getForFront();
		
		if(order == null){
			order = new Order();
		}
		
		//获取当前登录用户
		Member member = (Member)getSession().get("member");
		if(member == null){
			
			return "login";
		}
		order.setMemberId(member.getId());
		order.setCreateTime(new Date());
		
		this.orderService.addOrder(order,cartIds);
		
		return "addOrder";
	}
	public String pay(){
		
		this.categoryList = this.categoryService.getForFront();
		
		return "pay";
	}
	
	public String get(){
		
		this.categoryList = this.categoryService.getForFront();
		
		Member member = (Member)getSession().get("member");
		if(member == null){
			return "toLogin";
		}
		
		order.setMemberId(member.getId());
		order.setStatus(1);//
		
		this.orderList = this.orderService.getOrder(order);
		
		return "getOrder";
	}
	
	public Integer[] getCartIds() {
		return cartIds;
	}
	public void setCartIds(Integer[] cartIds) {
		this.cartIds = cartIds;
	}
	public IOrderService getOrderService() {
		return orderService;
	}
	public void setOrderService(IOrderService orderService) {
		this.orderService = orderService;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public List<Order> getOrderList() {
		return orderList;
	}
	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}
	public List<Category> getCategoryList() {
		return categoryList;
	}
	public void setCategoryList(List<Category> categoryList) {
		this.categoryList = categoryList;
	}
	public ICategoryService getCategoryService() {
		return categoryService;
	}
	public void setCategoryService(ICategoryService categoryService) {
		this.categoryService = categoryService;
	}
}
