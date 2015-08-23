package com.estore.service.impl;

import java.util.List;

import com.estore.dao.IBrandDao;
import com.estore.entities.Brand;
import com.estore.service.IBrandService;
import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;

public class BrandServiceImpl extends AbstractBaseServiceImpl<Brand, Integer> implements
		IBrandService {
	private IBrandDao brandDao;
	
	@Override
	public IMyBatisDao<Brand, Integer> getMyBatisDao() {
		return this.brandDao;
	}

	@Override
	public List<Brand> getAll() {
		return this.brandDao.getAll();
	}

	public IBrandDao getBrandDao() {
		return brandDao;
	}
	public void setBrandDao(IBrandDao brandDao) {
		this.brandDao = brandDao;
	}


}
