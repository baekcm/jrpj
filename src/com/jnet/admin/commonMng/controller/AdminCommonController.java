package com.jnet.admin.commonMng.controller;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.validator.GenericValidator;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.Region;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jnet.admin.bbsMng.service.AdminBbsMngService;
import com.jnet.admin.cptMng.service.AdminCptMngService;
import com.jnet.admin.empMng.service.AdminEmpMngService;
import com.jnet.admin.logMng.service.AdminLogMngService;
import com.jnet.admin.login.service.AdminLoginService;
import com.jnet.admin.memMng.service.AdminMemMngService;
import com.jnet.admin.pgmMng.service.AdminPgmMngService;
import com.jnet.domain.BbsFileReply;
import com.jnet.domain.Common;
import com.jnet.domain.Emp;
import com.jnet.domain.Member;
import com.jnet.domain.Menu;
import com.jnet.domain.Minwon;
import com.jnet.domain.Pgm;
import com.jnet.domain.Teacher;
import com.jnet.front.program.service.ProgramService;
import com.jnet.util.DateUtil;
import com.jnet.util.ExcelUtil;
import com.jnet.util.FileUtil;

@SuppressWarnings("deprecation")
@Controller
public class AdminCommonController {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private AdminCptMngService adminCptMngService;
	
	@Autowired
	private AdminBbsMngService adminCtsBbsService;
	
	@Autowired
	private AdminMemMngService adminMemMngService;
	
	@Autowired
	private AdminPgmMngService adminPgmMngService;
	
	@Autowired
	private AdminEmpMngService adminEmpMngService;
	
	@Autowired
	private ProgramService programService;
	
	@Autowired
	private AdminLoginService adminLoginService;
	
	@Autowired
	private AdminLogMngService adminLogMngService;
	
	/**
	 * 미리보기 컨트롤러
	 * @param model model
	 * @param request request
	 * @return String String
	 */
	@RequestMapping(value="/preview",method=RequestMethod.POST)
    public String updateCptMng(Model model, HttpServletRequest request) {
		logger.info("AdminPreviewController - preview");
    	model.addAttribute("html",request.getParameter("previewHtml"));
    	return "preview";
	}
	
	
	/**
     * *************************************************************************************************************************************************
     * *****************************************************		첨부파일 다운로드     	  **************************************************************
     * *************************************************************************************************************************************************
     */
	
	/**
     * 게시물 파일 다운로드
     * 
     * @param model model
     * @return String String
     */
    @RequestMapping(value="/admin/downBbsFile", method=RequestMethod.POST)
    public void downBbsFile(HttpServletRequest request, HttpServletResponse response,  BbsFileReply bbsParam) {
    	logger.info("AdminCommonController - downBbsFile");
    	try {
    		BbsFileReply bbsResult = adminCtsBbsService.findBbsDataFile(bbsParam);
    		FileUtil.filDown(request, response, bbsResult.getFilePath(), bbsResult.getRealFileNm(), bbsResult.getOrgnlFileNm());
		} catch (Exception e) {
			printStackTrace(e);
		}
    }
    
    /**
     * 게시판관리 클린신고센터 파일다운로드
     * 
     * @param model model
     * @return String String
     */
    @RequestMapping(value="/admin/downCleanFile", method=RequestMethod.POST)
    public void downCleanFile(HttpServletRequest request, HttpServletResponse response,  BbsFileReply bbsParam) {
    	logger.info("AdminCommonController - findClean");
    	try {
    		BbsFileReply cleanResult = adminCtsBbsService.findCleanFile(bbsParam);
    		FileUtil.filDown(request, response, cleanResult.getFilePath(), cleanResult.getRealFileNm(), cleanResult.getOrgnlFileNm());
		} catch (Exception e) {
			printStackTrace(e);
		}
    }
    
    /**
     * 게시판관리 고객제안파일다운로드
     * 
     * @param model model
     * @return String String
     */
    @RequestMapping(value="/admin/downSuggestFile", method=RequestMethod.POST)
    public void downSuggestFile(HttpServletRequest request, HttpServletResponse response,  BbsFileReply bbsParam) {
    	logger.info("AdminCommonController - downSuggestFile");
    	try {
    		BbsFileReply suggestResult = adminCtsBbsService.findSuggestFile(bbsParam);
    		FileUtil.filDown(request, response, suggestResult.getFilePath(), suggestResult.getRealFileNm(), suggestResult.getOrgnlFileNm());
		} catch (Exception e) {
			printStackTrace(e);
		}
    }
    
    /**
     * *************************************************************************************************************************************************
     * *****************************************************		엑셀 다운로드     	  ******************************************************************
     * *************************************************************************************************************************************************
     */
    
    /**
     * 회원목록 엑셀다운
     * @param request request
     * @param response response
     * @param memberParam memberParam
     */
    @RequestMapping(value="/admin/excelDownMemMng", method=RequestMethod.POST)
    public void excelDownMemMng(HttpServletRequest request, HttpServletResponse response,  Member memberParam) {
    	logger.info("AdminCommonController - excelDownMemMng");
    	try {
    		ArrayList<Member> listMemMng = adminMemMngService.listMemMng(memberParam);
    		//워크북 생성
    		if(listMemMng != null && listMemMng.size() > 0) {
    			ExcelUtil excelCtr = new ExcelUtil();
    			
    			HSSFWorkbook wb = new HSSFWorkbook();
    	  		//시트 생성
    	  	  	HSSFSheet sheet = wb.createSheet("회원목록");
    	  	  	String titleArr[] = {"번호","아이디","이름","생년월일","성별","이메일","전화번호","우편번호","주소","최근접속일","가입일"};
    	  	  	excelCtr.makeTitle(titleArr,wb,sheet,"center");
    	  	  	 
    	  	  	 // 리스트 내용 쓰기
  	        	HSSFRow row2 = null;
  	        	HSSFCell cell2 = null;
  		        int tableIndex = 0;
  		        int n = listMemMng.size();
  	        	for(int i=0; i<listMemMng.size(); i++){
  	        		listMemMng.get(i).setListNo(n);
  	        		n--;
  	        	}
  		        for(int j = 1; j< listMemMng.size()+1 ; j++){	
  			          row2 = sheet.createRow((short)j);
  			          for(int k=0; k<11; k++){
  			        	  if(k==0){
  			        		  excelCtr.createCell(wb,row2,cell2,k,Integer.toString(listMemMng.get(tableIndex).getListNo()),"center");
  			        		  sheet.setColumnWidth(k,3000);
  			        	  } else if(k==1){
  			        		  excelCtr.createCell(wb,row2,cell2,k,listMemMng.get(tableIndex).getUserId(),"center");
  			        		  sheet.setColumnWidth(k,5000);
  			        	  } else if(k==2){
  			        		  excelCtr.createCell(wb,row2,cell2,k,listMemMng.get(tableIndex).getUserNm(),"center");
  			        		  sheet.setColumnWidth(k,5000);
  			        	  } else if(k==3){
  			        		  String birth="";
  			        		  if(!GenericValidator.isBlankOrNull(listMemMng.get(tableIndex).getBirthday())) {
  			        			  birth += listMemMng.get(tableIndex).getBirthday().substring(0,4)+"년"+ 
  			        			  		   listMemMng.get(tableIndex).getBirthday().substring(4,6)+"월"+
  			        			  		   listMemMng.get(tableIndex).getBirthday().substring(6,8)+"일";
  			        		  }
  			        		  			 excelCtr.createCell(wb,row2,cell2,k,birth,"center");
  			        		  			 sheet.setColumnWidth(k,5000);
  			        	  } else if(k==4){
  			        		  String sex = "";
  			        		  if(!GenericValidator.isBlankOrNull(listMemMng.get(tableIndex).getSex())) {
  			        			  if(listMemMng.get(tableIndex).getSex().equals("1")){
  			        				sex = "남";  
  			        			  } else if(listMemMng.get(tableIndex).getSex().equals("2")){
  			        				sex = "여";
  			        			  }
  			        		  }
  			        		  excelCtr.createCell(wb,row2,cell2,k,sex,"center");
  			        		  sheet.setColumnWidth(k,5000);
  			        	  } else if(k==5){
  			        		  excelCtr.createCell(wb,row2,cell2,k,listMemMng.get(tableIndex).getEmail(),"center");
  			        		  sheet.setColumnWidth(k,5000);
  			        	  } else if(k==6){
  			        		  excelCtr.createCell(wb,row2,cell2,k,listMemMng.get(tableIndex).getPhone(),"center");
  			        		  sheet.setColumnWidth(k,5000);
  			        	  } else if(k==7){
  			        		  String zipcode = ""; 
  			        		  if(!GenericValidator.isBlankOrNull(listMemMng.get(tableIndex).getZipcode())) {
  			        			zipcode = listMemMng.get(tableIndex).getZipcode().substring(0,3)+"-"+listMemMng.get(tableIndex).getZipcode().substring(3,6);
  			        		  }
  			        		  excelCtr.createCell(wb,row2,cell2,k,zipcode,"center");
  			        		  sheet.setColumnWidth(k,5000);
  			        	  } else if(k==8){
  			        		  String addr = "";
  			        		  if(!GenericValidator.isBlankOrNull(listMemMng.get(tableIndex).getAddr())){
  			        			addr += listMemMng.get(tableIndex).getAddr();
  			        		  }
  			        		  if(!GenericValidator.isBlankOrNull(listMemMng.get(tableIndex).getAddr2())){
  			        			addr += " " + listMemMng.get(tableIndex).getAddr2();  
  			        		  }
  			        		  excelCtr.createCell(wb,row2,cell2,k,addr,"center");
  			        		  sheet.setColumnWidth(k,10000);
  			        	  } else if(k==9){		 
  			        		  String loginYmd = "";
  			        		  if(!GenericValidator.isBlankOrNull(listMemMng.get(tableIndex).getLoginYmd())) {
  			        			loginYmd += listMemMng.get(tableIndex).getLoginYmd().substring(0,4)+"년"+
										    listMemMng.get(tableIndex).getLoginYmd().substring(4,6)+"월"+
										    listMemMng.get(tableIndex).getLoginYmd().substring(6,8)+"일  "+
										    listMemMng.get(tableIndex).getLoginHms().substring(0,2)+"시"+
										    listMemMng.get(tableIndex).getLoginHms().substring(2,4)+"분"+
										    listMemMng.get(tableIndex).getLoginHms().substring(4,6)+"초";
  			        		  }
  			        		  excelCtr.createCell(wb,row2,cell2,k, loginYmd,"center");
  			        		  sheet.setColumnWidth(k,8000);
  			        	  } else if(k==10){
  			        		  String signYmd = "";
  			        		  if(!GenericValidator.isBlankOrNull(listMemMng.get(tableIndex).getSignYmd())) {
  			        			  signYmd += listMemMng.get(tableIndex).getSignYmd().substring(0,4)+"년"+
					        				 listMemMng.get(tableIndex).getSignYmd().substring(4,6)+"월"+
											 listMemMng.get(tableIndex).getSignYmd().substring(6,8)+"일";
  			        		  }
  			        		  excelCtr.createCell(wb,row2,cell2,k,signYmd,"center");
  			        		  sheet.setColumnWidth(k,5000);
  			        	  }
  			          }
  			          tableIndex++;
  			    }
  		        commonMkDir( excelCtr, request, response, wb,  "memMng", "회원목록_");
    		}
  		  
		} catch (Exception e) {
			printStackTrace(e);
		}
    }
    
