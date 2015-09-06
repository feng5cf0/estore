package com.estore.service;

import java.util.List;

import com.estore.entities.DownCenter;
import com.landicorp.core.service.base.IBaseService;

public interface IDownCenterService extends IBaseService<DownCenter,Integer>{
	public List<DownCenter> getDownCenter();
	public void upload(DownCenter downCenter);
}
