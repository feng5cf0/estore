package com.estore.entities;

import java.util.Date;
import java.util.Set;

import com.landicorp.core.entities.base.BaseEntity;


public class Order extends BaseEntity {
	
	private Integer memberId;
	private Float priceAmount;
	private Integer isOnsale;
	private Float priceOnsale;
	private Float moneyType;
	private Float payMoney;
	private Integer addressId;
	private Date createTime;
	private Date sendTime;
	private Integer sendType;
	private Float transformFee;
	private Integer status;
	private String payPic;
	private String sendPic;
	private Integer handlerId;
	private Set<Cart> cartSet;
	
	private Address address;
	
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public Float getPriceAmount() {
		return priceAmount;
	}
	public void setPriceAmount(Float priceAmount) {
		this.priceAmount = priceAmount;
	}
	public Integer getIsOnsale() {
		return isOnsale;
	}
	public void setIsOnsale(Integer isOnsale) {
		this.isOnsale = isOnsale;
	}
	public Float getPriceOnsale() {
		return priceOnsale;
	}
	public void setPriceOnsale(Float priceOnsale) {
		this.priceOnsale = priceOnsale;
	}
	public Float getMoneyType() {
		return moneyType;
	}
	public void setMoneyType(Float moneyType) {
		this.moneyType = moneyType;
	}
	public Float getPayMoney() {
		return payMoney;
	}
	public void setPayMoney(Float payMoney) {
		this.payMoney = payMoney;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getSendTime() {
		return sendTime;
	}
	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}
	public Integer getSendType() {
		return sendType;
	}
	public void setSendType(Integer sendType) {
		this.sendType = sendType;
	}
	public Float getTransformFee() {
		return transformFee;
	}
	public void setTransformFee(Float transformFee) {
		this.transformFee = transformFee;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getPayPic() {
		return payPic;
	}
	public void setPayPic(String payPic) {
		this.payPic = payPic;
	}
	public String getSendPic() {
		return sendPic;
	}
	public void setSendPic(String sendPic) {
		this.sendPic = sendPic;
	}
	public Integer getHandlerId() {
		return handlerId;
	}
	public void setHandlerId(Integer handlerId) {
		this.handlerId = handlerId;
	}
	public Set<Cart> getCartSet() {
		return cartSet;
	}
	public void setCartSet(Set<Cart> cartSet) {
		this.cartSet = cartSet;
	}
	public Integer getAddressId() {
		return addressId;
	}
	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
}
