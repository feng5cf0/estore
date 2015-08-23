package com.estore.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.estore.entities.Brand;
import com.landicorp.core.dao.base.IMyBatisDao;

public interface IBrandDao extends IMyBatisDao<Brand, Integer> {
	public Brand getById(Integer brandId);
	public List<Brand> getByNum(@Param(value="num")Integer num);
	public List<Brand> getAll();
}
