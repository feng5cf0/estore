package com.estore.action.back;

import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.estore.entities.Video;
import com.estore.service.IVideoService;
import com.estore.util.JsonUtil;
import com.estore.util.Property;
import com.landicorp.core.action.BaseActionSupport;

public class VideoAction extends BaseActionSupport {

	/**
	 * 上传视频
	 * hzp、
	 * 20150903
	 */
	private static final long serialVersionUID = 1L;
	private IVideoService videoService;
	private List<Video> videoAll;
	private Video video;
	Property pro=new Property();
	
	public String getVideoList(){
		this.videoAll=videoService.getVideo();
		return "video";
	}
	/**
	 * 跳转到添加
	 * @return
	 */
	public String toAdd(){
		return "toadd";
	}
	
	/**
	 * 
	 * 添加
	 * @return
	 * @throws Exception 
	 */
	public String add() throws Exception{
		HttpServletResponse response =ServletActionContext.getResponse();
		HttpServletRequest request =  ServletActionContext.getRequest();
		String content = URLDecoder.decode(request.getParameter("vcontent"),"utf-8");
		PrintWriter out = response.getWriter();
		this.video.setFile(content);
		this.video.setCreateTime(new Date());
		if(video!=null){
			this.videoService.addVideo(video);
			pro.put("success", "success");
			out.print(JsonUtil.getJsonStrByMap(pro));
		}else{
			pro.put("error", "error");
			pro.put("errorMsg", "没有添加的数据！");
			out.print(JsonUtil.getJsonStrByMap(pro));
		}
		return null;
	}
	/**
	 * 视频详情
	 * @return
	 */
	public String videoDetail(){
		HttpServletRequest request =  ServletActionContext.getRequest();
		String id = request.getParameter("id");
		this.video = videoService.getVideoDetail(Integer.parseInt(id));
		return "videoDetail";
	}
	public IVideoService getVideoService() {
		return videoService;
	}
    
	public void setVideoService(IVideoService videoService) {
		this.videoService = videoService;
	}

	public List<Video> getVideoAll() {
		return videoAll;
	}

	public void setVideoAll(List<Video> videoAll) {
		this.videoAll = videoAll;
	}
	public Video getVideo() {
		return video;
	}
	public void setVideo(Video video) {
		this.video = video;
	}

	

	
	
}
