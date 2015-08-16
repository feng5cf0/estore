package com.estore.dao;

import java.util.List;
import java.util.Map;

import com.estore.entities.Cart;
import com.landicorp.core.dao.base.IMyBatisDao;

public interface ICartDao extends IMyBatisDao<Cart, Integer> {
	public List<Cart> getByCartIds(Integer[] idItems);
	public List<Cart> getByMemberId(Map<String,Object> map);
}
