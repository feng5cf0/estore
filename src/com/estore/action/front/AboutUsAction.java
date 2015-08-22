package com.estore.action.front;

import java.util.List;

import com.estore.entities.Category;
import com.estore.service.ICategoryService;
import com.opensymphony.xwork2.ActionSupport;

public class AboutUsAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<Category> categoryList;
	private ICategoryService categoryService;
	//跳转到关于我们页面
		public String toAboutUs(){
			this.categoryList = this.categoryService.getForFront();
			return "toaboutus";
		}
		public List<Category> getCategoryList() {
			this.categoryList = this.categoryService.getForFront();
			return categoryList;
		}
		public void setCategoryList(List<Category> categoryList) {
			this.categoryList = categoryList;
		}
		public ICategoryService getCategoryService() {
			return categoryService;
		}
		public void setCategoryService(ICategoryService categoryService) {
			this.categoryService = categoryService;
		}
		
		public static void main(String[] args) {
			int n=5,b=0;
			int[] s = new int[5];
			int flag=-1;
			s[0]=100;
			s[1]=6;
			s[2]=3;
			s[3]=3;
			s[4]=1;
		    for(int k=0;k<n;k++)  
		    {      
		        for(int i=0;i<n-1;i++)  
		        {  
		        	if(flag==k) break;
		            for(int j=i+1;j<n;j++)  
		            {   
		                if(s[i]+s[j]==s[k]){
		                	flag=k;
		                	b++;
		                	break;
		                }
		            }  
		        }  
		    }  
		    System.out.println(b); 
		} 
		
}
