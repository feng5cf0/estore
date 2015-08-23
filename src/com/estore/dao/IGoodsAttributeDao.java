package com.estore.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.estore.entities.GoodsAttribute;
import com.landicorp.core.dao.base.IMyBatisDao;

public interface IGoodsAttributeDao extends IMyBatisDao<GoodsAttribute, Integer> {
	public List<GoodsAttribute> getByGoodsId(@Param(value="goodsId")Integer goodsId);
	public List<Integer> getIdByAttribute(Map<String,Object> map);
	public List<GoodsAttribute> getByAttribute(Map<String,Object> map);
	public GoodsAttribute getById(@Param(value="goodsAttributeMap") Integer goodsAttributeMap);
}
