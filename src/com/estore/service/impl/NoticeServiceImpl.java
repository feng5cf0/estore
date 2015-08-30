package com.estore.service.impl;

import java.util.List;

import com.estore.dao.INoticeDao;
import com.estore.entities.Notice;
import com.estore.service.INoticeService;
import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;

public class NoticeServiceImpl extends AbstractBaseServiceImpl<Notice, Integer> implements INoticeService{
	private INoticeDao noticeDao;
	
	/* 
	 * 添加
	 */
	@Override
	public void addNotice(Notice notice) {
		noticeDao.addNotice(notice);
		
	}
	/* 
	 * 点击公告标题进入详情
	 */
	@Override
	public Notice getNoticeById(Integer id) {
		return noticeDao.getNoticeById(id);
	}
	@Override
	public List<Notice> getNoticeAll() {
		return noticeDao.getNoticeAll();
	}

	@Override
	public IMyBatisDao<Notice, Integer> getMyBatisDao() {
		// TODO Auto-generated method stub
		return noticeDao;
	}

	public INoticeDao getNoticeDao() {
		return noticeDao;
	}

	public void setNoticeDao(INoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}
	

	
	
	


}
