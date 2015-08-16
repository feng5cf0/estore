package com.estore.service.impl;

import java.util.List;

import com.estore.dao.INoticeDao;
import com.estore.entities.Address;
import com.estore.entities.Notice;
import com.estore.service.IAddressService;
import com.estore.service.INoticeService;
import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;

public class NoticeServiceImpl extends AbstractBaseServiceImpl<Notice, Integer> implements INoticeService{
	private INoticeDao noticeDao;
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