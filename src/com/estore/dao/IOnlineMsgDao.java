package com.estore.dao;

import java.util.List;

import com.estore.entities.OnlineMsg;
import com.landicorp.core.dao.base.IMyBatisDao;

public interface IOnlineMsgDao extends IMyBatisDao<OnlineMsg, Integer>{
	public void addOnlineMsg(OnlineMsg onlineMsg);
	public List<OnlineMsg> getOnlineMsgAll();
}
