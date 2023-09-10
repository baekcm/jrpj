<%@  page language="java" import="java.io.*, java.net.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%><%
URL url = new URL(request.getParameter("url"));

URLConnection connection = url.openConnection();
 
connection.setDoOutput(true);
connection.setRequestProperty("Content-Type","text/xml"); 

BufferedReader bufferedreader = new BufferedReader(new InputStreamReader(url.openStream(),"utf-8"));

String inputLine;

String buffer = "";

while ((inputLine = bufferedreader.readLine()) != null){
    buffer += inputLine.trim();
}

bufferedreader.close();
response.setHeader("Content-type","text/xml");
%><%=buffer%>