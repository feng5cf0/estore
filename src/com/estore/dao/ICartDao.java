package com.estore.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.estore.entities.Cart;
import com.landicorp.core.dao.base.IMyBatisDao;

public interface ICartDao extends IMyBatisDao<Cart, Integer> {
	public List<Cart> getByCartIds(Integer[] idItems);
	public List<Cart> getByMemberId(Map<String,Object> map);
	public Cart getByCartId(@Param(value="cartId")Integer cartId);
	public void deleteCart(@Param(value="cartId")Integer cartId);
	public void deleteCarts(Integer[] cartIds);
}
