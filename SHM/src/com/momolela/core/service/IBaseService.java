package com.momolela.core.service;

import java.io.Serializable;
import java.util.List;


/**
 * 
 * @ClassName: IBaseService
 * @Description: 
 * @author: momolela
 * @date 2016-6-19 下午2:18:38
 * @param <T>
 * @param <PK>
 */
public interface IBaseService<T,PK extends Serializable> {

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
	 * 根据对象删除
	 * @param entity
	 */
	public void delete(T entity);
	
	/**
	 * 根据主键删除实体
	 * @param id
	 * @return
	 */
	public T deleteById(PK id); 
	
	public T update(T entity);
	
	public T updateDefault(T entity);
	
	public List<T> find(String sql ,Object...args);
	
}
