package com.jnet.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

public class DateUtil {

	/**
	 * 개요 : 현재 날짜 가져오기
	 * 입력값 : N/A
	 * 출력값 : String 변환 날자
	 */
	public static String getCurrentDate() {
		SimpleDateFormat sdf = null;
		sdf = new SimpleDateFormat("yyyyMMdd", Locale.getDefault());
		Date currentDate = new Date();
		return sdf.format(currentDate);
	}

	/**
	 * 개요 : 현재 시간 가져오기
	 * 입력값 : N/A
	 * 출력값 : String 변환 시간 : 시분초
	 */
	public static String getCurrentTime() {
		SimpleDateFormat sdf = null;
		sdf = new SimpleDateFormat("HHmmss", Locale.getDefault());
		Date currentDate = new Date();
		return sdf.format(currentDate);
	}

	/**
	 * 개요 : 현재 시간 가져오기
	 * 입력값 : N/A
	 * 출력값 : String 변환 시간 : 시분초
	 */
	public static String getCurrentMinTime() {
		SimpleDateFormat sdf = null;
		sdf = new SimpleDateFormat("HHmm", Locale.getDefault());
		Date currentDate = new Date();
		return sdf.format(currentDate);
	}

	/**
	 * 개요 : 현재 날짜시간 가져오기
	 * 입력값 : N/A
	 * 출력값 : String 변환 날자 : 시간 포함
	 */
	public static String getCurrentDateTime() {
		SimpleDateFormat sdf = null;
		sdf = new SimpleDateFormat("yyyyMMddHHmmss", Locale.getDefault());
		Date currentDate = new Date();
		return sdf.format(currentDate);
	}

	/**
	 * 개요 : 현재연도를 가져온다
	 * 입력값 : N/A
	 * 출력값 : int 현재연도
	 */
	public static int getCurrentYear() {
		Calendar today = Calendar.getInstance();
		return today.get(Calendar.YEAR);
	}

	/**
	 * 개요 : 현재달을 가져온다.
	 * 입력값 : N/A
	 * 출력값 : int 현재연도
	 */
	public static int getCurrentMonth() {
		Calendar today = Calendar.getInstance();
		return today.get(Calendar.MONTH) + 1;
	}

	/**
	 * 개요 : 현재일자를 가져온다.
	 * 입력값 : N/A
	 * 출력값 : int 현재일자
	 */
	public static int getCurrentDay() {
		Calendar today = Calendar.getInstance();
		return today.get(Calendar.DAY_OF_MONTH);
	}

	/**
	 * 개요 : 현재연도를 가져온다.
	 * 입력값 : N/A
	 * 출력값 : String 현재연도
	 */
	public static String getStrCurrentYear() {
		Calendar today = Calendar.getInstance();
		return today.get(Calendar.YEAR) + "";
	}

	/**
	 * 개요 : 현재달을 가져온다
	 * 입력값 : N/A
	 * 출력값 : String 현재달
	 */
	public static String getStrCurrentMonth() {
		Calendar today = Calendar.getInstance();

		int nMonth = today.get(Calendar.MONTH) + 1;
		return (nMonth < 10) ? "0" + nMonth : nMonth + "";
	}
	
	/**
	 * 현재월 기준 다음달 가져오기
	 * @return
	 */
	public static String getStrNextMonth(String format) {
		Calendar today = Calendar.getInstance();
		today.add(Calendar.MONTH, 1);
		Date date = today.getTime();
		SimpleDateFormat sdf = new SimpleDateFormat(format, Locale.getDefault());
		
		return sdf.format(date);
	}

	/**
	 * 개요 : 현재일자를 가져온다.
	 * 입력값 : N/A
	 * 출력값 : String 현재일자
	 */
	public static String getStrCurrentDay() {
		Calendar today = Calendar.getInstance();
		int nDay = today.get(Calendar.DAY_OF_MONTH);
		return (nDay < 10) ? "0" + nDay : nDay + "";
	}

