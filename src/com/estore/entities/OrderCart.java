package com.estore.entities;

import com.landicorp.core.entities.base.BaseEntity;

public class OrderCart extends BaseEntity {

	private Integer orderId;
	private Integer cartId;
	
	private Order order;
	private Cart cart;
	
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public Integer getCartId() {
		return cartId;
	}
	public void setCartId(Integer cartId) {
		this.cartId = cartId;
	}
}
