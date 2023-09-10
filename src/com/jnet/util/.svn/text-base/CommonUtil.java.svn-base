package com.jnet.util;

import java.io.FileInputStream;
import java.math.BigDecimal;
import java.net.URL;
import java.util.Hashtable;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public class CommonUtil {
	
	private static final String COMM_PROP_PATH = "config.properties";
	
		
	public static String tagOff(String s) {
        if(isEmpty(s)) return "";
        StringBuffer stringbuffer = new StringBuffer();
        char ac[] = s.toCharArray();
        int i = ac.length;
        for(int j = 0; j < i; j++)
            if(ac[j] == '&')
                stringbuffer.append("&amp;");
            else
            if(ac[j] == '<')
                stringbuffer.append("&lt;");
            else
            if(ac[j] == '>')
                stringbuffer.append("&gt;");
            else
            if(ac[j] == '"')
                stringbuffer.append("&quot;");
            else
            if(ac[j] == '\'')
                stringbuffer.append("&#039;");
            else
                stringbuffer.append(ac[j]);

        return stringbuffer.toString();
    }


    public static String retagOff(String s) {
    	String res	=	"";
    	
    	if( (s != null) && (!"null".equals(s)) ){
    		res	=	s;
    		
    		res	=	res.replaceAll("&amp;", "&");
    		res	=	res.replaceAll("&gt;", ">");
    		res	=	res.replaceAll("&lt;", "<");
    		res	=	res.replaceAll("&#39;", "'");
    		res	=	res.replaceAll("&quot;", "\"");
    	}
        return res;
    }
    
	public static boolean isEmpty(String data) {
	    return data == null || data.trim().length() == 0;
	}

	//문자열 객체를 받아 널여부 체크 후 리턴한다.	
	public static String checkNull(String inStr) {
		return CommonUtil.checkNull(inStr, "");
	}

	public static String checkNull(String inStr, String defStr) {
		String outStr = "";
		if(inStr !=null && inStr.length() > 0) {
			outStr = inStr.trim();
		} else {
			outStr = defStr;
		}
		
		return outStr;
	}

	//System 프로퍼티값을 가져온다
	public static String getSystemProperties(String propKey) {
		return checkNull(System.getProperty(propKey));
	}

	//클라이언트 IP주소를 가져온다
	public static String getRemoteAddr(HttpServletRequest request) {
		String remote_ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		if (remote_ip == null) remote_ip = request.getRemoteAddr();
		
		return checkNull(remote_ip);
	}


	/**
	 * 개요 : 입력받은 문자열을 지정된 자리수 만큼 특정 문자열을 왼쪽에 채운다.
	 * 입력값 : left padding처리 할 문자열
	 * 출력값 : left padding처리된 문자열
	 */
	public static String leftPad(String str, int len, char pad) {
		String result = str;
		int templen = len - result.length();
	
		if (templen <= 0)
			return result;
	
		for (int i = 0; i < templen; i++)
			result = pad + result;
	
		return checkNull(result);
	}


	/**
	 * 개요 : 입력받은 double형의 숫자를 자리수를 정하여 버림하여 반환한다.
	 * 입력값 : double형의 문자열( inDbl : 입력문자열, roundIdx : 버림 할 자릿 수)
	 * 출력값 : double형의 문자열
	 */
	public static int getDownForNumber(double inDbl, int roundIdx) {
	
		BigDecimal bD0 = new BigDecimal(inDbl);
		String strDbl = bD0.setScale(roundIdx, java.math.BigDecimal.ROUND_DOWN) + "";
		return Integer.parseInt(checkNull(strDbl, "0"));
	}


	/**
	 * 개요 : 입력받은 double형의 숫자를 자리수를 정하여 올림하여 반환한다.
	 * 입력값 : double형의 문자열( inDbl : 입력문자열, roundIdx : 올림 할 자릿 수)
	 * 출력값 : 반올림 된 double형의 문자열
	 */
	public static int getUpForNumber(double inDbl, int roundIdx) {
	
		BigDecimal bD0 = new BigDecimal(inDbl);
		String strDbl = bD0.setScale(roundIdx, java.math.BigDecimal.ROUND_UP) + "";
		return Integer.parseInt(checkNull(strDbl, "0"));
	}


	//upid를 입력받아 시설명을 가져온다
	public static String getLocationDesc(String upId) {
		Hashtable<String, String> ht = new Hashtable<String, String>();
		ht.put("00", "종로시설관리공단");
		ht.put("11", "올림픽기념국민생활관");
		ht.put("21", "종로구민회관");
		ht.put("31", "동부문화여성센터");
		ht.put("32", "청소년문화센터");
		ht.put("33", "삼청테니스장");
		ht.put("41", "종로문화체육센터");
		
		return checkNull(ht.get(upId));
	}
	
	//properties key를받아 프로퍼티 값을 가져온다. 
	public static String getProperties(String propKey) {
		return getProperties(COMM_PROP_PATH, propKey);		
	}
	
	public static String getProperties(String propFile, String propKey) {
		Properties prop = new Properties();
		ClassLoader cl = null;
		URL url = null;
		FileInputStream fis = null;
		String propVal = "";
		try {
			cl = Thread.currentThread().getContextClassLoader();
			
			if (cl == null)
				cl = ClassLoader.getSystemClassLoader();
			url = cl.getResource("");
			
			fis = new FileInputStream(url.getPath() + propFile);
			prop.load(new java.io.BufferedInputStream(fis));
			propVal = prop.getProperty(propKey);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fis != null) {
				try {
					fis.close();
				} catch (Exception e) {
				}
				fis = null;
			}
		} //try catch finally end
	
		return checkNull(propVal);
	} //method end
	
	
	//서버의 주소를 가져와 추가 경로를 붙여 최종 경로 가져오는 메소드
	public static String getPath(HttpServletRequest request, String addPath) {
	    String path = "";
	    String url = request.getRequestURL().toString();
	    String uri = request.getRequestURI();
	    
	    path = url.replaceAll(uri, "") + addPath;
	    
	    return checkNull(path);
	}
	
	//실제 물리적인 경로를 가져온다
	public static String getRealRootPath(HttpServletRequest request) {
	    HttpSession session = request.getSession();
        String realRootPath = session.getServletContext().getRealPath("/");
        
        return checkNull(realRootPath);
	}
	
	/**
	 * 각사업장별로 스타일을 입힌다.
	 * @param model
	 * @param upId
	 * @param style
	 */
	public static void styleBackGroundByUpId(Model model, String upId) {
		String defaultDir = "/resources/include/commonfile/image/common/";
		String img11 = "btn_mp_main11.gif", img21 = "btn_mp_main21.gif", img41 = "btn_mp_main41.gif";
		String img31 = "btn_mp_main31.gif", img32 = "btn_mp_main32.gif", img33 = "btn_mp_main33.gif";
		if( "11".equals(upId)) {
			img11 = "btn_mp_main11_over.gif";
		} else if( "21".equals(upId)) {
			img21 = "btn_mp_main21_over.gif";
		} else if( "41".equals(upId)) {
			img41 = "btn_mp_main41_over.gif";
		} else if( "31".equals(upId)) {
			img31 = "btn_mp_main31_over.gif";
		} else if( "32".equals(upId)) {
			img32 = "btn_mp_main32_over.gif";
		} else if( "33".equals(upId)) {
			img33 = "btn_mp_main33_over.gif";
		}
		model.addAttribute("img11", defaultDir + img11);
		model.addAttribute("img21", defaultDir + img21);
		model.addAttribute("img41", defaultDir + img41);
		model.addAttribute("img31", defaultDir + img31);
		model.addAttribute("img32", defaultDir + img32);
		model.addAttribute("img33", defaultDir + img33);
	}
	
	/*
	public static void main(String args[]) {
		//saleAmount = CommonUtil.getDownForNumber(((Double.parseDouble(payPrice+"") / 1.1) / 10) * 10, 0);
		//vatAmount = payPrice - saleAmount;
		int payPrice = 55000;
		int saleAmount = ((int)((Double.parseDouble(payPrice+"") / 1.1) / 10)) * 10;
		int vatPrice = payPrice - saleAmount;
		
		System.out.println("1111 : " + (Double.parseDouble(payPrice+"") / 1.1));
		System.out.println("2222 : " + (Double.parseDouble(payPrice+"") / 1.1) / 10);
		System.out.println("3333 : " + (int)((Double.parseDouble(payPrice+"") / 1.1) / 10));
		System.out.println("saleAmount : " + saleAmount);
		System.out.println("vatPrice : " + vatPrice);
		
	}
	*/
}
