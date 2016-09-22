package com.momolela.core.action;

public class BaseAction {

	public static final String AJAX_SUCCESS = "ajaxSuccess";
	public static final String LIST = "list";
	public static final String ADD = "add";
	public static final String EDIT = "edit";
	public static final String DELETE = "delete";
	public static final String SUCCESS = "success";
	public static final String FAIL = "fail";
	public static final String ERROR = "error";
	
	protected String result;
	protected String message;

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
