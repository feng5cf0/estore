package com.estore.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.estore.entities.Location;
import com.landicorp.core.dao.base.IMyBatisDao;

public interface ILocationDao extends IMyBatisDao<Location, Integer> {
	public List<Location> getCountryByPcode(@Param(value="code")String code);
	public List<Location> getProvinceByPcode(@Param(value="code")String code);
	public List<Location> getCityByPcode(@Param(value="code")String code);
	public List<Location> getAreaByPcode(@Param(value="code")String code);
}
