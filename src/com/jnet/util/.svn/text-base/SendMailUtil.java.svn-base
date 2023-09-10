package com.jnet.util;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import com.jnet.domain.Member;


public class SendMailUtil  {
	public static void sendMail(Member memberParam) throws UnsupportedEncodingException, MessagingException{
		 //프로퍼티 값 인스턴스 생성과 기본세션(SMTP 서버 호스트 지정)
	      Properties props = new Properties();
	      // SMTP 사용시
	      String host = "localhost";
	      String port = "25";
	      String sendNm = "종로관리자";
	      String sendMail = "jongroweb@ijongno.co.kr";
	      String userId = "jongroweb";
	      String userPwd = "whdfhtkrhk";
	      
	      props.put("mail.transport.protocol","smtp");
	      props.put("mail.smtp.host", host);
	      props.put("mail.smtp.port",port);
	      props.put("mail.smtp.starttls.enable","true");
	      props.put("mail.smtp.ssl.trust",host);
	      props.put("mail.smtp.auth","true");
	      //아이디 , 패스워드 권한 설정
	      MailUtil auth = new MailUtil(userId,userPwd);  
	      Session mailSession = Session.getInstance(props,auth);
	      Message msg = new MimeMessage(mailSession);
	      msg.setFrom(new InternetAddress(sendMail, MimeUtility.encodeText(sendNm,"UTF-8","B"))); //보내는 사람 설정
	      
	      InternetAddress[] addressTo = null;
	      if(memberParam.getMemEmailArr()!= null && memberParam.getMemEmailArr().length > 0){
	    	  addressTo = new InternetAddress[memberParam.getMemEmailArr().length];
  	      for (int i = 0; i < memberParam.getMemEmailArr().length; i++){
  	          addressTo[i] = new InternetAddress(memberParam.getMemEmailArr()[i]);
  	      }
	      }
	      msg.setRecipients(RecipientType.TO, addressTo); 
	      //제목설정
	      msg.setSubject(memberParam.getEmailTitle()); 
	      //보내는 날짜 설정
	      msg.setSentDate(new java.util.Date()); 
	      //내용 설정(MIME 지정-HTML 형식)
	      msg.setContent(memberParam.getEmailContent(),"text/html; charset=UTF-8"); 
	      //메일 보내기
	      Transport.send(msg);
	}
}
