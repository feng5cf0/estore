package com.estore.dao;

import java.util.List;

import com.estore.entities.Video;
import com.landicorp.core.dao.base.IMyBatisDao;
public interface IVideoDao extends IMyBatisDao<Video, Integer>{
	public List<Video> getVideo();
	public void addVideo(Video video);
	public Video getVideoDetail(Integer id);
}
