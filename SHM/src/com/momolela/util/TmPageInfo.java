package com.momolela.util;

import java.io.Serializable;

/**
 * 
 * 分页类
 * TmPageInfo
 * 创建人:xuchengfei 
 * 时间：2015年4月3日-下午7:04:18 
 * @version 1.0.0
 *
 */
public class TmPageInfo implements Serializable {
	private static final long serialVersionUID = 1L;
	public static final String DEFAULT_PAGE_SIZE = "10";//默认每页多少条记
	public static final String DEFAULT_LIST_OFFSET = "0";//默认从第几条记录
	
    private String firstResult = "0"; //分页从第几条记录
    private String maxResults = DEFAULT_PAGE_SIZE; 
    private String pageNo = "0"; //当前
	private String offset;
	private String pageSize;
	private String totalPage;
	private String totalCount;

	public String getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}

	private transient String itemCount = "0"; //总记录数

	public String getFirstResult() {
		return firstResult;
	}

	public void setFirstResult(String firstResult) {
		this.firstResult = firstResult;
	}

	public String getItemCount() {
		return itemCount;
	}

	public void setItemCount(String itemCount) {
		this.itemCount = itemCount;
	}

	public String getMaxResults() {
		return maxResults;
	}

	public void setMaxResults(String maxResults) {
		this.maxResults = maxResults;
	}

	public String getPageNo() {
		return pageNo;
	}

	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}
	
	public String getOffset() {
		return offset;
	}

	public void setOffset(String offset) {
		this.offset = offset;
	}

	public String getPageSize() {
		this.pageSize = getMaxResults();
		return this.pageSize;
	}
	
	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}
	
	public String getTotalPage() {
		int totalRecoreds = Integer.parseInt(itemCount);
		int pz = Integer.parseInt(maxResults);
		int psize = totalRecoreds / pz;
		if(totalRecoreds % pz !=0){
			psize = psize+1;
		}
		if(psize<=1){psize=1;}
		this.totalPage = String.valueOf(psize); 
		return this.totalPage;
	}

	
	public void setTotalPage(String totalPage) {
		this.totalPage = totalPage;
	}
}
