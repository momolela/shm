package com.momolela.service;

import com.momolela.model.Admin;

public interface IAdminService {

	public Admin findAdmin(String account, String password);
}