	/**
	 * 개요 : 현재 월의 처음 일자를 구하는 메소드
	 * 입력값 : N/A
	 * 출력값 : int 현재일
	 */
	public static String getStartDate() {
		Calendar today = Calendar.getInstance();

		int intYear = today.get(Calendar.YEAR);
		int intMonth = today.get(Calendar.MONTH) + 1;

		String strYear = Integer.toString(intYear);
		String strMonth = (intMonth < 10) ? "0" + Integer.toString(intMonth) : Integer.toString(intMonth);
		return strYear + strMonth + "01";
	}

	/**
	 * 개요 : 현재 월의 마지막 일자를 구하는 메소드
	 * 입력값 : N/A
	 * 출력값 : String 마지막일자
	 */
	public static String getEndDate() {
		Calendar today = Calendar.getInstance();

		int intYear = today.get(Calendar.YEAR);
		int intMonth = today.get(Calendar.MONTH) + 1;
		int intDay = today.getActualMaximum(Calendar.DAY_OF_MONTH);

		String strYear = Integer.toString(intYear);
		String strMonth = (intMonth < 10) ? "0" + Integer.toString(intMonth) : Integer.toString(intMonth);
		String strDay = Integer.toString(intDay);
		return strYear + strMonth + strDay;
	}

	/**
	 * 개요 : 년중일자 가져오기
	 * 입력값 : N/A
	 * 출력값 : 연중의 일자 수
	 */
	public static int getDayOfYear() {
		Calendar today = Calendar.getInstance();
		return today.get(Calendar.DAY_OF_YEAR);
	}

	/**
	 * 개요 : 년, 월 값을 가지고 그 월의 최대 일수를 반환
	 * 입력 : 년, 월
	 * 출력 : 입력된 년 월의 최대 일수
	 */
	public static int getLastDay(String year, String month) {
		Calendar cal = Calendar.getInstance();
		cal.set(Integer.parseInt(year), Integer.parseInt(month) - 1, 1);
		//월 최대일 값을 설정
		return cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	}

	/**
	 * 개요 : 현재날짜를 타입에 따라 가져온다.(형식은 정해진 룰 안에 마음대로)
	 * 입력값 : String Type : 날짜형식 타입 "yyyyMMdd", "yyyy-MM-dd", "HH", 등등
	 * 출력값 : String Type 형식에 따른 날짜 String Value
	 */
	public static String getCurrentDateTime(String Type) {
		SimpleDateFormat sdf = new SimpleDateFormat(Type, Locale.getDefault());
		java.util.Date currentDate = new java.util.Date();
		return sdf.format(currentDate);
	}

	/**
	 * 해당연도의 특정달의 마지막 날짜를 구한다.
	 * 입력값 :
	 * 1. int intYear 해당연도
	 * 2. int intMonth 특정달.
	 * 출력 : 입력된 년월의 마지막 날짜를 넘겨준다.
	 */
	public static int getMonthLastDate(int intYear, int intMonth) {
		switch (intMonth) {
		case 1:
		case 3:
		case 5:
		case 7:
		case 8:
		case 10:
		case 12:
			return (31);
		case 4:
		case 6:
		case 9:
		case 11:
			return (30);
		default:
			if (((intYear % 4 == 0) && (intYear % 100 != 0)) || (intYear % 400 == 0)) {
				return (29);
			} else {
				return (28);
			}
		}
	}

	/**
	 * 현재 날자 가져오기
	 * 입력값 : 날짜 형태 타입
	 * 출력 : String 날짜
	 */
	public static String getCurrentDateFormat(int DATE_FORMAT) {
		SimpleDateFormat sdf = null;
		Date currentDate = new Date();

		if (DATE_FORMAT == 1) {
			sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.getDefault());
		} else if (DATE_FORMAT == 2) {
			sdf = new SimpleDateFormat("yyyy.MM.dd", Locale.getDefault());
		} else if (DATE_FORMAT == 3) {
			sdf = new SimpleDateFormat("yyyy/MM/dd", Locale.getDefault());
		} else if (DATE_FORMAT == 4) {
			sdf = new SimpleDateFormat("yyyyMMdd", Locale.getDefault());
		} else if (DATE_FORMAT == 5) {
			currentDate = new Date();
			sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss", Locale.getDefault());
		} else if (DATE_FORMAT == 6) {
			currentDate = new Date();
			sdf = new SimpleDateFormat("yyyyMMddHHmm", Locale.getDefault());
		}

