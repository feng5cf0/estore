package com.estore.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class userUtil {

	public boolean isUserOnline(HttpServletRequest request){
	    HttpSession session = request.getSession();
	    if(session.getAttribute("member")==null){
	    	return false;
	    }else{
	    	return true;
	    }
	}

}
