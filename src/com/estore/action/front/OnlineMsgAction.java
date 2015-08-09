package com.estore.action.front;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.estore.dao.IOnlineMsgDao;
import com.estore.entities.OnlineMsg;
import com.estore.service.IOnlineMsgService;
import com.landicorp.core.action.BaseActionSupport;
import com.opensymphony.xwork2.ActionContext;

public class OnlineMsgAction extends BaseActionSupport{

	/**
	 * 在线留言
	 * hzp
	 * 2015-08-08
	 */
	private static final long serialVersionUID = 1L;
	private OnlineMsg onlineMsg;
	private IOnlineMsgService onlineMsgService;
	List<OnlineMsg> onlineMsgList = new ArrayList<OnlineMsg>();
	//在线留言
	public String addOnlineMsg(){
		onlineMsg.setCreateTime(new Date());
		onlineMsgService.addOnlineMsg(onlineMsg);
		return "tomain";
	}
	//后台显示
	public String getOnlineMsgAll(){
		onlineMsgList=onlineMsgService.getOnlineMsgAll();
		ActionContext.getContext().getSession().put("onlineMsgList", onlineMsgList);

		return "getOnlineMsg";
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
	public List<OnlineMsg> getOnlineMsgList() {
		return onlineMsgList;
	}
	public void setOnlineMsgList(List<OnlineMsg> onlineMsgList) {
		this.onlineMsgList = onlineMsgList;
	}
	
	
	
	
}
