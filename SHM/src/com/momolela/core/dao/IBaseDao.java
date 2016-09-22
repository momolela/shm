package com.momolela.core.dao;

import java.io.Serializable;
import java.util.List;


/**
 * 
 * @ClassName: IBaseDao
 * @Description: 
 * @author: momolela
 * @date 2016-6-19 下午1:24:21
 * @param <T>
 * @param <PK>
 */
public interface IBaseDao<T,PK extends Serializable> {

	/**
	 * 保存方法
	 * @param t
	 * @return
	 */
	public T save(T t); 
	
	/**
	 * 根据主键获取实体(get)
	 * @param id
	 * @return
	 */
	public T get(PK id) ;
	
	/**
	 * 根据主键获取实体(load)
	 * @param id
	 * @return
	 */
	public T load(PK id) ;
	
	/**
	 * 删除对象
	 * @param entity
	 */
	public void delete(T entity);
	
	/**
	 * 根据主键删除
	 * @param id
	 * @return
	 */
	public T deleteById(PK id);
	
	public T update(T entity);
	
	public T updateDefault(T entity);
	
	public List<T> find(String sql ,Object...args);
	
}
