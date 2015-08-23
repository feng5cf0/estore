package com.estore.email;

import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;


/**
 * 邮件发送器
 * @author hwt
 */
public class MailSender  {
	private static final Logger log = Logger.getLogger(MailSender.class);
	
	/** 
	  * 以文本格式发送邮件 
	  * @param mailInfo 待发送的邮件的信息 
	  */ 
	public static JSONObject sendTextMail(Mail mailInfo) {
	  JSONObject result = new JSONObject();
	  // 判断是否需要身份认证 
	  MyAuthenticator authenticator = null; 
	  Properties pro = mailInfo.getProperties();
	  if (mailInfo.isValidate()) { 
	  // 如果需要身份认证，则创建一个密码验证器 
		authenticator = new MyAuthenticator(mailInfo.getUserName(), mailInfo.getPassword()); 
	  }
	  // 根据邮件会话属性和密码验证器构造一个发送邮件的session 
	  Session sendMailSession = Session.getDefaultInstance(pro,authenticator); 
	  try { 
	  // 根据session创建一个邮件消息 
	  Message mailMessage = new MimeMessage(sendMailSession); 
	  // 创建邮件发送者地址 
	  Address from = new InternetAddress(mailInfo.getFromAddress()); 
	  // 设置邮件消息的发送者 
	  mailMessage.setFrom(from); 
	  // 创建邮件的接收者地址，并设置到邮件消息中 
	  Address to = new InternetAddress(mailInfo.getToAddress()); 
	  // Message.RecipientType.TO属性表示接收者的类型为TO
	  mailMessage.setRecipient(Message.RecipientType.TO,to); 
	  // 设置邮件消息的主题 
	  mailMessage.setSubject(mailInfo.getSubject()); 
	  // 设置邮件消息发送的时间 
	  mailMessage.setSentDate(new Date()); 
	  // 设置邮件消息的主要内容 
	  String mailContent = mailInfo.getContent(); 
	  mailMessage.setText(mailContent); 
	  // 发送邮件 
	  Transport.send(mailMessage);
	  result.put("success", true);
	  result.put("note", "发送成功");
	  } catch (MessagingException ex) {
		  log.error("邮件发送失败："+ex.getMessage());
		  ex.printStackTrace(); 
		  result.put("success", false);
		  result.put("note", ex.getMessage());
	  } 
	  return result; 
	} 
	
	/** 
	  * 以HTML格式发送邮件 
	  * @param mailInfo 待发送的邮件信息 
	  */ 
	public static JSONObject sendHtmlMail(Mail mailInfo){
	  JSONObject result = new JSONObject();
	  // 判断是否需要身份认证 
	  MyAuthenticator authenticator = null;
	  Properties pro = mailInfo.getProperties();
	  //如果需要身份认证，则创建一个密码验证器  
	  if (mailInfo.isValidate()) { 
		authenticator = new MyAuthenticator(mailInfo.getUserName(), mailInfo.getPassword());
	  } 
	  // 根据邮件会话属性和密码验证器构造一个发送邮件的session 
	  Session sendMailSession = Session.getDefaultInstance(pro,authenticator); 
	  try { 
	  // 根据session创建一个邮件消息 
	  Message mailMessage = new MimeMessage(sendMailSession); 
	  // 创建邮件发送者地址 
	  Address from = new InternetAddress(mailInfo.getFromAddress()); 
	  // 设置邮件消息的发送者 
	  mailMessage.setFrom(from); 
	  // 创建邮件的接收者地址，并设置到邮件消息中 
	  Address to = new InternetAddress(mailInfo.getToAddress()); 
	  // Message.RecipientType.TO属性表示接收者的类型为TO 
	  mailMessage.setRecipient(Message.RecipientType.TO,to); 
	  // 设置邮件消息的主题 
	  mailMessage.setSubject(mailInfo.getSubject()); 
	  // 设置邮件消息发送的时间 
	  mailMessage.setSentDate(new Date()); 
	  // MiniMultipart类是一个容器类，包含MimeBodyPart类型的对象 
	  Multipart mainPart = new MimeMultipart(); 
	  // 创建一个包含HTML内容的MimeBodyPart 
	  BodyPart html = new MimeBodyPart(); 
	  // 设置HTML内容 
	  html.setContent(mailInfo.getContent(), "text/html; charset=utf-8"); 
	  mainPart.addBodyPart(html); 
	  // 将MiniMultipart对象设置为邮件内容 
	  mailMessage.setContent(mainPart); 
	  // 发送邮件 
	  Transport.send(mailMessage); 
	  result.put("success", true);
	  result.put("note", "发送成功");
	  } catch (MessagingException ex) {
		  log.error("邮件发送失败："+ex.getMessage());
		  ex.printStackTrace(); 
		  result.put("success", false);
		  result.put("note", ex.getMessage());
	  } 
	  return result; 
	} 
	
	public static void main(String[] args){
		Mail mailInfo = new Mail();    
	    mailInfo.setMailServerHost("smtp.sina.com");    
	    mailInfo.setMailServerPort("25");    
	    mailInfo.setValidate(true);    
	    mailInfo.setUserName("apex_test@sina.com");    
	    mailInfo.setPassword("apex_test");
	    mailInfo.setFromAddress("apex_test@sina.com");    
	    mailInfo.setToAddress("574591725@qq.com");    
	    mailInfo.setSubject("测试发送");    
	    mailInfo.setContent("<a href='http://www.baidu.com'>百度</a>");  
	    MailSender.sendHtmlMail(mailInfo);
	}
} 

