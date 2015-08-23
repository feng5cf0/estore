package com.estore.service;

import java.util.List;
import java.util.Map;

import com.estore.entities.GoodsAttribute;
import com.landicorp.core.service.base.IBaseService;

public interface IGoodsAttributeService extends IBaseService<GoodsAttribute, Integer> {
	
	public List<Integer> getIdByAttribute(Map<String,Object> map);
	public List<GoodsAttribute> getByAttribute(Map<String,Object> map);

}
