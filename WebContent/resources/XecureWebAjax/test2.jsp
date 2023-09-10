<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%

XecureServlet xservlet = null;
try {
	xservlet = new XecureServlet(request, response);
}catch(Exception e) {
	out.println("error");
	return;
}

String id = xservlet.request.getParameter("id");
String pwd = xservlet.request.getParameter("pwd");

System.out.println("-----------------------------------");
System.out.println("id = [" + id + "], pwd = [" + pwd + "]");
System.out.println("-----------------------------------");

%>
