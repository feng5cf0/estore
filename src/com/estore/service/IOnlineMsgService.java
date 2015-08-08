package com.estore.service;

import com.estore.entities.OnlineMsg;
import com.landicorp.core.service.base.IBaseService;

public interface IOnlineMsgService extends IBaseService<OnlineMsg, Integer> {

	public void addOnlineMsg(OnlineMsg onlineMsg);
	
}
