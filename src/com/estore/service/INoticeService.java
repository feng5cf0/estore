package com.estore.service;

import java.util.List;

import com.estore.entities.Notice;
import com.landicorp.core.service.base.IBaseService;

public interface INoticeService extends IBaseService<Notice, Integer> {
	public List<Notice> getNoticeAll();
	public Notice getNoticeById(Integer id);
	public void addNotice(Notice notice);
}

