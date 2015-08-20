package com.estore.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.estore.entities.Category;
import com.landicorp.core.dao.base.IMyBatisDao;

public interface ICategoryDao extends IMyBatisDao<Category, Integer> {
	
	public List<Category> getForTree();
	public List<Category> getAll(Map<String,Object> map);
	public List<Category> getAllCategory();
	public Integer getAllCount(Category category);
	public List<Category> getByParentId(Map<String,Object> map);
	public Integer getByParentIdCount(Integer parentId);
	public List<Category> getForFront();
	
	public List<Category> getByPId(Integer id);
	public List<Category> getLocaleById(Map<String,Object> map);
	public void savaLocale(Category category);
	public List<Category> getByCategoryId(Map<String, Object> map);
	public List<Category> getByCategoryCode(@Param(value="categoryCode") String categoryCode);
}
