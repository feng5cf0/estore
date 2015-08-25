package com.estore.service;

import java.util.List;

import com.estore.entities.Location;
import com.landicorp.core.service.base.IBaseService;

public interface ILocationService extends IBaseService<Location, Integer> {
	public List<Location> getCountryByCode(String code);
	public List<Location> getProvinceByCode(String code);
	public List<Location> getCityByCode(String code);
	public List<Location> getAreaByCode(String code);
}
