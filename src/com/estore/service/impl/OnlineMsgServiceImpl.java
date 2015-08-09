/**
 * 
 */
package com.estore.service.impl;

import java.util.List;

import com.estore.dao.IOnlineMsgDao;
import com.estore.entities.OnlineMsg;
import com.estore.service.IOnlineMsgService;
import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;

/**
 * @author Administrator
 *
 */
public class OnlineMsgServiceImpl extends AbstractBaseServiceImpl<OnlineMsg, Integer> implements
 IOnlineMsgService{
	private IOnlineMsgDao onlineMsgDao;
	//后台显示
	@Override
	public List<OnlineMsg> getOnlineMsgAll() {
		return onlineMsgDao.getOnlineMsgAll();
	}
	//在线留言
	@Override
	public void addOnlineMsg(OnlineMsg onlineMsg) {
		onlineMsgDao.addOnlineMsg(onlineMsg);
	}

	@Override
	public IMyBatisDao<OnlineMsg, Integer> getMyBatisDao() {
		// TODO Auto-generated method stub
		return onlineMsgDao;
	}

	public IOnlineMsgDao getOnlineMsgDao() {
		return onlineMsgDao;
	}

	public void setOnlineMsgDao(IOnlineMsgDao onlineMsgDao) {
		this.onlineMsgDao = onlineMsgDao;
	}

	
	
	
	
		

	
	

}
