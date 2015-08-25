package com.estore.service.impl;

import java.util.List;

import com.estore.dao.ILocationDao;
import com.estore.entities.Location;
import com.estore.service.ILocationService;
import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;

public class LocationServiceImpl extends AbstractBaseServiceImpl<Location, Integer>
		implements ILocationService {

	private ILocationDao locationDao;
	
	@Override
	public IMyBatisDao<Location, Integer> getMyBatisDao() {
		return this.locationDao;
	}

	@Override
	public List<Location> getAreaByCode(String code) {
		return this.locationDao.getAreaByPcode(code);
	}

	@Override
	public List<Location> getCityByCode(String code) {
		return this.locationDao.getCityByPcode(code);
	}

	@Override
	public List<Location> getCountryByCode(String code) {
		return this.locationDao.getCountryByPcode(code);
	}

	@Override
	public List<Location> getProvinceByCode(String code) {
		return this.locationDao.getProvinceByPcode(code);
	}

	public ILocationDao getLocationDao() {
		return locationDao;
	}
	public void setLocationDao(ILocationDao locationDao) {
		this.locationDao = locationDao;
	}
}
