package com.estore.service;

import java.util.List;

import com.estore.entities.Brand;
import com.landicorp.core.service.base.IBaseService;

public interface IBrandService extends IBaseService<Brand, Integer> {
	public List<Brand> getAll();
}
