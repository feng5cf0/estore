package com.estore.entities;

import java.util.Date;



import com.landicorp.core.entities.base.BaseEntity;

/*
 * 会员详细信息
 * 
 * */

public class MemberInfo extends BaseEntity{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String IdCard;//身份证号
	private String mobilePhone;//手机号码
	private String telephone;//电话号码
	private String email;//邮箱
	private String photoPath;//图片存储路径
	private int sex;//性别
	private Date birthday;//出生日期
	private String location;//出生地址
	private String businessLicense;//营业执照路径
	private String doorHeader;//门头照路径
	
	
	
	public String getIdCard() {
		return IdCard;
	}
	public void setIdCard(String idCard) {
		IdCard = idCard;
	}
	public String getMobilePhone() {
		return mobilePhone;
	}
	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	

	public String getPhotoPath() {
		return photoPath;
	}
	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex){
		this.sex=sex;
	}
//	public void setSex(String sex) {
//		int temp;
//		if(sex.equals("男")){
//			temp=0;
//		}else if(sex.equals("女")){
//			temp=1;
//		}else if(sex.equals("保密")){
//			temp=2;
//		}else{
//			temp=3;
//		}
//		this.sex = temp;
//	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getBusinessLicense() {
		return businessLicense;
	}
	public void setBusinessLicense(String businessLicense) {
		this.businessLicense = businessLicense;
	}
	public String getDoorHeader() {
		return doorHeader;
	}
	public void setDoorHeader(String doorHeader) {
		this.doorHeader = doorHeader;
	}
	
	
}
