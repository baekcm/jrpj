package com.jnet.domain;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;


public class Log {
	private String logId;
	private String logUrl;
	private String logIp;
	private String logYmd;
	private String logHms;
	
	public String getLogId() {
		return logId;
	}



	public void setLogId(String logId) {
		this.logId = logId;
	}



	public String getLogUrl() {
		return logUrl;
	}



	public void setLogUrl(String logUrl) {
		this.logUrl = logUrl;
	}



	public String getLogIp() {
		return logIp;
	}



	public void setLogIp(String logIp) {
		this.logIp = logIp;
	}



	public String getLogYmd() {
		return logYmd;
	}



	public void setLogYmd(String logYmd) {
		this.logYmd = logYmd;
	}



	public String getLogHms() {
		return logHms;
	}



	public void setLogHms(String logHms) {
		this.logHms = logHms;
	}



	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
}
