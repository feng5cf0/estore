package com.estore.dao;

import java.util.List;
import java.util.Map;

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
	
}
