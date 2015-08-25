package com.estore.dao;

import org.apache.ibatis.annotations.Param;

import com.estore.entities.TransformFee;
import com.landicorp.core.dao.base.IMyBatisDao;

public interface ITransformFeeDao extends IMyBatisDao<TransformFee, Integer> {
	public Float getPriceByCode(@Param(value="code")String locationCode);
}