		return sdf.format(currentDate);
	}

	/**
	 * 입렵받은 날짜의 요일 가져오기(한국기준)
	 * 입력값 : YYYYMMDD형태의 날짜 문자열
	 * 출력 : 요일
	 */
	public static String getKoreanDayOfWeek(String inDate) {
		// 날짜로 요일가져오기 (년,월,일을 int로 바꾼다!)
		Calendar cal = new GregorianCalendar();
		String outStr = "";
		String[] dayOfWeek = { "일", "월", "화", "수", "목", "금", "토" };

		if (inDate.length() != 8)
			return "잘못된날짜입력값";

		int year = Integer.parseInt(inDate.substring(0, 4));
		int month = Integer.parseInt(inDate.substring(4, 6));
		int day = Integer.parseInt(inDate.substring(6, 8));

		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month - 1);
		cal.set(Calendar.DAY_OF_MONTH, day);
		outStr = dayOfWeek[cal.get(Calendar.DAY_OF_WEEK) - 1];

		return outStr;
	}

	/**
	 * 날짜가져오기
	 * 입력값 :1970.01.01,09:00 에서 경과된 초
	 * 출력 : String 날짜
	 */
	public static String getSaleTime(long stnd) {
		Date currentDate = new Date(stnd);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss", Locale.getDefault());

		return sdf.format(currentDate);
	}
	
	/**
	 * 날짜전환하기
	 * 입력값 :형식(1970-01-01,09:00:00) 에서 경과된 초
	 * 출력 : String 날짜
	 */
	public static String getConversTime(long stnd) {
		Date currentDate = new Date(stnd);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.getDefault());

		return sdf.format(currentDate);
	}

	public static String getConversTime(String dbDate){		
		long longTrimDate = Long.parseLong(dbDate.trim()+"000");
		Date currentDate = new Date(longTrimDate);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.getDefault());
		return sdf.format(currentDate);
	}

	/**
	 * 해당 연도가 윤년인지를 판단
	 * 입력값 : year 특정 연도
	 * 출력 : true, false
	 */
	public static boolean isLeapYear(int year) {
		if (year % 4 != 0)
			return false;
		if (year % 400 == 0)
			return true;
		return year % 100 != 0;
	}

	/**
	 * 특정 연도 특정 월의 총 일수를 얻을 수 있다.
	 * 입력값 : year 특정 연도, month 특정 월 (1 ~ 12)
	 * 출력값 : 특정 연도 월의 총 일수
	 */
	public static int dateCntOfYearMonth(int year, int month) {
		int kLastDates[] = { 0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
		if (month > 12 || month < 0)
			month = 0;

		if (month == 2 && isLeapYear(year))
			return kLastDates[month] + 1;

		return kLastDates[month];
	}

	/**
	 * 특정 연도의 총 일수를 얻을 수 있다.
	 * 입력값 : year 특정 연도
	 * 출력값 : 특정 연도의 총 일수
	 */
	public static int dateCntOfYear(int year) {
		int kLastDates[] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
		int dayCnt = 0;
		for (int i = 0; i < kLastDates.length; i++) {
			if (i == 1 && isLeapYear(year)) {
				dayCnt = dayCnt + kLastDates[i] + 1;
			} else {
				dayCnt += kLastDates[i];
			}
		}
		return dayCnt;
	}

	public static String getAddDateFromToday(int aDay) {
		return getAddDateFromToday(aDay, "yyyy-MM-dd");
	}

	public static String getAddDateFromToday(int aDay, String format) {

		if (format == null || format.equals("")) {
			format = "yyyyMMdd";
		}
		SimpleDateFormat simpleDate = new SimpleDateFormat(format, Locale.getDefault());
		Date today = new Date();
		today.setTime((new Date()).getTime() + (((long) 1000 * 60 * 60 * 24) * aDay));
		return simpleDate.format(today);
	}

	/**
	 * 특정일자에 aDay만큼 더한날을 반환한다.
	 * 입력값 : 특정일자(YYYYMMDD), 증가할 날짜 수, 반환 유형(SimpleDateFormat)
	 * 출력값 : 특정일자에 증가한 날짜
	 */
	public static String getAddDate(String inDt, int aDay, int type) {
		String addDate = "";
		inDt = inDt.trim();

		int yyyy = Integer.parseInt(inDt.substring(0, 4));
		int mm = Integer.parseInt(inDt.substring(4, 6));
		int dd = Integer.parseInt(inDt.substring(6, inDt.length())) + aDay;

		int[] month = monthYear(yyyy);
		while (true) {
			if (dd < 0 && month[mm - 1] >= (dd = Math.abs(dd)))
				break;
			if (month[mm - 1] >= dd)
				break;
			dd -= month[mm - 1];
			mm++;
			if (mm > 12) {
				yyyy++;
				month = monthYear(yyyy);
				mm = 1;
			}
		}

		StringBuffer sb = new StringBuffer("");
		sb.append(yyyy);
		sb.append(int2str(mm, 2));
		sb.append(int2str(dd, 2));

		addDate = getStrDateToString(sb.toString(), type);

		return addDate;
	}

	/**
	 * 특정일자에 aDay만큼 뺀날을 반환한다.
	 * 입력값 : 특정일자(YYYYMMDD), 뺀 날짜 수, 반환 유형(SimpleDateFormat)
	 * 출력값 : 특정일자에 뺀 날짜
	 */
	public static String getMinusDate(String inDt, int aDay, int type) {
		String minusDate = "";
		int yyyy = Integer.parseInt(inDt.substring(0, 4));
		int mm = Integer.parseInt(inDt.substring(4, 6));
		int dd = aDay - Integer.parseInt(inDt.substring(6, inDt.length()));

		int[] month = monthYear(yyyy);
		while (true) {
			if (dd < 0 && month[mm - 1] >= (dd = Math.abs(dd)))
				break;
			mm--;
			if (mm < 1) {
				yyyy--;
				month = monthYear(yyyy);
				mm = 12;
			}
			dd -= month[mm - 1];
		}

		StringBuffer sb = new StringBuffer("");
		sb.append(yyyy);
		sb.append(int2str(mm, 2));
		sb.append(int2str(dd, 2));

		minusDate = getStrDateToString(sb.toString(), type);

		return minusDate;
	}

	/**
	 * 윤년 등을 고려한 월(주의! - 2월)의 날짜수 반환
	 * 입력값 : 년도
	 * 출력값 : 해당 년, 월의 날짜수 반환
	 */
	public static int[] monthYear(int year) {
		int[] month = new int[12];
		int day = 0;
		int ymod4 = year % 4;
		int ymodh = year % 100;
		int ymodh4 = year % 400;

		if ((ymod4 != 0 && ymodh == 0) || (ymod4 != 0 && ymodh != 0 && ymodh4 != 0))
			day = 28;
		else
			day = 29;

		month[0] = 31;
		month[1] = day;
		/*
		 * --- 1999년 2월 29일로 계산된다. ----------------------- GregorianCalendar gc
		 * = new GregorianCalendar(); if( gc.isLeapYear( year ) ) day = 28; else
		 * day = 29; month[1] = day;
		 * --------------------------------------------------------
		 */

		month[2] = 31;
		month[3] = 30;
		month[4] = 31;
		month[5] = 30;
		month[6] = 31;
		month[7] = 31;
		month[8] = 30;
		month[9] = 31;
		month[10] = 30;
		month[11] = 31;

		return month;
	}

	/**
	 * 입력받은 스트링날짜 문자열을 Date형으로 변환 후 유형에 맞는 날짜 반환
	 * 입력값 : 특정날짜, 반환유형
	 * 출력값 : 날짜문자열
	 */
	public static String getStrDateToString(String inDate, int type) {
		if(inDate == null || inDate.equals("")){
			return "";
		}
		
		String outDate = "";
		Date convDate = null;
		SimpleDateFormat sdf = null;
		try {
			convDate = getStringToDate(inDate);
			
			if (type == 1){
				sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.getDefault());
			}else if (type == 2){
				sdf = new SimpleDateFormat("yyyy.MM.dd", Locale.getDefault());
			}else if (type == 3){
				sdf = new SimpleDateFormat("yyyy/MM/dd", Locale.getDefault());
			}else if (type == 4){
				sdf = new SimpleDateFormat("yyyyMMdd", Locale.getDefault());
			}else if (type == 5){
				sdf = new SimpleDateFormat("yyyy.MM.dd hh24:mi:ss", Locale.getDefault());
			}else if(type == 6){
				sdf = new SimpleDateFormat("yyyy-MM-dd hh24:mi:ss", Locale.getDefault());
			}else if(type == 7){			
				sdf = new SimpleDateFormat("HH:mm", Locale.getDefault());
			}
			outDate = sdf.format(convDate);
		} catch (Exception e) {
			//	NOTING TO DO
		}

		return outDate;
	}
	
	/**
	 * 입력받은 스트링날짜 문자열을 Date형으로 반환
	 * 입력값 : 특정날짜
	 * 출력값 : 날짜 Date형
	 */
	public static Date getStringToDate(String inDate) {
		Date date = null;
		try {
			if (inDate.length() == 12){
				inDate = inDate + "00";
				date = (new SimpleDateFormat("yyyyMMddHHmmss", Locale.getDefault())).parse(inDate);
			}else if (inDate.length() == 10){
				inDate = inDate + "0000";
				date = (new SimpleDateFormat("yyyyMMddHHmmss", Locale.getDefault())).parse(inDate);
			}else if (inDate.length() == 8){
				inDate = inDate + "000000";
				date = (new SimpleDateFormat("yyyyMMddHHmmss", Locale.getDefault())).parse(inDate);
			}else if (inDate.length() == 4){ 
				date = (new SimpleDateFormat("HHmm", Locale.getDefault())).parse(inDate);
			}else {
				date = (new SimpleDateFormat("yyyyMMddHHmmss", Locale.getDefault())).parse(inDate);	
			}

			
		} catch (Exception e) {
			e.printStackTrace();			
		}

		return date;
	}

	/**
	 * int를 str으로 변경 ( 1 -> '00001' )
	 * 입력값 : 숫자형문자열, 최대길이
	 * 출력값 : String으로 변환한 문자열
	 */
	public static String int2str(int idx, int maxLen) {
		String temp = Integer.toString(idx);
		int len = maxLen - temp.length();

		if (len < 1)
			return temp;

		StringBuffer seq = new StringBuffer("");
		for (int i = 0; i < len; i++)
			seq.append("0");
		seq.append(temp);
		return seq.toString();
	}
	
	/**
	 * 입력받은 시작연월일부터 종료연월일 사이의 일자 가져오기
	 * @param fromDate fromDate
	 * @param toDate toDate
	 * @return String[] String[]
	 * @throws ParseException ParseException
	 */
	public static String[] getDiffDays(String fromDate, String toDate) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Calendar cal = Calendar.getInstance();
		cal.setTime(sdf.parse(fromDate));
		int count = getDiffDayCount(fromDate, toDate);
		// 시작일부터
		cal.add(Calendar.DATE, -1);
		// 데이터 저장
		List<String> list = new ArrayList<String>();
		for (int i = 0; i <= count; i++) {
			cal.add(Calendar.DATE, 1);
			list.add(sdf.format(cal.getTime()));
		}
		String[] result = new String[list.size()];
		list.toArray(result);
		return result;
	}
	public static int getDiffDayCount(String fromDate, String toDate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		try {
			return (int) ((sdf.parse(toDate).getTime() - sdf.parse(fromDate).getTime()) / 1000 / 60 / 60 / 24);
		} catch (Exception e) {
			return 0;
		} 
	}
	
	
	public static void main(String args[]) {
		String format = "yyyyMM";
		System.out.println(DateUtil.getStrNextMonth(format));
		System.out.println(DateUtil.getEndDate());
		System.out.println((getEndDate()+"200000").compareTo(getCurrentDateTime()));
		String startDateTime = DateUtil.getCurrentYear() + (DateUtil.getCurrentMonth() < 10 ? "0" + DateUtil.getCurrentMonth() + "20100000" : DateUtil.getCurrentMonth() + "20100000");
System.out.println("startDateTime : " + startDateTime);		
		System.out.println("111 : " + startDateTime.compareTo("20140320100001"));
	}
}