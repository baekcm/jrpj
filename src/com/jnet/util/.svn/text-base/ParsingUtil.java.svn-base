package com.jnet.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.ui.Model;

public class ParsingUtil {
	/**
	 * json Object 변환
	 * @param response response
	 * @param jsonObj jsonObj
	 * @throws IOException 
	 */
	public static void getjsonObj(HttpServletResponse response ,JSONObject jsonObj) throws IOException{
		response.setContentType("text/plain; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.print(jsonObj);
		pw.flush();
		pw.close();
	}
	
	/**
	 * 공통 예외처리 메서드 (EXCEPTION 메시지 파싱메서드)
	 * @param e e
	 * @param flag flag
	 * @return String String
	 */
	public static String printStackTraceToString(Throwable e,String flag) { 
        StringBuffer sb = new StringBuffer();
        String returnStr = "";
            sb.append(e.toString()); 
            if(flag.equals("html")) {
            	sb.append("<br/>");
            } else {
            	sb.append("\n");	
            }
            StackTraceElement element[] = e.getStackTrace();
            for (int idx = 0; idx < element.length; idx++) {
            	if(flag.equals("html")) {
            	} else {
            		sb.append("\tat ");	
            	}
            	String txt = element[idx].toString();
                sb.append(txt);
                if(flag.equals("html")) {
                	sb.append("<br/>");
                } else {
                	sb.append("\n");	
                }
            }
            returnStr = sb.toString();
            if(flag.equals("html")) {
            	returnStr.replaceAll("###", "<br/>");
            } else {
            	returnStr.replaceAll("###", "");
            }
        return returnStr; 
    } 
	
	/**
	 * 공통 예외처리 메서드
	 * @param log log
	 * @param model model
	 * @param e e
	 * @return String String
	 */
	public static String commonException(Logger log,Model model, Exception e) {
		log.error("============ EXCEPTION ============");
		log.error(ParsingUtil.printStackTraceToString(e,"log"));
		model.addAttribute("title",e.getMessage());
		model.addAttribute("msg",ParsingUtil.printStackTraceToString(e,"html"));
		return "error";
	}
	
	/**
	 * 공통 예외처리 메서드 (AJAX)
	 * @param log log
	 * @param model model
	 * @param e e
	 * @return String String
	 * @throws IOException 
	 */
	public static void commonAjaxException(HttpServletResponse response, Logger log,JSONObject obj, Exception e) throws IOException {
		log.error("============ EXCEPTION ============");
		log.error(ParsingUtil.printStackTraceToString(e,"log"));
		obj = new JSONObject();
		obj.put("msg", e.toString());
		obj.put("titleMsg",e.getMessage());
		obj.put("exceptMsg",ParsingUtil.printStackTraceToString(e,"html"));
		ParsingUtil.getjsonObj(response, obj);
	}
	
	public static String ShaParse(String data) throws Exception {
		StringBuffer sb = new StringBuffer();
		MessageDigest messageDigest = MessageDigest.getInstance("SHA1");
		messageDigest.update(data.getBytes("UTF-8"));
		byte[] digestBytes = messageDigest.digest();

		String hex = null;
		for (int i = 0; i < digestBytes.length; i++) {
			hex = Integer.toHexString(0xFF & digestBytes[i]);
			if (hex.length() < 2)
				sb.append("0");
			sb.append(hex);
		}
		return new String(sb);
	}
	
	public static String getRequestParams(HttpServletRequest request) {
		StringBuilder sb = new StringBuilder(512); 
		Enumeration<String> enums = request.getParameterNames();
		while(enums.hasMoreElements()) {
			String key = enums.nextElement();
			if(request.getParameterValues(key) !=null) {
				String paramValues[] = request.getParameterValues(key);
				for(int i = 0; i < paramValues.length; i ++) {
					sb.append(key).append("=").append(paramValues[i]).append("&");
				}
			} else {
				sb.append(key).append("=").append(request.getParameter(key)).append("&");
			}
		}
		
		return sb.toString();
	}
}
