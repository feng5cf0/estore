package com.estore.action.front;

import java.util.Locale;
import java.util.ResourceBundle;

import com.landicorp.core.action.BaseActionSupport;

public class LanguageAction extends BaseActionSupport {
	
	public String changeLanguage(){
		
		Locale locale = Locale.US;
		
		ResourceBundle myResource = ResourceBundle.getBundle("com.estore.i18n.resource.language.properties", locale);
		
		getSession().put("myResource", myResource);
		
		return "changeLanguage";
	}
}
