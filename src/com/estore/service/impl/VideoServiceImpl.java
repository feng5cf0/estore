package com.estore.service.impl;

import java.util.List;

import com.estore.dao.IVideoDao;
import com.estore.entities.Video;
import com.estore.service.IVideoService;
import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;

public class VideoServiceImpl extends AbstractBaseServiceImpl<Video, Integer> implements IVideoService{
	private IVideoDao videoDao;
	@Override
	public List<Video> getVideo() {
		// TODO Auto-generated method stub
		return videoDao.getVideo();
	}
	@Override
	public void addVideo(Video video) {
		videoDao.addVideo(video);
		
	}
	@Override
	public Video getVideoDetail(Integer id) {
		
		return videoDao.getVideoDetail(id);
	}
	@Override
	public IMyBatisDao<Video, Integer> getMyBatisDao() {
		// TODO Auto-generated method stub
		return videoDao;
	}
	
	
	
	
	public IVideoDao getVideoDao() {
		return videoDao;
	}

	public void setVideoDao(IVideoDao videoDao) {
		this.videoDao = videoDao;
	}
	

	
	
	

}