    /**
     * 탈퇴회원 목록 엑셀다운
     * @param request request
     * @param response response
     * @param memberParam memberParam
     */
    @RequestMapping(value="/admin/excelDownMemMngOut", method=RequestMethod.POST)
    public void excelDownMemMngOut(HttpServletRequest request, HttpServletResponse response,  Member memberParam) {
    	logger.info("AdminCommonController - excelDownMemMngOut");
		
    	try {
    		ArrayList<Member> listMemOutMng = adminMemMngService.listMemOutMng(memberParam);
    		//워크북 생성
    		if(listMemOutMng != null && listMemOutMng.size() > 0) {
    			ExcelUtil excelCtr = new ExcelUtil();
    			
    			HSSFWorkbook wb = new HSSFWorkbook();
    	  		  //시트 생성
    	  	  	  HSSFSheet sheet = wb.createSheet("회원탈퇴목록");
    	  	  	  String titleArr[] = {"번호","아이디","이름","생년월일","성별","이메일","전화번호","우편번호","주소","탈퇴일","탈퇴사유"};
    	  	  	  excelCtr.makeTitle(titleArr,wb,sheet,"center");
    	  	  	 
    	  	  	  	// 리스트 내용 쓰기
    	        	HSSFRow row2 = null;
    	        	HSSFCell cell2 = null;
    		        int tableIndex = 0;
    		        int n = listMemOutMng.size();
    	        	for(int i=0; i<listMemOutMng.size(); i++){
    	        		listMemOutMng.get(i).setListNo(n);
    	        		n--;
    	        	}
    		        for(int j = 1; j< listMemOutMng.size()+1 ; j++){	
    			          row2 = sheet.createRow((short)j);
    			          for(int k=0; k<11; k++){
    			        	  if(k==0){
    			        		  excelCtr.createCell(wb,row2,cell2,k,Integer.toString(listMemOutMng.get(tableIndex).getListNo()),"center");
    			        		  sheet.setColumnWidth(k,3000);
    			        	  } else if(k==1){
    			        		  excelCtr.createCell(wb,row2,cell2,k,listMemOutMng.get(tableIndex).getUserId(),"center");
    			        		  sheet.setColumnWidth(k,5000);
    			        	  } else if(k==2){
    			        		  excelCtr.createCell(wb,row2,cell2,k,listMemOutMng.get(tableIndex).getUserNm(),"center");
    			        		  sheet.setColumnWidth(k,5000);
    			        	  } else if(k==3){
    			        		  String birth="";
      			        		  if(!GenericValidator.isBlankOrNull(listMemOutMng.get(tableIndex).getBirthday())) {
      			        			  birth += listMemOutMng.get(tableIndex).getBirthday().substring(0,4)+"년"+ 
			      			        		   listMemOutMng.get(tableIndex).getBirthday().substring(4,6)+"월"+
			      			        		   listMemOutMng.get(tableIndex).getBirthday().substring(6,8)+"일";
      			        		  }
    			        		  excelCtr.createCell(wb,row2,cell2,k,birth,"center");
    			        		  sheet.setColumnWidth(k,5000);
    			        	  } else if(k==4){
    			        		  String sex = "";
      			        		  if(!GenericValidator.isBlankOrNull(listMemOutMng.get(tableIndex).getSex())) {
      			        			  if(listMemOutMng.get(tableIndex).getSex().equals("1")){
      			        				sex = "남";  
      			        			  } else if(listMemOutMng.get(tableIndex).getSex().equals("2")){
      			        				sex = "여";
      			        			  }
      			        		  }
    			        		  excelCtr.createCell(wb,row2,cell2,k,sex,"center");
    			        		  sheet.setColumnWidth(k,5000);
    			        	  } else if(k==5){
    			        		  excelCtr.createCell(wb,row2,cell2,k,listMemOutMng.get(tableIndex).getEmail(),"center");
    			        		  sheet.setColumnWidth(k,5000);
    			        	  } else if(k==6){
    			        		  excelCtr.createCell(wb,row2,cell2,k,listMemOutMng.get(tableIndex).getPhone(),"center");
    			        		  sheet.setColumnWidth(k,5000);
    			        	  } else if(k==7){
    			        		  String zipcode = ""; 
      			        		  if(!GenericValidator.isBlankOrNull(listMemOutMng.get(tableIndex).getZipcode())) {
      			        			zipcode = listMemOutMng.get(tableIndex).getZipcode().substring(0,3)+
      			        				 	  "-"+
      			        				 	  listMemOutMng.get(tableIndex).getZipcode().substring(3,6);
      			        		  }
    			        		  excelCtr.createCell(wb,row2,cell2,k,zipcode,"center");
    			        		  sheet.setColumnWidth(k,5000);
    			        	  } else if(k==8){
    			        		  String addr = "";
      			        		  if(!GenericValidator.isBlankOrNull(listMemOutMng.get(tableIndex).getAddr())){
      			        			addr += listMemOutMng.get(tableIndex).getAddr();
      			        		  }
      			        		  if(!GenericValidator.isBlankOrNull(listMemOutMng.get(tableIndex).getAddr2())){
      			        			addr += " " + listMemOutMng.get(tableIndex).getAddr2();  
      			        		  }
    			        		  excelCtr.createCell(wb,row2,cell2,k,addr,"center");
    			        		  sheet.setColumnWidth(k,10000);
    			        	  } else if(k==9){
    			        		  String outYmd = "";
    			        		  if(!GenericValidator.isBlankOrNull(listMemOutMng.get(tableIndex).getModiYmd())) {
    			        			  outYmd =  listMemOutMng.get(tableIndex).getModiYmd().substring(0,4)+"년"+
						        			    listMemOutMng.get(tableIndex).getModiYmd().substring(4,6)+"월"+
						        			    listMemOutMng.get(tableIndex).getModiYmd().substring(6,8)+"일  "+
						        			    listMemOutMng.get(tableIndex).getModiHms().substring(0,2)+"시"+
						        			    listMemOutMng.get(tableIndex).getModiHms().substring(2,4)+"분"+
						        			    listMemOutMng.get(tableIndex).getModiHms().substring(4,6)+"초";
    			        		  }
    			        		  excelCtr.createCell(wb,row2,cell2,k, outYmd,"center");
    			        		  sheet.setColumnWidth(k,8000);
    			        	  } else if(k==10){
    			        		  excelCtr.createCell(wb,row2,cell2,k,listMemOutMng.get(tableIndex).getOutDesc(),"center");
    			        		  sheet.setColumnWidth(k,10000);
    			        	  }
    			          }
    			          tableIndex++;
    			    }
    		        commonMkDir( excelCtr, request, response, wb,  "memMngOut", "회원탈퇴목록_");
    		}
    		
		} catch (Exception e) {
			printStackTrace(e);
		}
    }
    
    /**
     * 프로그램목록 엑셀다운
     * @param response response
     * @param outPgmParam outPgmParam
     * @param request request
     */
    @RequestMapping(value="/admin/excelDownPgmMng", method=RequestMethod.POST)
    public void excelDownPgmMng(HttpServletResponse response, Pgm outPgmParam, HttpServletRequest request) {
    	logger.info("AdminCommonController - excelDownPgmMng");
    	try {
    		ArrayList<Pgm> listProgram = programService.listFrontPgm(outPgmParam);
			
    		//워크북 생성
    		if(listProgram != null && listProgram.size() > 0) {
    			ExcelUtil excelCtr = new ExcelUtil();
    			
    			HSSFWorkbook wb = new HSSFWorkbook();
    	  		  //시트 생성
    	  	  	  HSSFSheet sheet = wb.createSheet("프로그램목록");
    	  	  	  String titleArr[] = {"번호","프로그램그룹","프로그램명","시간","대상","수강료"};
    	  	  	  excelCtr.makeTitle(titleArr,wb,sheet,"center");
    	  	  	 
    	  	  	 // 리스트 내용 쓰기
    	        	HSSFRow row2 = null;
    	        	HSSFCell cell2 = null;
    	        	int tableIndex = 0;
      	        	int tmpCnt = 0;
      	        	String tmp = "";
      	        	int startIdx = 0;
      	        	
    		        int n = listProgram.size();
    	        	for(int i=0; i<listProgram.size(); i++){
    	        		listProgram.get(i).setListNo(n);
    	        		n--;
    	        	}
    		        for(int j = 1; j< listProgram.size()+1 ; j++){	
    			          row2 = sheet.createRow((short)j);
    			          for(int k=0; k<6; k++){
    			        	  if(k==0){
    			        		  excelCtr.createCell(wb,row2,cell2,k,Integer.toString(listProgram.get(tableIndex).getListNo()),"center");
    			        		  sheet.setColumnWidth(k,3000);
    			        	  }else if(k==1){
    			        		  String catNm="";
    			        		  if(!GenericValidator.isBlankOrNull(listProgram.get(tableIndex).getComNm4())) {
    			        			  catNm = listProgram.get(tableIndex).getComNm4()+
    			        			  		  ">"+
    			        			  		  listProgram.get(tableIndex).getComNm2()+
    			        			  		  ">"+
    			        			  		  listProgram.get(tableIndex).getComNm1(); 
    			        		  }
    			        		  excelCtr.createCell(wb,row2,cell2,k,catNm,"center");
    			        		  sheet.setColumnWidth(k,10000);
    			        	  }else if(k==2){
    			        		  excelCtr.createCell(wb,row2,cell2,k,listProgram.get(tableIndex).getPgmNm(),"center");
    			        		  sheet.setColumnWidth(k,8000);
    			        	  }else if(k==3){
    			        		  String timeNm = "";
    			        		  if(!GenericValidator.isBlankOrNull(listProgram.get(tableIndex).getStartT())) {
    			        			  timeNm = listProgram.get(tableIndex).getStartT().substring(0,2)+":"+
					        				   listProgram.get(tableIndex).getStartT().substring(2,4)+"~"+
					        				   listProgram.get(tableIndex).getEndT().substring(0,2)+":"+
					        				   listProgram.get(tableIndex).getEndT().substring(2,4);
    			        		  }
    			        		  excelCtr.createCell(wb,row2,cell2,k,timeNm,"center");
    			        		  sheet.setColumnWidth(k,5000);
    			        	  }else if(k==4){
    			        		  excelCtr.createCell(wb,row2,cell2,k,listProgram.get(tableIndex).getComNm3(),"center");
    			        		  sheet.setColumnWidth(k,5000);
    			        	  }else if(k==5){
    			        		  String price = "0";
    			        		  if(!GenericValidator.isBlankOrNull(listProgram.get(tableIndex).getuPrice())){
    			        			  DecimalFormat df = new DecimalFormat("#,###");  
    			        			  price = df.format(Integer.parseInt(listProgram.get(tableIndex).getuPrice()));
    			        		  }
    			        		  
    			        		  excelCtr.createCell(wb,row2,cell2,k,price+"원","center");
    			        		  sheet.setColumnWidth(k,5000);
    			        	  }
    			          }
    			          
    			          
    			          if(tmp.equals("")) {
    	  	        			if(listProgram.size()-1 > tableIndex) {
    		  	        			if(listProgram.get(tableIndex).getPgmCd().equals(listProgram.get(tableIndex+1).getPgmCd())){
    		  	        				startIdx = j;
    		  	  	        			tmp = listProgram.get(tableIndex).getPgmCd();
    		  	  	        			tmpCnt++;	
    		  	        			}
    	  	        			}
    	  	        		} else {
    	  	        			if(listProgram.size()-1 > tableIndex) {
    	  	        				if(tmp.equals(listProgram.get(tableIndex+1).getPgmCd())){
    	  	  	        				tmpCnt++;
    	  	  	        			} else {
    	  	  	        				tmp = "";
    	  	  	        				if(startIdx != (startIdx+tmpCnt)) {
    		  	  	        				sheet.addMergedRegion(new Region(startIdx,(short)1,(startIdx+tmpCnt),(short)1));
    		  	  	        				sheet.addMergedRegion(new Region(startIdx,(short)2,(startIdx+tmpCnt),(short)2));
    		  	  	        				sheet.addMergedRegion(new Region(startIdx,(short)3,(startIdx+tmpCnt),(short)3));
    	  	  	        				}
    	  	  	        				tmpCnt = 0;
    	  	  	        			}	
    	  	        			} else {
    	  	        				if(startIdx != (startIdx+tmpCnt)) {
    	  	        					sheet.addMergedRegion(new Region(startIdx,(short)1,(startIdx+tmpCnt),(short)1));
		  	  	        				sheet.addMergedRegion(new Region(startIdx,(short)2,(startIdx+tmpCnt),(short)2));
		  	  	        				sheet.addMergedRegion(new Region(startIdx,(short)3,(startIdx+tmpCnt),(short)3));
    	  	        				}
    	  	        			}
    	  	        		}
    			          
    			          tableIndex++;
    			    }
    		        commonMkDir( excelCtr, request, response, wb,  "pgmMng", "프로그램목록_");
    		}
		} catch (Exception e) {
			printStackTrace(e);
		}
    }
    
