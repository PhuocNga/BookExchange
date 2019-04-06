package com.bookexchange.model;

import java.io.Serializable;
import java.util.Map;

public class UserJsonEntity implements Serializable {
	boolean isError;
	Map<String, String> errorMap;

	public UserJsonEntity(boolean isError, Map<String, String> errorMap) {
		super();
		this.isError = isError;
		this.errorMap = errorMap;
	}

	public UserJsonEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public boolean isError() {
		return isError;
	}

	public void setError(boolean isError) {
		this.isError = isError;
	}

	public Map<String, String> getErrorMap() {
		return errorMap;
	}

	public void setErrorMap(Map<String, String> errorMap) {
		this.errorMap = errorMap;
	}

}
