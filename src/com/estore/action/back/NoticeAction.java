package com.estore.action.back;

import java.util.List;

import com.estore.entities.Notice;
import com.estore.service.INoticeService;
import com.landicorp.core.action.BaseActionSupport;

public class NoticeAction extends BaseActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private INoticeService noticeService;
	private List<Notice> noticeListAll;
	public String getNoticeAll(){
		this.noticeListAll=noticeService.getNoticeAll();
		return "noticeSearch";
	}
	public INoticeService getNoticeService() {
		return noticeService;
	}
	public void setNoticeService(INoticeService noticeService) {
		this.noticeService = noticeService;
	}
	public List<Notice> getNoticeListAll() {
		return noticeListAll;
	}
	public void setNoticeListAll(List<Notice> noticeListAll) {
		this.noticeListAll = noticeListAll;
	}
	
	
}
