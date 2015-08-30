package com.estore.dao;

import java.util.List;

import com.estore.entities.Notice;
import com.landicorp.core.dao.base.IMyBatisDao;

public interface INoticeDao extends IMyBatisDao<Notice, Integer>{
	public List<Notice> getNoticeAll();
	public Notice getNoticeById(Integer id);
	public void addNotice(Notice notice);
	
}
