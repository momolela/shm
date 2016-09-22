package com.momolela.dao;

import com.momolela.model.Admin;

public interface IAdminDao {
	public Admin findAdmin(String account, String password);
}
