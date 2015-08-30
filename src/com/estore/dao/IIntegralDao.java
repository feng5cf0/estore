package com.estore.dao;

import com.estore.entities.Integral;
import com.landicorp.core.dao.base.IMyBatisDao;

public interface IIntegralDao extends IMyBatisDao<Integral, Integer>{

	public Integral getIntegralById(Integer id);

}
