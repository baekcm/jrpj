package com.jnet.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;

public class ExcelUtil {
	private Logger logger = Logger.getLogger(getClass());

	public void createCell(HSSFWorkbook wb,HSSFRow row2,HSSFCell cell2,int cellNo,String excelValue, String align){
	  HSSFCellStyle style = wb.createCellStyle();
	  style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
	  style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
	  style.setWrapText(true);
	  cell2= row2.createCell(cellNo);
   	  cell2.setCellValue(excelValue);
	  cell2.setCellStyle(style);
	}
	//타이틀 셀 생성
	public void makeTitle(String titleArr[],HSSFWorkbook wb,HSSFSheet sheet, String align){
		HSSFCell cell = null;
		HSSFRow row = sheet.createRow(0);
		for(int titleNo=0; titleNo < titleArr.length; titleNo ++){
			cell= row.createCell(titleNo);
  			cell.setCellValue(titleArr[titleNo]);
  			cell.setCellStyle(makeCSS(wb,align,"title"));
		}
	}
	//CSS 정의
	public HSSFCellStyle makeCSS(HSSFWorkbook wb,String align,String title_flag){
		/***************** CSS 정의하기 ****************/
	  	  // 메뉴 + 선조정
	  	  HSSFCellStyle style = wb.createCellStyle();
	  	  if("title".equals(title_flag)){
			  style.setFillBackgroundColor(HSSFColor.WHITE.index );
			  style.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index );
			  style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
			  style.setLocked(true);
			  style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
	  	  }
		  if("left".equals(align)) 		  style.setAlignment(HSSFCellStyle.ALIGN_LEFT);
		  else if("center".equals(align)) style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		  else 							  style.setAlignment(HSSFCellStyle.ALIGN_RIGHT);
		  /*******************CSS 정의 종료 ***************/
		  return style;
	}
	// 파일경로 만들기
	public void writeFilePath(String save_path){
		 File dir = new File(save_path);
			
	  	  if(!dir.exists())
	  		  dir.mkdirs();
	}
	// 엑셀파일 쓰기
	public void writeExcelFile(String fullFileName,HSSFWorkbook wb){
		  FileOutputStream fileOut = null;
	  	  try {
	  		  fileOut = new FileOutputStream(fullFileName);
	  		  wb.write(fileOut);
	  		  fileOut.close();
		} catch (IOException e) {
			throw new RuntimeException("런타임에러가 발생하였습니다.");
		}
	}
	// 파일 경로 가져오기
	public String getFilePath(HttpServletRequest request,String savePath){
		HttpSession session = request.getSession();
	  	String doc_root = session.getServletContext().getRealPath("/");
		/*savePath = doc_root +"excel"+File.separator+savePath+File.separator;*/
	  	savePath = doc_root +"resources"+File.separator+"Pds"+File.separator+"excel"+File.separator;
		return savePath;
	}
	// 파일 이름 가져오기
	public String getExcelFileName(String name){
		  Calendar oCalendar = Calendar.getInstance( );  // 현재 날짜/시간 등의 각종 정보 얻기
		  String  year = Integer.toString(oCalendar.get(Calendar.YEAR));
	  	  String month = Integer.toString(oCalendar.get(Calendar.MONTH) + 1);
	  	  String   day = Integer.toString(oCalendar.get(Calendar.DAY_OF_MONTH));
	  	  /*String  hour = Integer.toString(oCalendar.get(Calendar.HOUR_OF_DAY));
	  	  String   min = Integer.toString(oCalendar.get(Calendar.MINUTE));
	  	  String   sec = Integer.toString(oCalendar.get(Calendar.SECOND));*/
		  name =  name+year+"년"+month+"월"+day+"일.xls";
		  return name; 
	}
	// 엑셀 저장후 다운로드
	public void downLoad(HttpServletRequest request, HttpServletResponse response,String fileName, String filePath) {		
			String saveFileName = fileName;
			String save_path = filePath;
	
		    logger.debug("FILE NAME : " + saveFileName);
		    logger.debug("FILE PATH : " + save_path	);
				   
			String load_dir = save_path + saveFileName;
		    try {
		        File file = new File(load_dir);
	
		        if (file.exists()){
		            byte readByte[] = new byte[4096];
	
		            if("MSIE".equals(getBrowser(request))){
		            	
		            }
		            response.setContentType("application/octet-stream");
					response.setHeader("Content-Disposition", getDisposition(saveFileName, getBrowser(request)));
		            BufferedInputStream  fin  = new BufferedInputStream(new FileInputStream(file));
		            OutputStream outs = response.getOutputStream();
		            
		   			int read;
		    		while ((read = fin.read(readByte, 0, 4096)) != -1)
		    				outs.write(readByte, 0, read);
		    		outs.flush();
		    		outs.close();
		            fin.close();
		        }else{
		        	logger.info("No File downLoad");
		        }
		    } catch(Exception e) {
		    	logger.debug(e.toString());
		    }
		}
	
	private String getBrowser(HttpServletRequest request) {
        String header = request.getHeader("User-Agent");
        if (header.indexOf("MSIE") > -1) {
            return "MSIE";
        } else if (header.indexOf("Chrome") > -1) {
            return "Chrome";
        } else if (header.indexOf("Opera") > -1) {
            return "Opera";
        }
        return "Firefox";
    }

    private String getDisposition(String filename, String browser) throws Exception {
	        String dispositionPrefix = "attachment;filename=";
	        String encodedFilename = null;
	        if (browser.equals("MSIE")) {
	            encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
	        } else if (browser.equals("Firefox")) {
	            encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
	        } else if (browser.equals("Opera")) {
	            encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
	        } else if (browser.equals("Chrome")) {
	            StringBuffer sb = new StringBuffer();
	            for (int i = 0; i < filename.length(); i++) {
	                char c = filename.charAt(i);
	                if (c > '~') {
	                    sb.append(URLEncoder.encode("" + c, "UTF-8"));
	                } else {
	                    sb.append(c);
	                }
	            }
	            encodedFilename = sb.toString();
	        } else {
	            throw new RuntimeException("Not supported browser");
	        }
	
	        return dispositionPrefix + encodedFilename;
	    }
}
