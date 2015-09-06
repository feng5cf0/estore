package com.estore.service.impl;

import java.util.List;

import com.estore.dao.IDownCenterDao;
import com.estore.entities.DownCenter;
import com.estore.service.IDownCenterService;
import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;

public class DownCenterServiceImpl extends AbstractBaseServiceImpl<DownCenter, Integer> implements IDownCenterService{
	private IDownCenterDao downCenterDao;
	
	
	@Override
	public List<DownCenter> getDownCenter() {
		// TODO Auto-generated method stub
		return downCenterDao.getDownCenter();
	}
	@Override
	public IMyBatisDao<DownCenter, Integer> getMyBatisDao() {
		// TODO Auto-generated method stub
		return downCenterDao;
	}
	@Override
	public void upload(DownCenter downCenter) {
		downCenterDao.upload(downCenter);
	}

	public IDownCenterDao getDownCenterDao() {
		return downCenterDao;
	}

	public void setDownCenterDao(IDownCenterDao downCenterDao) {
		this.downCenterDao = downCenterDao;
	}
	

	
	

}
