package com.estore.action.front;

import java.util.Date;

import com.estore.dao.IOnlineMsgDao;
import com.estore.entities.OnlineMsg;
import com.estore.service.IOnlineMsgService;
import com.landicorp.core.action.BaseActionSupport;

public class OnlineMsgAction extends BaseActionSupport{

	/**
	 * 在线留言
	 * hzp
	 * 2015-08-08
	 */
	private static final long serialVersionUID = 1L;
	private OnlineMsg onlineMsg;
	private IOnlineMsgService onlineMsgService;
	//在线留言
	public String addOnlineMsg(){
		onlineMsg.setCreateTime(new Date());
		onlineMsgService.addOnlineMsg(onlineMsg);
		return "tomain";
	}
	public OnlineMsg getOnlineMsg() {
		return onlineMsg;
	}
	public void setOnlineMsg(OnlineMsg onlineMsg) {
		this.onlineMsg = onlineMsg;
	}
	public IOnlineMsgService getOnlineMsgService() {
		return onlineMsgService;
	}
	public void setOnlineMsgService(IOnlineMsgService onlineMsgService) {
		this.onlineMsgService = onlineMsgService;
	}
	
	
	
}
