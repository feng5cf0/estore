package com.estore.service;

import java.util.List;

import com.estore.entities.Video;
import com.landicorp.core.service.base.IBaseService;

public interface IVideoService extends IBaseService<Video,Integer>{
	public List<Video> getVideo();
	public void addVideo(Video video);
	public Video getVideoDetail(Integer id);
}
