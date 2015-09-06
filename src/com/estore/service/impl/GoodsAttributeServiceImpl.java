package com.estore.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.estore.dao.IGoodsAttributeDao;
import com.estore.entities.GoodsAttribute;
import com.estore.service.IGoodsAttributeService;
import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;

public class GoodsAttributeServiceImpl extends AbstractBaseServiceImpl<GoodsAttribute, Integer>
		implements IGoodsAttributeService {

	private IGoodsAttributeDao goodsAttributeDao;
	
	@Override
	public IMyBatisDao<GoodsAttribute, Integer> getMyBatisDao() {
		// TODO Auto-generated method stub
		return this.goodsAttributeDao;
	}

	@Override
	public List<Integer> getIdByAttribute(Map<String, Object> map) {
		return this.goodsAttributeDao.getIdByAttribute(map);
	}
	@Override
	public List<GoodsAttribute> getByAttribute(Map<String, Object> map) {
		return this.goodsAttributeDao.getByAttribute(map);
	}
	@Override
	public Map<String,Object> getFrontAccountByAttribute(Integer[] attributeArray,Integer goodsId) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("goodsId", goodsId);

		for(int i = 1;i<=attributeArray.length;i++){
			if(attributeArray[i-1] != 0){
				map.put("attribute"+i, attributeArray[i-1]);
			}
		}
		
		Map<String,Object> resultMap = new HashMap<String,Object>();
		Float price = 0f;
		Integer frontAccount = 0;
		for(Map<String,Object> temp : this.goodsAttributeDao.getDataByAttribute(map)){
			price = (Float)temp.get("price");
			frontAccount = frontAccount + (Integer)temp.get("frontAccount");
		}
		
		resultMap.put("price", price);
		resultMap.put("frontAccount",frontAccount);
		
		return resultMap;
	}

	public IGoodsAttributeDao getGoodsAttributeDao() {
		return goodsAttributeDao;
	}
	public void setGoodsAttributeDao(IGoodsAttributeDao goodsAttributeDao) {
		this.goodsAttributeDao = goodsAttributeDao;
	}



}
