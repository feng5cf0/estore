package com.estore.entities;

import com.landicorp.core.entities.base.BaseEntity;

/**
 * @author hzp
 *2015.08.23
 */
public class ShopLink extends BaseEntity{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String shopName;
	private String flagPic;
	private String url;
	
	
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getFlagPic() {
		return flagPic;
	}
	public void setFlagPic(String flagPic) {
		this.flagPic = flagPic;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	

}
