package com.estore.entities;

import java.util.Date;

import com.landicorp.core.entities.base.BaseEntity;
/*
 * 会员表
 * author：hzp
 * 2015/7/21
 * 
 * */
public class Member extends BaseEntity{

	/**
	 *  
	 * 
	 */
	
	private static final long serialVersionUID = 1L;
	private Integer memberInfoId; //会员信息表的外键
	private String memberAlias;	 //会员别名
	private String memberRealname;	//真实姓名
	private String memberType;    // 会员类型
	private String memberPassword;//密码
	private float integral;//积分
	private Integer avaliable;//是否有效 1:有效 0：无效
	private Integer isEmailAvaliable;//是否经过邮箱验证 1：验证过 0:没验证
	private Date lastLoginTime;//上一次登录时间
	private String lastLoginIp;//上次登录ip
	private Date createTime =new Date() ;//注册时间
	private Date lastModifyTime;//上一次修改时间
	private Date loginTime =new Date() ;//登录时间
	private String loginIp;//登录ip
	private MemberInfo memberInfo;

	public MemberInfo getMemberInfo() {
		return memberInfo;
	}
	public void setMemberInfo(MemberInfo memberInfo) {
		this.memberInfo = memberInfo;
	}
	public String getMemberAlias() {
		return memberAlias;
	}
	public void setMemberAlias(String memberAlias) {
		this.memberAlias = memberAlias;
	}
	public String getMemberRealname() {
		return memberRealname;
	}
	public void setMemberRealname(String memberRealname) {
		this.memberRealname = memberRealname;
	}
	public String getMemberType() {
		return memberType;
	}
	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}
	public String getMemberPassword() {
		return memberPassword;
	}
	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}
	public float getIntegral() {
		return integral;
	}
	public void setIntegral(float integral) {
		this.integral = integral;
	}
	public Integer getAvaliable() {
		return avaliable;
	}
	public void setAvaliable(Integer avaliable) {
		this.avaliable = avaliable;
	}
	public Integer getIsEmailAvaliable() {
		return isEmailAvaliable;
	}
	public void setIsEmailAvaliable(Integer isEmailAvaliable) {
		this.isEmailAvaliable = isEmailAvaliable;
	}
	public Date getLastLoginTime() {
		return lastLoginTime;
	}
	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	public String getLastLoginIp() {
		return lastLoginIp;
	}
	public void setLastLoginIp(String lastLoginIp) {
		this.lastLoginIp = lastLoginIp;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getLastModifyTime() {
		return lastModifyTime;
	}
	public void setLastModifyTime(Date lastModifyTime) {
		this.lastModifyTime = lastModifyTime;
	}
	public Date getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}
	public String getLoginIp() {
		return loginIp;
	}
	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}
	public Integer getMemberInfoId() {
		return memberInfoId;
	}
	public void setMemberInfoId(Integer memberInfoId) {
		this.memberInfoId = memberInfoId;
	}
	
}