    /**
     * 강사리스트 엑셀다운
     * @param request request
     * @param response response
     * @param teacherParam teacherParam
     */
    @RequestMapping(value="/admin/excelDownTeacherMng", method=RequestMethod.POST)
    public void excelDownTeacherMng(HttpServletRequest request, HttpServletResponse response,  Teacher teacherParam) {
    	logger.info("AdminCommonController - excelDownTeacherMng");
    	try {
    		ArrayList<Teacher> listTeacherMng = adminPgmMngService.listTeacherMng(teacherParam);
    		
    		//워크북 생성
    		if(listTeacherMng != null && listTeacherMng.size() > 0) {
    			ExcelUtil excelCtr = new ExcelUtil();
    			
    			HSSFWorkbook wb = new HSSFWorkbook();
    	  		  //시트 생성
    	  	  	  HSSFSheet sheet = wb.createSheet("강사목록");
    	  	  	  String titleArr[] = {"번호","강사이름","연락처","이메일","우편번호","기본주소","상세주소"};
    	  	  	  excelCtr.makeTitle(titleArr,wb,sheet,"center");
    	  	  	 
    	  	  	 // 리스트 내용 쓰기
    	        	HSSFRow row2 = null;
    	        	HSSFCell cell2 = null;
    		        int tableIndex = 0;
    		        int n = listTeacherMng.size();
    	        	for(int i=0; i<listTeacherMng.size(); i++){
    	        		listTeacherMng.get(i).setListNo(n);
    	        		n--;
    	        	}
    		        for(int j = 1; j< listTeacherMng.size()+1 ; j++){	
    			          row2 = sheet.createRow((short)j);
    			          for(int k=0; k<7; k++){
    			        	  if(k==0){
    			        		  excelCtr.createCell(wb,row2,cell2,k,Integer.toString(listTeacherMng.get(tableIndex).getListNo()),"center");
    			        		  sheet.setColumnWidth(k,3000);
    			        	  } else if(k==1){
    			        		  excelCtr.createCell(wb,row2,cell2,k,listTeacherMng.get(tableIndex).getTeacherNm(),"center");
    			        		  sheet.setColumnWidth(k,5000);
    			        	  } else if(k==2){
    			        		  String phone="";
    			        		  if(!GenericValidator.isBlankOrNull(listTeacherMng.get(tableIndex).getTeacherPhone1())) {
    			        			  phone = listTeacherMng.get(tableIndex).getTeacherPhone1()+
		    			        			  "-"+
		        				  			  listTeacherMng.get(tableIndex).getTeacherPhone2()+
		        				  			  "-"+
		        				  			  listTeacherMng.get(tableIndex).getTeacherPhone3();
    			        		  }
    			        		  excelCtr.createCell(wb,row2,cell2,k,phone,"center");
    			        		  sheet.setColumnWidth(k,5000);
    			        	  } else if(k==3){
    			        		  String email = "";
    			        		  if(!GenericValidator.isBlankOrNull(listTeacherMng.get(tableIndex).getTeacherEmail1())) {
    			        			  email = listTeacherMng.get(tableIndex).getTeacherEmail1()+
    			        			  		  "@"+
        				  			  		  listTeacherMng.get(tableIndex).getTeacherEmail2();
    			        		  }
    			        		  excelCtr.createCell(wb,row2,cell2,k,email,"center");
    			        		  sheet.setColumnWidth(k,5000);
    			        	  } else if(k==4){
    			        		  String zipcode="";
    			        		  if(!GenericValidator.isBlankOrNull(listTeacherMng.get(tableIndex).getZipcode1())) {
    			        			  zipcode = listTeacherMng.get(tableIndex).getZipcode1()+
		    			        			    "-"+
		        				  			    listTeacherMng.get(tableIndex).getZipcode2();
    			        		  }
    			        		  excelCtr.createCell(wb,row2,cell2,k,zipcode,"center");
    			        		  sheet.setColumnWidth(k,5000);
    			        	  } else if(k==5){
    			        		  String dftAddr = "";
    			        		  if(!GenericValidator.isBlankOrNull(listTeacherMng.get(tableIndex).getTeacherDftAddr())) {
    			        			  dftAddr = listTeacherMng.get(tableIndex).getTeacherDftAddr();
    			        		  }
    			        		  excelCtr.createCell(wb,row2,cell2,k,dftAddr,"center");
    			        		  sheet.setColumnWidth(k,10000);
    			        	  } else if(k==6){
    			        		  String dtlAddr = "";
    			        		  if(!GenericValidator.isBlankOrNull(listTeacherMng.get(tableIndex).getTeacherDtlAddr())) {
    			        			  dtlAddr = listTeacherMng.get(tableIndex).getTeacherDtlAddr();
    			        		  }
    			        		  excelCtr.createCell(wb,row2,cell2,k,dtlAddr,"center");
    			        		  sheet.setColumnWidth(k,10000);
    			        	  }
    			          }
    			          tableIndex++;
    			    }
    		        commonMkDir( excelCtr, request, response, wb,  "teacherMng", "강사목록_");
    		}
    		
		} catch (Exception e) {
			printStackTrace(e);
		}
    }
    
    /**
     * 조직관리 엑셀다운
     * @param request request
     * @param response response
     * @param empParam empParam
     */
    @RequestMapping(value="/admin/excelDownEmpMng", method=RequestMethod.POST)
    public void excelDownEmpMng(HttpServletRequest request, HttpServletResponse response,  Emp empParam) {
    	logger.info("AdminCommonController - excelDownEmpMng");
    	try {
    		ArrayList<Emp> listEmpMng = adminEmpMngService.listEmpMng(empParam);
    		
    		//워크북 생성
    		if(listEmpMng != null && listEmpMng.size() > 0) {
    			ExcelUtil excelCtr = new ExcelUtil();
    			
    			HSSFWorkbook wb = new HSSFWorkbook();
    	  		  //시트 생성
    	  	  	  HSSFSheet sheet = wb.createSheet("조직목록");
    	  	  	  String titleArr[] = {"번호","사번","이름","부서","파트","직위","직무","휴대전화","이메일","회사전화","퇴직여부"};
    	  	  	  excelCtr.makeTitle(titleArr,wb,sheet,"center");
    	  	  	 
    	  	  	 // 리스트 내용 쓰기
    	        	HSSFRow row2 = null;
    	        	HSSFCell cell2 = null;
    		        int tableIndex = 0;
    		        int n = listEmpMng.size();
    	        	for(int i=0; i<listEmpMng.size(); i++){
    	        		listEmpMng.get(i).setListNo(n);
    	        		n--;
    	        	}
    		        for(int j = 1; j< listEmpMng.size()+1 ; j++){	
    			          row2 = sheet.createRow((short)j);
    			          for(int k=0; k<11; k++){
    			        	  if(k==0){
    			        		  excelCtr.createCell(wb,row2,cell2,k,Integer.toString(listEmpMng.get(tableIndex).getListNo()),"center");
    			        		  sheet.setColumnWidth(k,3000);
    			        	  } else if(k==1){
    			        		  excelCtr.createCell(wb,row2,cell2,k,listEmpMng.get(tableIndex).getEmpNo(),"center");
    			        		  sheet.setColumnWidth(k,5000);
    			        	  } else if(k==2){
    			        		  excelCtr.createCell(wb,row2,cell2,k,listEmpMng.get(tableIndex).getEmpNm(),"center");
    			        		  sheet.setColumnWidth(k,5000);
    			        	  } else if(k==3){
    			        		  excelCtr.createCell(wb,row2,cell2,k,listEmpMng.get(tableIndex).getEmpDept(),"center");
    			        		  sheet.setColumnWidth(k,5000);
    			        	  } else if(k==4){
    			        		  excelCtr.createCell(wb,row2,cell2,k,listEmpMng.get(tableIndex).getEmpPart(),"center");
    			        		  sheet.setColumnWidth(k,5000);
    			        	  } else if(k==5){
    			        		  excelCtr.createCell(wb,row2,cell2,k,listEmpMng.get(tableIndex).getEmpPosition(),"center");
    			        		  sheet.setColumnWidth(k,5000);
    			        	  } else if(k==6){
    			        		  excelCtr.createCell(wb,row2,cell2,k,listEmpMng.get(tableIndex).getEmpJob(),"center");
    			        		  sheet.setColumnWidth(k,10000);
    			        	  } else if(k==7){
    			        		  String mobile = "";
    			        		  if(!GenericValidator.isBlankOrNull(listEmpMng.get(tableIndex).getEmpMobile1())) {
    			        			  mobile = listEmpMng.get(tableIndex).getEmpMobile1()+
		    			        			   "-"+
					        				   listEmpMng.get(tableIndex).getEmpMobile2()+
					        				   "-"+
		    			        			   listEmpMng.get(tableIndex).getEmpMobile3();
    			        		  }
    			        		  excelCtr.createCell(wb,row2,cell2,k,mobile,"center");
    			        		  sheet.setColumnWidth(k,5000);
    			        	  } else if(k==8){
    			        		  String email = "";
    			        		  if(!GenericValidator.isBlankOrNull(listEmpMng.get(tableIndex).getEmpEmail1())) {
    			        			  email  = listEmpMng.get(tableIndex).getEmpEmail1()+
		    			        			   "@"+
		        				  			   listEmpMng.get(tableIndex).getEmpEmail2();
    			        		  }
    			        		  excelCtr.createCell(wb,row2,cell2,k,email,"center");
    			        		  sheet.setColumnWidth(k,5000);
    			        	  } else if(k==9){
    			        		  String phone="";
    			        		  if(!GenericValidator.isBlankOrNull(listEmpMng.get(tableIndex).getEmpPhone1())) {
    			        			  phone = listEmpMng.get(tableIndex).getEmpPhone1()+
		    			        			  "-"+
					        				  listEmpMng.get(tableIndex).getEmpPhone2()+
					        				  "-"+
		    			        			  listEmpMng.get(tableIndex).getEmpPhone3();
    			        		  }
    			        		  excelCtr.createCell(wb,row2,cell2,k,phone,"center");
    			        		  sheet.setColumnWidth(k,7000);
    			        	  } else if(k==10){
    			        		  String empOutYn = "";
    			        		  if(!GenericValidator.isBlankOrNull(listEmpMng.get(tableIndex).getEmpOutYn())) {
    			        			  if(listEmpMng.get(tableIndex).getEmpOutYn().equals("0")) {
    			        				  empOutYn = "재직중";
    			        			  } else if(listEmpMng.get(tableIndex).getEmpOutYn().equals("1")) {
    			        				  empOutYn = "퇴직";
    			        			  } else if(listEmpMng.get(tableIndex).getEmpOutYn().equals("2")) {
    			        				  empOutYn = "휴직중";
    			        			  }
    			        			  
    			        		  }
    			        		  excelCtr.createCell(wb,row2,cell2,k,empOutYn,"center");
    			        		  sheet.setColumnWidth(k,5000);
    			        	  }
    			          }
    			          tableIndex++;
    			    }
    		        commonMkDir( excelCtr, request, response, wb,  "empMng", "조직목록_");
    		}
		} catch (Exception e) {
			printStackTrace(e);
		}
    }
    
