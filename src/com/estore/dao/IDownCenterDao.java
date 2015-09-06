package com.estore.dao;

import java.util.List;

import com.estore.entities.DownCenter;
import com.landicorp.core.dao.base.IMyBatisDao;
public interface IDownCenterDao extends IMyBatisDao<DownCenter, Integer>{
	public List<DownCenter> getDownCenter();
	public void upload(DownCenter downCenter);
}
