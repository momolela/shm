/**   
 * @Title: Banner.java  
 * @Package com.momolela.model  
 * @Description: TODO  
 * @author momolela   
 * @date 2016-6-14 上午8:49:34  
 * @version V1.0   
 */
package com.momolela.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @ClassName: Banner  
 * @Description:   
 * @author: momolela
 * @date 2016-6-14 上午8:49:34  
 */
@Entity
@Table(name="hfy_banner")
public class Banner {

	private Integer id;
	private String btitle;
	private String bcontent;
	private String burl;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name="btitle")
	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	@Column(name="bcontent")
	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	@Column(name="burl")
	public String getBurl() {
		return burl;
	}

	public void setBurl(String burl) {
		this.burl = burl;
	}
}