    /**
     * 클린신고센터 엑셀다운
     * @param request request
     * @param response response
     * @param bbsParam bbsParam
     */
    @RequestMapping(value="/admin/excelDownClean", method=RequestMethod.POST)
    public void excelDownClean(HttpServletRequest request, HttpServletResponse response,  BbsFileReply bbsParam) {
    	logger.info("AdminCommonController - excelDownClean");
    	try {
    		ArrayList<BbsFileReply> listClean = adminCtsBbsService.listClean(bbsParam);
    		
    		//워크북 생성
    		if(listClean != null && listClean.size() > 0) {
    			ExcelUtil excelCtr = new ExcelUtil();
    			
    			HSSFWorkbook wb = new HSSFWorkbook();
    	  		  //시트 생성
    	  	  	  HSSFSheet sheet = wb.createSheet("클린신고목록");
    	  	  	  String titleArr[] = {"번호","제목","작성자","연락처","이메일","내용","등록일"};
    	  	  	  excelCtr.makeTitle(titleArr,wb,sheet,"center");
    	  	  	 
    	  	  	 // 리스트 내용 쓰기
    	        	HSSFRow row2 = null;
    	        	HSSFCell cell2 = null;
    		        int tableIndex = 0;
    		        int n = listClean.size();
    	        	for(int i=0; i<listClean.size(); i++){
    	        		listClean.get(i).setListNo(n);
    	        		n--;
    	        	}
    		        for(int j = 1; j< listClean.size()+1 ; j++){	
    			          row2 = sheet.createRow((short)j);
    			          for(int k=0; k<7; k++){
    			        	  if(k==0){
    			        		  excelCtr.createCell(wb,row2,cell2,k,Integer.toString(listClean.get(tableIndex).getListNo()),"center");
    			        		  sheet.setColumnWidth(k,3000);
    			        	  } else if(k==1){
    			        		  excelCtr.createCell(wb,row2,cell2,k,listClean.get(tableIndex).getSubject(),"center");
    			        		  sheet.setColumnWidth(k,5000);
    			        	  } else if(k==2){
    			        		  excelCtr.createCell(wb,row2,cell2,k,listClean.get(tableIndex).getUserNm(),"center");
    			        		  sheet.setColumnWidth(k,5000);
    			        	  } else if(k==3){
    			        		  String phone="";
    			        		  if(!GenericValidator.isBlankOrNull(listClean.get(tableIndex).getPhone1())) {
    			        			  phone = listClean.get(tableIndex).getPhone1()+
		    			        			  "-"+
		    			        			  listClean.get(tableIndex).getPhone2()+
		    			        			  "-"+
		    			        			  listClean.get(tableIndex).getPhone3();
    			        		  }
    			        		  excelCtr.createCell(wb,row2,cell2,k,phone,"center");
    			        		  sheet.setColumnWidth(k,5000);
    			        	  } else if(k==4){
    			        		  String email = "";
    			        		  if(!GenericValidator.isBlankOrNull(listClean.get(tableIndex).getEmail1())) {
    			        			  email = listClean.get(tableIndex).getEmail1()+
		    			        			  "@"+
		    			        			  listClean.get(tableIndex).getEmail2();
    			        		  }
    			        		  excelCtr.createCell(wb,row2,cell2,k,email,"center");
    			        		  sheet.setColumnWidth(k,5000);
    			        	  } else if(k==5){
    			        		  excelCtr.createCell(wb,row2,cell2,k,listClean.get(tableIndex).getContent(),"center");
    			        		  sheet.setColumnWidth(k,10000);
    			        	  } else if(k==6){
    			        		  String createYmd = "";
    			        		  if(!GenericValidator.isBlankOrNull(listClean.get(tableIndex).getCreateYmd())) {
    			        			  createYmd = listClean.get(tableIndex).getCreateYmd().substring(0,4)+"년"+
			    			        			  listClean.get(tableIndex).getCreateYmd().substring(4,6)+"월"+
			    			        			  listClean.get(tableIndex).getCreateYmd().substring(6,8)+"일  "+
			    			        			  listClean.get(tableIndex).getCreateHms().substring(0,2)+"시"+
			    			        			  listClean.get(tableIndex).getCreateHms().substring(2,4)+"분"+
			    			        			  listClean.get(tableIndex).getCreateHms().substring(4,6)+"초";
    			        		  }
    			        		  excelCtr.createCell(wb,row2,cell2,k,createYmd,"center");
    			        		  sheet.setColumnWidth(k,8000);
    			        	  }
											    			        			  
    			          }
    			          tableIndex++;
    			    }
    		        commonMkDir( excelCtr, request, response, wb,  "cleanMng", "클린신고목록_");
    		}
    		
		} catch (Exception e) {
			printStackTrace(e);
		}
    }
    
    /**
     * 고객제안 엑셀다운
     * @param request request
     * @param response response
     * @param bbsParam bbsParam
     */
    @RequestMapping(value="/admin/excelDownSuggest", method=RequestMethod.POST)
    public void excelDownSuggest(HttpServletRequest request, HttpServletResponse response,  BbsFileReply bbsParam) {
    	logger.info("AdminCommonController - excelDownSuggest");
    	try {
    		ArrayList<BbsFileReply> listSuggest = adminCtsBbsService.listSuggest(bbsParam);
    		
    		//워크북 생성
    		if(listSuggest != null && listSuggest.size() > 0) {
    			ExcelUtil excelCtr = new ExcelUtil();
    			
    			  HSSFWorkbook wb = new HSSFWorkbook();
    	  		  //시트 생성
    	  	  	  HSSFSheet sheet = wb.createSheet("고객제안목록");
    	  	  	  String titleArr[] = {"번호","제목","작성자","제안구분","개요/목적","현황/문제점","개선방안","기대효과","처리현황","등록일"};
    	  	  	  excelCtr.makeTitle(titleArr,wb,sheet,"center");
    	  	  	 
    	  	  	    // 리스트 내용 쓰기
    	        	HSSFRow row2 = null;
    	        	HSSFCell cell2 = null;
    		        int tableIndex = 0;
    		        int n = listSuggest.size();
    	        	for(int i=0; i<listSuggest.size(); i++){
    	        		listSuggest.get(i).setListNo(n);
    	        		n--;
    	        	}
    		        for(int j = 1; j< listSuggest.size()+1 ; j++){	
    			          row2 = sheet.createRow((short)j);
    			          for(int k=0; k<10; k++){
    			        	  String statusCd = listSuggest.get(tableIndex).getStatusCd();
    			        	  String statusNm = "";
    			        	  if(statusCd.equals("R")) {
    			        		  statusNm = "접수완료";
    			        	  } else if(statusCd.equals("I")) {
    			        		  statusNm = "처리중";
    			        	  } else if(statusCd.equals("C")) {
    			        		  statusNm = "처리완료";
    			        	  }
    			        	  
    			        	  if(k==0){
    			        		  excelCtr.createCell(wb,row2,cell2,k,Integer.toString(listSuggest.get(tableIndex).getListNo()),"center");
    			        		  sheet.setColumnWidth(k,3000);
    			        	  } else if(k==1){
    			        		  excelCtr.createCell(wb,row2,cell2,k, listSuggest.get(tableIndex).getSubject(),"center");
    			        		  sheet.setColumnWidth(k,5000);
    			        	  } else if(k==2){
    			        		  excelCtr.createCell(wb,row2,cell2,k, listSuggest.get(tableIndex).getUserNm(),"center");
    			        		  sheet.setColumnWidth(k,5000);
    			        	  } else if(k==3){
    			        		  String gbnCd = "";
    			        		  if(!GenericValidator.isBlankOrNull(listSuggest.get(tableIndex).getSuggestGbnCd())) {
    			        			  if(listSuggest.get(tableIndex).getSuggestGbnCd().equals("1")) {
    			        				  gbnCd = "공단직원";
    			        			  } else if(listSuggest.get(tableIndex).getSuggestGbnCd().equals("2")) {
    			        				  gbnCd = "주민제안";
    			        			  }
    			        		  }
    			        		  excelCtr.createCell(wb,row2,cell2,k,gbnCd,"center");
    			        		  sheet.setColumnWidth(k,5000);
    			        	  } else if(k==4){
    			        		  excelCtr.createCell(wb,row2,cell2,k, listSuggest.get(tableIndex).getPurpose(),"center");
    			        		  sheet.setColumnWidth(k,10000);
    			        	  } else if(k==5){
    			        		  excelCtr.createCell(wb,row2,cell2,k, listSuggest.get(tableIndex).getProblem(),"center");
    			        		  sheet.setColumnWidth(k,10000);
    			        	  } else if(k==6){
    			        		  excelCtr.createCell(wb,row2,cell2,k, listSuggest.get(tableIndex).getWay(),"center");
    			        		  sheet.setColumnWidth(k,10000);
    			        	  } else if(k==7){
    			        		  excelCtr.createCell(wb,row2,cell2,k, listSuggest.get(tableIndex).getEffect(),"center");
    			        		  sheet.setColumnWidth(k,10000);
    			        	  } else if(k==8){
    			        		  excelCtr.createCell(wb,row2,cell2,k, statusNm,"center");
    			        		  sheet.setColumnWidth(k,5000);
    			        	  } else if(k==9){
    			        		  String createYmd = "";
    			        		  if(!GenericValidator.isBlankOrNull(listSuggest.get(tableIndex).getCreateYmd())) {
    			        			  createYmd = listSuggest.get(tableIndex).getCreateYmd().substring(0,4)+"년"+
			    			        			  listSuggest.get(tableIndex).getCreateYmd().substring(4,6)+"월"+
			    			        			  listSuggest.get(tableIndex).getCreateYmd().substring(6,8)+"일  "+
			    			        			  listSuggest.get(tableIndex).getCreateHms().substring(0,2)+"시"+
			    			        			  listSuggest.get(tableIndex).getCreateHms().substring(2,4)+"분"+
			    			        			  listSuggest.get(tableIndex).getCreateHms().substring(4,6)+"초";
    			        		  }
    			        		  excelCtr.createCell(wb,row2,cell2,k, createYmd,"center");
    			        		  sheet.setColumnWidth(k,8000);
    			        	  }
											    			        			  
    			          }
    			          tableIndex++;
    			    }
    		        commonMkDir( excelCtr, request, response, wb,  "suggestMng", "고객제안목록_");
    		}
    		
		} catch (Exception e) {
			printStackTrace(e);
		}
    }
    
