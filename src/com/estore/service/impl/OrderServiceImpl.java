package com.estore.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.estore.dao.IAddressDao;
import com.estore.dao.ICartDao;
import com.estore.dao.IGoodsAttributeDao;
import com.estore.dao.IOrderCartDao;
import com.estore.dao.IOrderDao;
import com.estore.entities.Address;
import com.estore.entities.Cart;
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
	private IAddressDao addressDao;
	private IGoodsAttributeDao goodsAttributeDao;
	private ICartDao cartDao;
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
		this.addressDao.save(address);
		
		//添加order表
		order.setAddressId(address.getId());
		this.orderDao.save(order);
		
		OrderCart orderCart = new OrderCart();
		for(int i=0;i<cartIds.length;i++){
			orderCart.setCartId(cartIds[i]);
			orderCart.setOrderId(order.getId());
			this.orderCartDao.save(orderCart);

			//修正商品前台库存
			Map<String,Object> map = new HashMap<String,Object>();
			Cart cart = this.cartDao.getByCartId(cartIds[i]);
			map.put("goodsAttributeId", cart.getGoodsAttributeId());
			map.put("num", cart.getTotal());
			this.goodsAttributeDao.reduceFrontAccount(map);
			
			//删除购物车
			this.cartDao.deleteCart(cartIds[i]);
		}
	}
	
	@Override
	public void addOrder(Order order, Integer[] cartIds, Integer addressId) {
		//添加order表
		order.setAddressId(addressId);
		this.orderDao.save(order);
		
		OrderCart orderCart = new OrderCart();
		for(int i=0;i<cartIds.length;i++){
			orderCart.setCartId(cartIds[i]);
			orderCart.setOrderId(order.getId());
			this.orderCartDao.save(orderCart);

			//修正商品前台库存
			Map<String,Object> map = new HashMap<String,Object>();
			Cart cart = this.cartDao.getByCartId(cartIds[i]);
			map.put("goodsAttributeId", cart.getGoodsAttributeId());
			map.put("num", cart.getTotal());
			this.goodsAttributeDao.reduceFrontAccount(map);
			
			//删除购物车
			this.cartDao.deleteCart(cartIds[i]);
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

	@Override
	public Order getByOrderId(Integer orderId) {
		return this.orderDao.getByOrderId(orderId);
	}
	@Override
	public void deleteOrder(Integer orderId) {
		this.orderDao.deleteOrder(orderId);
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
	public IAddressDao getAddressDao() {
		return addressDao;
	}
	public void setAddressDao(IAddressDao addressDao) {
		this.addressDao = addressDao;
	}
	public IGoodsAttributeDao getGoodsAttributeDao() {
		return goodsAttributeDao;
	}
	public void setGoodsAttributeDao(IGoodsAttributeDao goodsAttributeDao) {
		this.goodsAttributeDao = goodsAttributeDao;
	}
	public ICartDao getCartDao() {
		return cartDao;
	}
	public void setCartDao(ICartDao cartDao) {
		this.cartDao = cartDao;
	}



}
