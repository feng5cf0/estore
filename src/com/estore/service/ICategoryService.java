package com.estore.service;

import java.util.List;

import com.estore.entities.Category;
import com.landicorp.core.service.base.IBaseService;
import com.landicorp.core.web.pager.Pager;

public interface ICategoryService extends IBaseService<Category, Integer> {
	public List<Category> getForTree();
	public List<Category> getAll(Category category,Pager pager);
	public List<Category> getByParentId(Integer parentId,Pager pager);
	
	public List<Category> getForFront();
	
	/**
	 * 通过类别id加载类别国际化信息
	 * @param categoryId
	 * @return
	 */
	public List<Category> getLocaleById(Integer categoryId,Integer localeType);
	public void addLocale(Category category);
}
