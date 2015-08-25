package com.estore.action.front;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.estore.entities.Address;
import com.estore.entities.Brand;
import com.estore.entities.Category;
import com.estore.entities.Member;
import com.estore.entities.Order;
import com.estore.service.IBrandService;
import com.estore.service.ICategoryService;
import com.estore.service.IOrderService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class OrderFrontAction extends ActionSupport {

	private Integer[] cartIds;
	private IOrderService orderService;
	private Order order;
	private List<Order> orderList;
	
	private List<Category> categoryList;
	private ICategoryService categoryService;
	private IBrandService brandService;
	private List<Brand> brandList;
	
	private Address address;
	
	public String addOrder(){
		
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();
		
		if(order == null){
			order = new Order();
		}
		
		//判断是否登录
		Map<String,Object> session = ActionContext.getContext().getSession();
		Member member = (Member)session.get("member");

		if(member == null){
			
			return "login";
		}
		order.setMemberId(member.getId());
		order.setCreateTime(new Date());
		order.setStatus(1);
		
		this.orderService.addOrder(order,cartIds,address);
		
		return "addOrder";
	}
	public String pay(){
		
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();
		
		return "pay";
	}
	
	public String get(){
		
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();
		
		//判断是否登录
		Map<String,Object> session = ActionContext.getContext().getSession();
		Member member = (Member)session.get("member");
		
		if(member == null){
			return "toLogin";
		}
		order = new Order();
		order.setMemberId(member.getId());
		order.setStatus(1);
		
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
	public IBrandService getBrandService() {
		return brandService;
	}
	public void setBrandService(IBrandService brandService) {
		this.brandService = brandService;
	}
	public List<Brand> getBrandList() {
		return brandList;
	}
	public void setBrandList(List<Brand> brandList) {
		this.brandList = brandList;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
}
