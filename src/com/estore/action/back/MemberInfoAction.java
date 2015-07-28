package com.estore.action.back;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.aspectj.util.ConfigParser.ParseException;

import com.estore.entities.Member;
import com.estore.entities.MemberInfo;
import com.estore.service.IMemberInfoService;
import com.estore.service.IMemberService;
import com.estore.util.GetIpUtil;
import com.landicorp.core.action.BaseActionSupport;

public class MemberInfoAction  extends BaseActionSupport{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private IMemberInfoService memberInfoService;
    private IMemberService memberService;
    private MemberInfo memberInfo;
    private Member member;
    private String sbirthday;
    private File pic;
    private String picContentType; // 文件的内容类型
    private String picFileName; // 上传文件名
	private Integer id;
	private InputStream inputStream;
    GetIpUtil getIpUtil = new GetIpUtil();
    //根据id查找会员信息，包括会员表信息 ，1对1关联
    public String getMemberInfoById(){
    	memberInfo = memberInfoService.getMemberInfoById(id);
    	System.out.println(memberInfo);
    	return "success";
    }
    
    //会员注册
    public String memberRegister(){
    	HttpServletRequest request = ServletActionContext.getRequest();
    	String loginIp=getIpUtil.getIpAddr(request);
    	String realPath = ServletActionContext.getServletContext().getRealPath("/memberPic");
    	String lj = realPath+"\\"+picFileName;
    	try{
	    	if(pic != null){
	    		File savefile = new File(new File(realPath),picFileName);
	    		if(!savefile.getParentFile().exists()){
	    			savefile.getParentFile().mkdirs();
	    		}
	    		FileUtils.copyFile(pic, savefile);
	    		}
    	}catch(IOException e){
    		e.printStackTrace();
    	}catch(ParseException e){
    		e.printStackTrace();
    	}
    	java.util.Date date = null;
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟  
    	try {
    		 date=sdf.parse(sbirthday);
		} catch (java.text.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	memberInfo.setBirthday(date);
    	memberInfo.setPhotoPath(lj);
    	memberInfo.setMemo("fsdfdsfsd");
    	member.setAvaliable(1);
    	member.setCreateTime(new Date());
    	member.setIntegral(0);
    	member.setIsEmailAvaliable(1);
    	member.setLastLoginIp("");
    	member.setLastLoginTime(new Date());
    	member.setLastModifyTime(new Date());
    	member.setLoginTime(new Date());
    	member.setMemberType("会员");
    	member.setLoginIp(loginIp);
    	memberService.SaveMember(member);
    	memberInfoService.memberRegister(memberInfo);
    	return "success";
    }

    
    
	public IMemberInfoService getMemberInfoService() {
		return memberInfoService;
	}

	public void setMemberInfoService(IMemberInfoService memberInfoService) {
		this.memberInfoService = memberInfoService;
	}

	public IMemberService getMemberService() {
		return memberService;
	}

	public void setMemberService(IMemberService memberService) {
		this.memberService = memberService;
	}

	public MemberInfo getMemberInfo() {
		return memberInfo;
	}

	public void setMemberInfo(MemberInfo memberInfo) {
		this.memberInfo = memberInfo;
	}


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	
	public String getPicContentType() {
		return picContentType;
	}

	public void setPicContentType(String picContentType) {
		this.picContentType = picContentType;
	}

	public String getPicFileName() {
		return picFileName;
	}

	public void setPicFileName(String picFileName) {
		this.picFileName = picFileName;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public File getPic() {
		return pic;
	}

	public void setPic(File pic) {
		this.pic = pic;
	}

	public String getSbirthday() {
		return sbirthday;
	}

	public void setSbirthday(String sbirthday) {
		this.sbirthday = sbirthday;
	}

	
	

    
    
	
	
    
    
    
}