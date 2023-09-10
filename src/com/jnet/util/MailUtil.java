package com.jnet.util;

import javax.mail.Authenticator;

public class MailUtil extends Authenticator  {
	 private String id;
	 private String pw;
	 
	 public MailUtil(String id, String pw) {
	  this.id = id;
	  this.pw = pw;
	 }
	 
	 protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
	  return new javax.mail.PasswordAuthentication(id, pw);
	 }
}
