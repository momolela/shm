package com.momolela.core.service;

import java.io.Serializable;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.momolela.core.dao.IBaseDao;

/**
 * Service 基类
 */
public class BaseServiceImpl<T, PK extends Serializable> implements IBaseService<T, PK> {

	protected Logger log = LoggerFactory.getLogger(getClass());

	private IBaseDao<T, PK> baseDao;

	public IBaseDao<T, PK> getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(IBaseDao<T, PK> baseDao) {
		this.baseDao = baseDao;
	}

	public T save(T t) {
		return baseDao.save(t);
	}

	public T get(PK id) {
		return baseDao.get(id);
	}

	public T load(PK id) {
		return baseDao.load(id);
	}

	public void delete(T entity) {
		baseDao.delete(entity);
	}

	public T deleteById(PK id) {
		return baseDao.deleteById(id);
	}

	public T update(T entity) {
		return baseDao.update(entity);
	}

	public T updateDefault(T entity) {
		return baseDao.updateDefault(entity);
	}

	public List<T> find(String sql, Object... args) {
		return baseDao.find(sql, args);
	}
}
