package com.momolela.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 
 * 超级管理员
 * Admin
 * 创建人:momolela
 * 时间：2016年09月07日 22:15:59 
 * @version 1.0.0
 *
 */
@Entity
@Table(name = "shm_admin")
public class Admin implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer id;
	private String account;
	private String passWord;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name="account")
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	@Column(name="password")
	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
}