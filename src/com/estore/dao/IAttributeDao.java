package com.estore.dao;

import org.apache.ibatis.annotations.Param;

import com.estore.entities.Attribute;
import com.landicorp.core.dao.base.IMyBatisDao;

public interface IAttributeDao extends IMyBatisDao<Attribute, Integer> {
	public Attribute getById(@Param(value="attributeId")Integer attributeId);
}