    /**
     * 민원관리 엑셀다운
     * @param request request
     * @param response response
     * @param minwonParam minwonParam
     */
    @RequestMapping(value="/admin/excelDownCptMng", method=RequestMethod.POST)
    public void excelDownCptMng(HttpServletRequest request, HttpServletResponse response,  Minwon minwonParam) {
    	logger.info("AdminCommonController - excelDownCptMng");
    	try {
    		
    		ArrayList<Minwon> listCptMng = adminCptMngService.listCptMng(minwonParam);
    		
    		if(listCptMng != null && listCptMng.size() > 0) {
    			ExcelUtil excelCtr = new ExcelUtil();
    			
    			  HSSFWorkbook wb = new HSSFWorkbook();
    	  		  //시트 생성
    	  	  	  HSSFSheet sheet = wb.createSheet("민원목록");
    	  	  	  String titleArr[] = {"번호","제목","작성자","성별","나이","사업장","분야","접수일","질문내용","답변담당자","답변내용","답변일","만족도","해피콜","처리상태"};
    	  	  	  excelCtr.makeTitle(titleArr,wb,sheet,"center");
    	  	  	  
    	  	 // 리스트 내용 쓰기
  	        	HSSFRow row2 = null;
  	        	HSSFCell cell2 = null;
  		        int tableIndex = 0;
  		        int n = listCptMng.size();
  	        	for(int i=0; i<listCptMng.size(); i++){
  	        		listCptMng.get(i).setListNo(n);
  	        		n--;
  	        	}
  		        for(int j = 1; j< listCptMng.size()+1 ; j++){	
  			          row2 = sheet.createRow((short)j);
  			          for(int k=0; k<15; k++){
  			        	  if(k==0){
  			        		  excelCtr.createCell(wb,row2,cell2,k,Integer.toString(listCptMng.get(tableIndex).getListNo()),"center");
  			        		sheet.setColumnWidth(k,3000);
  			        	  }
  			        	  else if(k==1){
  			        		  excelCtr.createCell(wb,row2,cell2,k, listCptMng.get(tableIndex).getSubject(),"center");
  			        		  sheet.setColumnWidth(k,5000);
  			        	  } else if(k==2){
  			        		  excelCtr.createCell(wb,row2,cell2,k, listCptMng.get(tableIndex).getqNm(),"center");
  			        		  sheet.setColumnWidth(k,5000);
  			        	  } else if(k==3){
  			        		  excelCtr.createCell(wb,row2,cell2,k, (listCptMng.get(tableIndex).getqSex().equals("1"))?"남":"여","center");
  			        		  sheet.setColumnWidth(k,5000);
  			        	  } else if(k==4){
  			        		  excelCtr.createCell(wb,row2,cell2,k, listCptMng.get(tableIndex).getqAge()+"세","center");
  			        		  sheet.setColumnWidth(k,5000);
  			        	  } else if(k==5){
  			        		  excelCtr.createCell(wb,row2,cell2,k, listCptMng.get(tableIndex).getUpNm(),"center");
  			        		  sheet.setColumnWidth(k,8000);
  			        	  } else if(k==6){
  			        		  excelCtr.createCell(wb,row2,cell2,k, listCptMng.get(tableIndex).getAreaNm(),"center");
  			        		  sheet.setColumnWidth(k,8000);
  			        	  } else if(k==7){
  			        		  excelCtr.createCell(wb,row2,cell2,k, listCptMng.get(tableIndex).getqCreateYmd(),"center");
  			        		  sheet.setColumnWidth(k,8000);
  			        	  } else if(k==8){
  			        		  excelCtr.createCell(wb,row2,cell2,k, listCptMng.get(tableIndex).getContent(),"center");
  			        		 sheet.setColumnWidth(k,10000);
  			        	  }
  			        	  
  			        	  if(GenericValidator.isBlankOrNull(listCptMng.get(tableIndex).getaCreateYmd())){
  			        		  continue;
  			        	  }
  			        	  
  			        	  if(k==9){
  			        		  String nm = "";
  			        		  if(!GenericValidator.isBlankOrNull(listCptMng.get(tableIndex).getaNm())) {
  			        			  nm = listCptMng.get(tableIndex).getaNm()+
  			        			  	   "("+listCptMng.get(tableIndex).getModiId()+")";
  			        		  }
  			        		  excelCtr.createCell(wb,row2,cell2,k, nm,"center");
  			        		  sheet.setColumnWidth(k,8000);
  			        	  } else if(k==10){
			        		  excelCtr.createCell(wb,row2,cell2,k, listCptMng.get(tableIndex).getaContent().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "").replaceAll("&nbsp;", " "),"center");
			        		  sheet.setColumnWidth(k,10000);
			        	  } else if(k==11){
			        		  excelCtr.createCell(wb,row2,cell2,k, listCptMng.get(tableIndex).getaCreateYmd(),"center");
			        		  sheet.setColumnWidth(k,8000);
			        	  } else if(k==12){
			        		  String scoreNm = "";
			        		  if(listCptMng.get(tableIndex).getScore() == 1) {
			        			  scoreNm = "매우불만족";
			        		  } else if(listCptMng.get(tableIndex).getScore() == 2) {
			        			  scoreNm = "불만족";
			        		  } else if(listCptMng.get(tableIndex).getScore() == 3) {
			        			  scoreNm = "보통";
			        		  } else if(listCptMng.get(tableIndex).getScore() == 4) {
			        			  scoreNm = "만족";
			        		  } else if(listCptMng.get(tableIndex).getScore() == 5) {
			        			  scoreNm = "매우만족";
			        		  }
			        		  excelCtr.createCell(wb,row2,cell2,k,scoreNm,"center");
			        		  sheet.setColumnWidth(k,5000);
			        	  } else if(k==13){
			        		  excelCtr.createCell(wb,row2,cell2,k, listCptMng.get(tableIndex).getHappyNm(),"center");
			        		  sheet.setColumnWidth(k,5000);
			        	  } else if(k==14){
			        		  String statusCd = "";
			        		  if(listCptMng.get(tableIndex).getStatusCd().equals("01")) {
			        			  statusCd = "접수대기";
			        		  } else if(listCptMng.get(tableIndex).getStatusCd().equals("02")) {
			        			  statusCd = "접수중";
			        		  } else if(listCptMng.get(tableIndex).getStatusCd().equals("03")) {
			        			  statusCd = "답변중";
			        		  } else if(listCptMng.get(tableIndex).getStatusCd().equals("04")) {
			        			  statusCd = "답변완료";
			        		  }
			        		  excelCtr.createCell(wb,row2,cell2,k, statusCd,"center");
			        		  sheet.setColumnWidth(k,5000);
			        	  }
  			          }
  			          tableIndex++;
  			    }
  		      commonMkDir( excelCtr, request, response, wb,  "cptMng", "민원목록_");
    		}
		} catch (Exception e) {
			printStackTrace(e);
		}
    }
    
    /**
     * 만족도 통계 엑셀 다운로드
     * @param request request
     * @param response response
     * @param minwonParam minwonParam
     */
	@RequestMapping(value="/admin/excelDownCptStat", method=RequestMethod.POST)
    public void excelDownCptStat(HttpServletRequest request, HttpServletResponse response,  Minwon minwonParam) {
    	logger.info("AdminCommonController - excelDownCptStat");
    	try {
    		ArrayList<Minwon> listCptStatsTotCnt = adminCptMngService.listCptStatsTotCnt(minwonParam);
    		ArrayList<Minwon> listCptStatsRight = adminCptMngService.listCptStatsRight(minwonParam);
    		
    		if(listCptStatsRight != null && listCptStatsRight.size() > 0) {
    			ExcelUtil excelCtr = new ExcelUtil();
    			  HSSFWorkbook wb = new HSSFWorkbook();
    	  		  //시트 생성
    	  	  	  HSSFSheet sheet = wb.createSheet("민원통계");
    	  	  	  String titleArr[] = new String[4];
    	  	  	  titleArr[0] = "사업장";
	    	  	  titleArr[1] = "접수사항";
	    	  	  String yearNm = "";
    	  	  	  if(minwonParam.getFlag().equals("year")){
    	  	  		titleArr[2] = "연도별";
    	  	  		yearNm = "년";
    	  	  	  } else if(minwonParam.getFlag().equals("area")){
    	  	  		titleArr[2] = "분야별";
    	  	  	  } else if(minwonParam.getFlag().equals("status")){
    	  	  		titleArr[2] = "만족도별";
    	  	  	  } else if(minwonParam.getFlag().equals("age")){
    	  	  		titleArr[2] = "연령대별";
    	  	  	  } else if(minwonParam.getFlag().equals("happyCall")){
    	  	  		titleArr[2] = "해피콜별";
    	  	  	  } else if(minwonParam.getFlag().equals("sex")){
    	  	  		titleArr[2] = "성별";
    	  	  	  } else if(minwonParam.getFlag().equals("answerDate")){
    	  	  		titleArr[2] = "처리기일별";
    	  	  	  }
    	  	  	  titleArr[3] = "민원수";
    	  	  	  
    	  	  	  excelCtr.makeTitle(titleArr,wb,sheet,"center");
    	  	  	  
    	  	    // 리스트 내용 쓰기
  	        	HSSFRow row2 = null;
  	        	HSSFCell cell2 = null;
  	        	int tableIndex = 0;
  	        	int tmpCnt = 0;
  	        	String tmp = "";
  	        	int startIdx = 0;
  	        	for(int j = 1; j< listCptStatsRight.size()+1 ; j++){
  	        		row2 = sheet.createRow((short)j);
  	        		for(int k=0; k<4; k++){
  	        			 if(k==0){
  	        				 excelCtr.createCell(wb,row2,cell2,k, listCptStatsRight.get(tableIndex).getLeftCodeNm() ,"center");
  	        				 sheet.setColumnWidth(k,5000);
  	        			 } else if(k==1){
  	        				 int cnt = 0;
  	        				 for(int aa = 0; aa < listCptStatsTotCnt.size(); aa++) {
  	        					if(listCptStatsTotCnt.get(aa).getCodeId().equals(listCptStatsRight.get(tableIndex).getLeftCodeId())) {
  	        						excelCtr.createCell(wb,row2,cell2,k, listCptStatsTotCnt.get(aa).getCnt()+"건","center");
  	  	        					cnt ++;	
  	        					}
  	        				 }
  	        				 if(cnt == 0) {
  	        					excelCtr.createCell(wb,row2,cell2,k, "0건","center");
  	        				 }
  	        				sheet.setColumnWidth(k,4000);
		        	     } else if(k==2){
		        	    	 excelCtr.createCell(wb,row2,cell2,k, listCptStatsRight.get(tableIndex).getMiddleCodeNm() + yearNm,"center");
		        	    	 sheet.setColumnWidth(k,4000);
		        	     } else if(k==3){
		        	    	 excelCtr.createCell(wb,row2,cell2,k, String.valueOf(listCptStatsRight.get(tableIndex).getCnt())+"건","center");
		        	    	 sheet.setColumnWidth(k,4000);
		        	     }
  	        		}
  	        		
  	        		if(tmp.equals("")) {
  	        			if(listCptStatsRight.size()-1 > tableIndex) {
	  	        			if(listCptStatsRight.get(tableIndex).getLeftCodeId().equals(listCptStatsRight.get(tableIndex+1).getLeftCodeId())){
	  	        				startIdx = j;
	  	  	        			tmp = listCptStatsRight.get(tableIndex).getLeftCodeId();
	  	  	        			tmpCnt++;	
	  	        			}
  	        			}
  	        		} else {
  	        			if(listCptStatsRight.size()-1 > tableIndex) {
  	        				if(tmp.equals(listCptStatsRight.get(tableIndex+1).getLeftCodeId())){
  	  	        				tmpCnt++;
  	  	        			} else {
  	  	        				tmp = "";
  	  	        				if(startIdx != (startIdx+tmpCnt)) {
	  	  	        				sheet.addMergedRegion(new Region(startIdx,(short)0,(startIdx+tmpCnt),(short)0));
	  	  	        				sheet.addMergedRegion(new Region(startIdx,(short)1,(startIdx+tmpCnt),(short)1));
  	  	        				}
  	  	        				tmpCnt = 0;
  	  	        			}	
  	        			} else {
  	        				if(startIdx != (startIdx+tmpCnt)) {
	  	        				sheet.addMergedRegion(new Region(startIdx,(short)0,(startIdx+tmpCnt),(short)0));
	  	        				sheet.addMergedRegion(new Region(startIdx,(short)1,(startIdx+tmpCnt),(short)1));
  	        				}
  	        			}
  	        		}
  	        		tableIndex++;
  	        	}
  	        	commonMkDir( excelCtr, request, response, wb,  "cptStat", "민원통계_");
    		}
		} catch (Exception e) {
			printStackTrace(e);
		}
    }
    
    
    /**
     * 만족도 통계 엑셀다운로드
     * @param request request
     * @param response response
     * @param minwonParam minwonParam
     */
    @RequestMapping(value="/admin/excelDownSatisStat", method=RequestMethod.POST)
    public void excelDownSatisStat(HttpServletRequest request, HttpServletResponse response,  Menu menuParam) {
    	logger.info("AdminCommonController - excelDownSatisStat");
    	try {
    		ArrayList<Menu> listSiteMap = adminCptMngService.listSiteMap();
			ArrayList<Menu> listSatisFactionStats =  adminCptMngService.listSatisFactionStats();
    		
    		if(listSiteMap != null && listSiteMap.size() > 0) {
    			ExcelUtil excelCtr = new ExcelUtil();
    			
    			  HSSFWorkbook wb = new HSSFWorkbook();
    	  		  //시트 생성
    	  	  	  HSSFSheet sheet = wb.createSheet("만족도통계");
    	  	  	  String titleArr[] = {"사이트구분","매우만족","만족","보통","불만족","매우불만족"};
    	  	  	  excelCtr.makeTitle(titleArr,wb,sheet,"center");
    	  	  	  
    	  	    // 리스트 내용 쓰기
  	        	HSSFRow row2 = null;
  	        	HSSFCell cell2 = null;
  		        int tableIndex = 0;
  		       
  		        for(int j = 1; j< listSiteMap.size()+1 ; j++){	
  			          row2 = sheet.createRow((short)j);
  			          for(int k=0; k<6; k++){
  			        	  
  			        	  String treeNm = listSiteMap.get(tableIndex).getTreeNm1();
  			        	  if(!GenericValidator.isBlankOrNull(listSiteMap.get(tableIndex).getTreeNm2())){
  			        		treeNm += " > " + listSiteMap.get(tableIndex).getTreeNm2();
  			        	  }
  			        	  if(!GenericValidator.isBlankOrNull(listSiteMap.get(tableIndex).getTreeNm3())){
  			        		treeNm += " > " + listSiteMap.get(tableIndex).getTreeNm3();  
			        	  }
  			        	  if(!GenericValidator.isBlankOrNull(listSiteMap.get(tableIndex).getTreeNm4())){
  			        		treeNm += listSiteMap.get(tableIndex).getTreeNm4();
			        	  }
  			        	  
  			        	   String socreCnt5 = "0";
	  			           String socreCnt4 = "0";
	  			           String socreCnt3 = "0";
	  			           String socreCnt2 = "0";
	  			           String socreCnt1 = "0";
  			        	  if(listSatisFactionStats != null && listSatisFactionStats.size() > 0) {
  			        		  for(int a = 0; a < listSatisFactionStats.size(); a++) {
  			        			  if(listSiteMap.get(tableIndex).getMenuSeq().equals(listSatisFactionStats.get(a).getMenuSeq())){
  			        				  if(listSatisFactionStats.get(a).getScoreVal().equals("5")){
  			        					  socreCnt5 = listSatisFactionStats.get(a).getScoreCnt();	  
  			        				  } else if(listSatisFactionStats.get(a).getScoreVal().equals("4")){
  			        					  socreCnt4 = listSatisFactionStats.get(a).getScoreCnt();
  			        				  } else if(listSatisFactionStats.get(a).getScoreVal().equals("3")){
  			        					  socreCnt3 = listSatisFactionStats.get(a).getScoreCnt();
  			        				  } else if(listSatisFactionStats.get(a).getScoreVal().equals("2")){
  			        					  socreCnt2 = listSatisFactionStats.get(a).getScoreCnt();
  			        				  } else if(listSatisFactionStats.get(a).getScoreVal().equals("1")){
  			        					  socreCnt1 = listSatisFactionStats.get(a).getScoreCnt();
  			        				  }
  			        			  }
  			        		  }
  			        	  }
  			        	  
  			        	  if(k==0){
  			        		  excelCtr.createCell(wb,row2,cell2,k, treeNm,"center");
  			        		  sheet.setColumnWidth(k,17000);
  			        	  } else if(k==1){
  			        		  excelCtr.createCell(wb,row2,cell2,k, socreCnt5+"명","center");
  			        		  sheet.setColumnWidth(k,5000);
  			        	  } else if(k==2){
  			        		  excelCtr.createCell(wb,row2,cell2,k, socreCnt4+"명","center");
  			        		  sheet.setColumnWidth(k,5000);
  			        	  } else if(k==3){
  			        		  excelCtr.createCell(wb,row2,cell2,k, socreCnt3+"명","center");
  			        		  sheet.setColumnWidth(k,5000);
  			        	  } else if(k==4){
  			        		  excelCtr.createCell(wb,row2,cell2,k, socreCnt2+"명","center");
  			        		  sheet.setColumnWidth(k,5000);
  			        	  } else if(k==5){		
  			        		  excelCtr.createCell(wb,row2,cell2,k, socreCnt1+"명","center");
  			        		  sheet.setColumnWidth(k,5000);
  			        	  }
  			          }
  			          tableIndex++;
  			    }
  		      commonMkDir( excelCtr, request, response, wb,  "satisfact", "만족도통계_");
    		}
		} catch (Exception e) {
			printStackTrace(e);
		}
    }
    
    
    /**
     * 회원가입통계 / 접속통계 공통 엑셀다운로드
     * @param request request
     * @param response response
     * @param commonParam commonParam
     */
    @RequestMapping(value="/admin/excelDownChart", method=RequestMethod.POST)
    public void excelDownChart(HttpServletRequest request, HttpServletResponse response,  Common commonParam) {
    	logger.info("AdminCommonController - excelDownChart");
    	try {
    		String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
        	commonParam.setTodayYmd(inDate);
        	String mainTab = request.getParameter("mainTab");
        	String subTab = request.getParameter("subTab");

        	if(mainTab.equals("0")) {
    			if(subTab.equals("0")) {
    				ArrayList<Common> listMemYear = adminLoginService.listMemYear(commonParam);
                	ArrayList<String> listYear = new ArrayList<String>();
                	ArrayList<String> listCnt = new ArrayList<String>();
                	 String titleArr[] = {"년도","가입수"};
                	commonSubTab0( listMemYear, listYear, listCnt,  request,  response, titleArr,"회원가입통계 - 년도별",mainTab);
    			} else if(subTab.equals("1")) {
        			//회원 - 월별
        			if(!GenericValidator.isBlankOrNull(commonParam.getSty())){
        				commonParam.setTodayYmd(commonParam.getSty());
        			}
        			ArrayList<Common> listMemMonth = adminLoginService.listMemMonth(commonParam);
                	ArrayList<String> listCnt = new ArrayList<String>();
      	  	  	  	String titleArr[] = {"월","가입수"};
                	commonSubTab1(listMemMonth,listCnt, request,  response,titleArr,"회원가입통계 - 월별",  mainTab);
        		} else if (subTab.equals("2")) {
        			//회원 - 일별
        			Calendar cal = Calendar.getInstance();
        			if(GenericValidator.isBlankOrNull(commonParam.getSty())) {
        				cal.set (cal.get(Calendar.YEAR),cal.get(Calendar.MONTH),1);
        			} else {
        				cal.set (Integer.parseInt(commonParam.getSty()),Integer.parseInt(commonParam.getStm())-1,1);
        				
        				if(commonParam.getStm().length() == 1 ) {
        					commonParam.setStm("0"+commonParam.getStm());
        				}
        				
        				commonParam.setTodayYmd(commonParam.getSty()+commonParam.getStm());
        			}
        			int maxDay = cal.getActualMaximum ( Calendar.DATE );
        			
        			ArrayList<Common> listMemDay = adminLoginService.listMemDay(commonParam);
                	ArrayList<String> listCnt = new ArrayList<String>();
                	String titleArr[] = {"일","가입수"};
                	commonSubTab2(listMemDay,listCnt,  request,  response, titleArr, "회원가입통계 - 일별",  mainTab,  maxDay);
        		} else if (subTab.equals("3")) {
        			//회원 - 요일별
        			ArrayList<Common> listMemDate = adminLoginService.listMemDate();
        			ArrayList<String> listDate = null;
        			listDate = returnListDate(listDate);
        			String titleArr[] = {"요일","가입수"};
        			commonSubTab3(listMemDate,listDate,  request,  response, titleArr, "회원가입통계 - 요일별",  mainTab);
        		} else if(subTab.equals("4")){
        			String[] testDate = DateUtil.getDiffDays(commonParam.getStYmd(), commonParam.getEdYmd());
        			ArrayList<Member> listMemSlctDate = adminLoginService.listMemSlctDate(commonParam);
        			String titleArr[] = {"선택기간","가입수"};
        			commonSubTab4(listMemSlctDate,  request,  response, titleArr,"회원가입통계 - 기간별",  mainTab,testDate);
        		}
        	} else if (mainTab.equals("1")) {
        		if(subTab.equals("0")) {
    				ArrayList<Common> listSiteYear = adminLoginService.listSiteYear(commonParam);
                	ArrayList<String> listYear = new ArrayList<String>();
                	ArrayList<String> listCnt = new ArrayList<String>();
        	  	  	String titleArr[] = {"년도","접속수"};
        	  	  	commonSubTab0( listSiteYear, listYear, listCnt,  request,  response, titleArr,"접속통계 - 년도별",mainTab);
    			}  else if(subTab.equals("1")) {
        			//사이트 - 월별
        			if(!GenericValidator.isBlankOrNull(commonParam.getSty())){
        				commonParam.setTodayYmd(commonParam.getSty());
        			}
        			
        			ArrayList<Common> listSiteMonth = adminLoginService.listSiteMonth(commonParam);
                	ArrayList<String> listCnt = new ArrayList<String>();
                	String titleArr[] = {"월","접속수"};
                	commonSubTab1(listSiteMonth,listCnt, request,  response,titleArr,"접속통계 - 월별",  mainTab);
        		} else if (subTab.equals("2")) {
        			//사이트 - 일별
        			Calendar cal = Calendar.getInstance();
        			if(GenericValidator.isBlankOrNull(commonParam.getSty())) {
        				cal.set (cal.get(Calendar.YEAR),cal.get(Calendar.MONTH),1);
        			} else {
        				cal.set (Integer.parseInt(commonParam.getSty()),Integer.parseInt(commonParam.getStm())-1,1);
        				if(commonParam.getStm().length() == 1 ) {
        					commonParam.setStm("0"+commonParam.getStm());
        				}
        				commonParam.setTodayYmd(commonParam.getSty()+commonParam.getStm());
        			}
        			
        			int maxDay = cal.getActualMaximum ( Calendar.DATE );
        			ArrayList<Common> listSiteDay = adminLoginService.listSiteDay(commonParam);
                	ArrayList<String> listCnt = new ArrayList<String>();
                	String titleArr[] = {"일","접속수"};
                	commonSubTab2(listSiteDay,listCnt,  request,  response, titleArr, "접속통계 - 일별",  mainTab,  maxDay);
        		}else if (subTab.equals("3")) {
        			//회원 - 요일별
        			ArrayList<Common> listSiteDate = adminLoginService.listSiteDate();
                	ArrayList<String> listDate = null;
        			listDate = returnListDate(listDate);
        			String titleArr[] = {"요일","접속수"};
        			commonSubTab3(listSiteDate,listDate,  request,  response, titleArr, "접속통계 - 요일별",  mainTab);
        		} else if(subTab.equals("4")){
        			String[] testDate = DateUtil.getDiffDays(commonParam.getStYmd(), commonParam.getEdYmd());
        			ArrayList<Member> listSiteSlctDate = adminLoginService.listSiteSlctDate(commonParam);
        			String titleArr[] = {"선택기간","접속수"};
        			commonSubTab4(listSiteSlctDate,  request,  response, titleArr,"접속통계 - 기간별",  mainTab,testDate);
        		}
        	}
		} catch (Exception e) {
			printStackTrace(e);
		}
    }
    
    /**
     * 공통 파일쓰기 + 다운로드
     * @param savePath savePath
     * @param excelNm excelNm
     * @param excelCtr excelCtr
     * @param request request
     * @param response response
     * @param wb wb
     */
    private void commonExcelFileDown(String savePath, String excelNm,ExcelUtil excelCtr, HttpServletRequest request, HttpServletResponse response, HSSFWorkbook wb){
    	  excelCtr.writeFilePath(savePath);
	  	  String fullFileName = savePath + excelNm;
	  	  // 엑셀 파일 쓰기
	  	  excelCtr.writeExcelFile(fullFileName,wb);
	  	  //저장후 다운로드 
	  	  excelCtr.downLoad(request,response,excelNm,savePath);
    }
    
    /**
     * 데이터없음 공통
     * @param excelCtr excelCtr
     * @param wb wb
     * @param sheet sheet
     * @param row2 row2
     * @param cell2 cell2
     */
    private void commonNoDataExcel(ExcelUtil excelCtr,HSSFWorkbook wb, HSSFSheet sheet,HSSFRow row2,HSSFCell cell2){
    	row2 = sheet.createRow((short)1);
		excelCtr.createCell(wb,row2,cell2,0,"데이터 없음","center");
		sheet.setColumnWidth(0,3000);
		excelCtr.createCell(wb,row2,cell2,1,"-","center");
		sheet.setColumnWidth(1,3000);
    }
    
    /**
     * 엑셀 공통 디렉토리 파일쓰기
     * @param excelCtr excelCtr
     * @param request request
     * @param response response
     * @param wb wb
     * @param dirNm dirNm
     * @param sheetNm sheetNm
     */
    private void commonMkDir(ExcelUtil excelCtr,HttpServletRequest request,HttpServletResponse response,HSSFWorkbook wb, String dirNm, String sheetNm){
    	//엑셀 파일경로 획득
  	  	String save_path = excelCtr.getFilePath(request,dirNm);
  	  	//엑셀 파일명 획득
  	  	String excelFileName = excelCtr.getExcelFileName(sheetNm);
  	  	commonExcelFileDown(save_path, excelFileName, excelCtr,  request,  response,  wb);
    }
    
    /**
     * 고정 list 요일 담기
     * @param listDate listDate
     * @return  ArrayList ArrayList
     */
    public ArrayList<String> returnListDate(ArrayList<String> listDate){
    		listDate = new ArrayList<String>();
	        listDate.add("일");
	        listDate.add("월");
	        listDate.add("화");
	        listDate.add("수");
	        listDate.add("목");
	        listDate.add("금");
	        listDate.add("토");
	        return listDate;
    }
    
    /**
     * 공통 년도별
     * @param list1 list1
     * @param list2 list2
     * @param list3 list3
     * @param request request
     * @param response response
     * @param titleArr titleArr
     * @param sheetNm sheetNm
     * @param mainTab mainTab
     */
    public void commonSubTab0(ArrayList<Common> list1,ArrayList<String> list2,ArrayList<String> list3, HttpServletRequest request, HttpServletResponse response,String titleArr[],String sheetNm, String mainTab){
    	for(Common common : list1) {
    		list2.add(common.getMemYear());
    		list3.add(String.valueOf(common.getMemCnt()));
		}
		ExcelUtil excelCtr = new ExcelUtil();
		HSSFWorkbook wb = new HSSFWorkbook();
	    //시트 생성
  	    HSSFSheet sheet = wb.createSheet(sheetNm);
  	    excelCtr.makeTitle(titleArr,wb,sheet,"center");
  	    // 리스트 내용 쓰기
    	HSSFRow row2 = null;
    	HSSFCell cell2 = null;
    	if(list2 != null && list2.size() > 0) {
		        int tableIndex = 0;
		        for(int j = 1; j< list2.size()+1 ; j++){	
			          row2 = sheet.createRow((short)j);
			          for(int k=0; k<2; k++){
			        	  if(k==0){
			        		  excelCtr.createCell(wb,row2,cell2,k,list2.get(tableIndex)+"년","center");
			        		  sheet.setColumnWidth(k,3000);
			        	  } else if(k==1){
			        		  excelCtr.createCell(wb,row2,cell2,k,list3.get(tableIndex)+"명","center");
			        		  sheet.setColumnWidth(k,5000);
			        	  } 
			          }
			          tableIndex++;
			    }
		} else {
			commonNoDataExcel( excelCtr, wb,  sheet, row2, cell2);
		}
    	if(mainTab.equals("0")) {
    		commonMkDir( excelCtr, request, response, wb,  "chartMember", "회원가입통계_년도별_");	
    	} else {
    		commonMkDir( excelCtr, request, response, wb,  "chartSite", "접속통계_년도별_");	
    	}
    }
    
    /**
     * 공통 월별
     * @param list1 list1
     * @param list2 list2
     * @param request request
     * @param response response
     * @param titleArr titleArr
     * @param sheetNm sheetNm
     * @param mainTab mainTab
     */
    public void commonSubTab1(ArrayList<Common> list1,ArrayList<String> list2,HttpServletRequest request, HttpServletResponse response,String titleArr[],String sheetNm, String mainTab){
    	for(int i=1; i<13; i++){
    		int cnt = 0;
    		String tmpMemCnt = "";
    		for(Common common : list1) {
    			if(Integer.parseInt(common.getMemMonth()) == i){
    				cnt++;
    				tmpMemCnt = String.valueOf(common.getMemCnt());
    				break;
    			}
    		}
    		if(cnt == 0) {
    			list2.add("0");
    		} else{
    			list2.add(tmpMemCnt);
    		}
    	}
    	if(list2 != null && list2.size() > 0) {
			ExcelUtil excelCtr = new ExcelUtil();
			HSSFWorkbook wb = new HSSFWorkbook();
	  		  //시트 생성
	  	  	  HSSFSheet sheet = wb.createSheet(sheetNm);
	  	  	  excelCtr.makeTitle(titleArr,wb,sheet,"center");
	  	  	    // 리스트 내용 쓰기
	        	HSSFRow row2 = null;
	        	HSSFCell cell2 = null;
		        int tableIndex = 0;
		        
		        for(int j = 1; j< 13 ; j++){	
			          row2 = sheet.createRow((short)j);
			          for(int k=0; k<2; k++){
			        	  if(k==0){
			        		  excelCtr.createCell(wb,row2,cell2,k,String.valueOf(j)+"월","center");
			        		  sheet.setColumnWidth(k,3000);
			        	  } else if(k==1){
			        		  excelCtr.createCell(wb,row2,cell2,k,list2.get(tableIndex)+"명","center");
			        		  sheet.setColumnWidth(k,5000);
			        	  } 
			          }
			          tableIndex++;
			    }
		        if(mainTab.equals("0")) {
		    		commonMkDir( excelCtr, request, response, wb,  "chartMember", "회원가입통계_월별_");	
		    	} else {
		    		commonMkDir( excelCtr, request, response, wb,  "chartSite", "접속통계_년도별_");	
		    	}
		}
    }
    
    /**
     * 공통 일별
     * @param list1 list1
     * @param list2 list2
     * @param request request
     * @param response response
     * @param titleArr titleArr
     * @param sheetNm sheetNm
     * @param mainTab mainTab
     * @param maxDay maxDay
     */
    public void commonSubTab2(ArrayList<Common> list1,ArrayList<String> list2, HttpServletRequest request, HttpServletResponse response,String titleArr[],String sheetNm, String mainTab, int maxDay){
    	for(int i=1; i<=maxDay; i++){
    		int cnt = 0;
    		String tmpMemCnt = "";
    		for(int j = 0; j<list1.size(); j++) {
    			if(Integer.parseInt(list1.get(j).getMemDay()) == i){
    				cnt++;
    				tmpMemCnt = String.valueOf(list1.get(j).getMemCnt());
    				break;
    			}
    		}
    		if(cnt == 0) {
    			list2.add("0");
    		} else{
    			list2.add(tmpMemCnt);
    		}
    	}
    	
    	if(list2 != null && list2.size() > 0) {
			ExcelUtil excelCtr = new ExcelUtil();
			HSSFWorkbook wb = new HSSFWorkbook();
	  		  //시트 생성
	  	  	  HSSFSheet sheet = wb.createSheet(sheetNm);
	  	  	  excelCtr.makeTitle(titleArr,wb,sheet,"center");
	  	  	    // 리스트 내용 쓰기
	        	HSSFRow row2 = null;
	        	HSSFCell cell2 = null;
		        int tableIndex = 0;
		        for(int j = 1; j< maxDay+1 ; j++){	
			          row2 = sheet.createRow((short)j);
			          for(int k=0; k<2; k++){
			        	  if(k==0){
			        		  excelCtr.createCell(wb,row2,cell2,k,String.valueOf(j)+"일","center");
			        		  sheet.setColumnWidth(k,3000);
			        	  } else if(k==1){
			        		  excelCtr.createCell(wb,row2,cell2,k,list2.get(tableIndex)+"명","center");
			        		  sheet.setColumnWidth(k,5000);
			        	  } 
										    			        			  
			          }
			          tableIndex++;
			    }
		        if(mainTab.equals("0")) {
		        	commonMkDir( excelCtr, request, response, wb,  "chartMember", "회원가입통계_일별_");	
		    	} else {
		    		commonMkDir( excelCtr, request, response, wb,  "chartSite", "접속통계_일별_");	
		    	}
		}
    }
    
    /**
     * 공통 요일별
     * @param list1 list1
     * @param list2 list2
     * @param request request
     * @param response response
     * @param titleArr titleArr
     * @param sheetNm sheetNm
     * @param mainTab mainTab
     */
    public void commonSubTab3(ArrayList<Common> list1,ArrayList<String> list2, HttpServletRequest request, HttpServletResponse response,String titleArr[],String sheetNm, String mainTab){
    	if(list1 != null && list1.size() > 0) {
			ExcelUtil excelCtr = new ExcelUtil();
			HSSFWorkbook wb = new HSSFWorkbook();
	  		  //시트 생성
	  	  	  HSSFSheet sheet = wb.createSheet(sheetNm);
	  	  	  excelCtr.makeTitle(titleArr,wb,sheet,"center");
	  	  	  
	  	  	    // 리스트 내용 쓰기
	        	HSSFRow row2 = null;
	        	HSSFCell cell2 = null;
		        int tableIndex = 0;
		       
	        	for(int j = 1; j< list2.size()+1 ; j++){	
		          row2 = sheet.createRow((short)j);
		          for(int k=0; k<2; k++){
		        	  if(k==0){
		        		  excelCtr.createCell(wb,row2,cell2,k,list2.get(tableIndex),"center");
		        		  sheet.setColumnWidth(k,3000);
		        	  } else if(k==1){
		        		  excelCtr.createCell(wb,row2,cell2,k,list1.get(tableIndex).getMemCnt()+"명","center");
		        		  sheet.setColumnWidth(k,5000);
		        	  } 
		          }
		          tableIndex++;
			    }
	        	if(mainTab.equals("0")) {
	        		commonMkDir( excelCtr, request, response, wb,  "chartMember", "회원가입통계_요일별_");	
		    	} else {
		    		commonMkDir( excelCtr, request, response, wb,  "chartSite", "접속통계_요일별_");	
		    	}
		}
		       
    }
    
    /**
     * 공통 기간별
     * @param list1 list1
     * @param request request
     * @param response response
     * @param titleArr titleArr
     * @param sheetNm sheetNm
     * @param mainTab mainTab
     * @param testDate testDate
     */
    public void commonSubTab4(ArrayList<Member> list1, HttpServletRequest request, HttpServletResponse response,String titleArr[],String sheetNm, String mainTab,String[] testDate){
    	ArrayList<String> listCnt = new ArrayList<String>();
    	ArrayList<String> listMemSlctDateNm = new ArrayList<String>();
		if(testDate != null && testDate.length > 0){
			for(int i=0; i<testDate.length; i++) {
				listMemSlctDateNm.add(testDate[i]);
				int cnt = 0;
				for(int j=0; j<list1.size(); j++) {
					if(testDate[i].equals(list1.get(j).getSignYmd())) {
						listCnt.add(String.valueOf(list1.get(j).getMemCnt()));
						cnt++;
					}
				}
				if(cnt == 0) {
					listCnt.add("0");
				}
			}
		}
		
		if(listMemSlctDateNm != null && listMemSlctDateNm.size() > 0) {
			ExcelUtil excelCtr = new ExcelUtil();
			HSSFWorkbook wb = new HSSFWorkbook();
	  		  //시트 생성
	  	  	  HSSFSheet sheet = wb.createSheet(sheetNm);
	  	  	  excelCtr.makeTitle(titleArr,wb,sheet,"center");
	  	  	    // 리스트 내용 쓰기
	        	HSSFRow row2 = null;
	        	HSSFCell cell2 = null;
		        int tableIndex = 0;
		       
	        	for(int j = 1; j< listCnt.size()+1 ; j++){	
		          row2 = sheet.createRow((short)j);
		          for(int k=0; k<2; k++){
		        	  if(k==0){
		        		  excelCtr.createCell(wb,row2,cell2,k,listMemSlctDateNm.get(tableIndex),"center");
		        		  sheet.setColumnWidth(k,3000);
		        	  } else if(k==1){
		        		  excelCtr.createCell(wb,row2,cell2,k,listCnt.get(tableIndex)+"명","center");
		        		  sheet.setColumnWidth(k,5000);
		        	  } 
		          }
		          tableIndex++;
			    }
	        	if(mainTab.equals("0")) {
	        		commonMkDir( excelCtr, request, response, wb,  "chartMember", "회원가입통계_기간별_");	
		    	} else {
		    		commonMkDir( excelCtr, request, response, wb,  "chartSite", "접속통계_기간별_");	
		    	}
		}
		       
    }
    
    /**
     * 로그 목록 엑셀다운
     * @param request request
     * @param response response
     * @param memberParam memberParam
     */
    @RequestMapping(value="/admin/excelDownLog", method=RequestMethod.POST)
    public void excelDownLog(HttpServletRequest request, HttpServletResponse response,Common commonParam  ) {
    	logger.info("AdminCommonController - excelDownLog");
		
    	try {
    		ArrayList<Common> listLogMng = adminLogMngService.listLogMng(commonParam);
    		//워크북 생성
    		if(listLogMng != null && listLogMng.size() > 0) {
    			ExcelUtil excelCtr = new ExcelUtil();
    			
    			HSSFWorkbook wb = new HSSFWorkbook();
    	  		  //시트 생성
    	  	  	  HSSFSheet sheet = wb.createSheet("로그목록");
    	  	  	  String titleArr[] = {"번호","아이디","접속URL","접속아이피","접속시간"};
    	  	  	  excelCtr.makeTitle(titleArr,wb,sheet,"center");
    	  	  	 
    	  	  	  	// 리스트 내용 쓰기
    	        	HSSFRow row2 = null;
    	        	HSSFCell cell2 = null;
    		        int tableIndex = 0;
    		        int n = listLogMng.size();
    	        	for(int i=0; i<listLogMng.size(); i++){
    	        		listLogMng.get(i).setListNo(n);
    	        		n--;
    	        	}
    		        for(int j = 1; j< listLogMng.size()+1 ; j++){	
    			          row2 = sheet.createRow((short)j);
    			          for(int k=0; k<5; k++){
    			        	  if(k==0){
    			        		  excelCtr.createCell(wb,row2,cell2,k,Integer.toString(listLogMng.get(tableIndex).getListNo()),"center");
    			        		  sheet.setColumnWidth(k,3000);
    			        	  } else if(k==1){
    			        		  excelCtr.createCell(wb,row2,cell2,k,listLogMng.get(tableIndex).getCreateId(),"center");
    			        		  sheet.setColumnWidth(k,5000);
    			        	  } else if(k==2){
    			        		  excelCtr.createCell(wb,row2,cell2,k,listLogMng.get(tableIndex).getLogUrl(),"center");
    			        		  sheet.setColumnWidth(k,15000);
    			        	  } else if(k==3){
    			        		  excelCtr.createCell(wb,row2,cell2,k,listLogMng.get(tableIndex).getCreateIp(),"center");
    			        		  sheet.setColumnWidth(k,5000);
    			        	  } else if(k==4){
    			        		  String createYmd = "";
    			        		  if(!GenericValidator.isBlankOrNull(listLogMng.get(tableIndex).getCreateYmd())) {
    			        			  createYmd = listLogMng.get(tableIndex).getCreateYmd().substring(0,4)+"년"+
			    			        			  listLogMng.get(tableIndex).getCreateYmd().substring(4,6)+"월"+
			    			        			  listLogMng.get(tableIndex).getCreateYmd().substring(6,8)+"일  "+
			    			        			  listLogMng.get(tableIndex).getCreateHms().substring(0,2)+"시"+
			    			        			  listLogMng.get(tableIndex).getCreateHms().substring(2,4)+"분"+
			    			        			  listLogMng.get(tableIndex).getCreateHms().substring(4,6)+"초";
    			        		  }
    			        		  
    			        		  excelCtr.createCell(wb,row2,cell2,k,createYmd,"center");
    			        		  sheet.setColumnWidth(k,10000);
    			        	  }
    			          }
    			          tableIndex++;
    			    }
    		        commonMkDir( excelCtr, request, response, wb,  "logMng", "로그목록_");
    		}
    		
		} catch (Exception e) {
			printStackTrace(e);
		}
    }
    
    private void printStackTrace(Exception e){
    	logger.error("======= error =========");
		ByteArrayOutputStream out = new ByteArrayOutputStream();
	    PrintStream pinrtStream = new PrintStream(out);
	    e.printStackTrace(pinrtStream);
	    String stackTraceString = out.toString();
	    logger.error(stackTraceString);
    }
}