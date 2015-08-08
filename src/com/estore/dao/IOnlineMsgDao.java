package com.estore.dao;

import com.estore.entities.OnlineMsg;
import com.landicorp.core.dao.base.IMyBatisDao;

public interface IOnlineMsgDao extends IMyBatisDao<OnlineMsg, Integer>{
	public void addOnlineMsg(OnlineMsg onlineMsg);
}
