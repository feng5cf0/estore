package com.estore.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.estore.entities.AttributeValue;
import com.landicorp.core.dao.base.IMyBatisDao;

public interface IAttributeValueDao extends IMyBatisDao<AttributeValue,Integer>{
	public AttributeValue getById(@Param(value="attributeValueId")Integer attributeValueId);
	public List<AttributeValue> getByAttributeId(@Param(value="attributeId")Integer attributeId);
}