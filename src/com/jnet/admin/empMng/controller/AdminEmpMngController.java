package com.jnet.admin.empMng.controller;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.ListIterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.validator.GenericValidator;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jnet.admin.empMng.service.AdminEmpMngService;
import com.jnet.admin.login.service.AdminLoginService;
import com.jnet.admin.mgrMng.service.AdminMgrMngService;
import com.jnet.domain.Admin;
import com.jnet.domain.Common;
import com.jnet.domain.Emp;
import com.jnet.domain.Menu;
import com.jnet.util.FileUtil;
import com.jnet.util.PageUtil;

@Controller
public class AdminEmpMngController {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private AdminEmpMngService adminEmpMngService;
	@Autowired
	private AdminLoginService adminLoginService;
	@Autowired
	private AdminMgrMngService aminMgrMngService;
	 /**
     * 조직관리 목록 조회
     * @return String String
     */
    @RequestMapping("/admin/listEmpMng")
    public String listEmpMng(Model model, Emp empParam) {
    	logger.info("AdminEmpMngController - listEmpMng");
    	PageUtil PageUtil = new PageUtil();
		try {
			commonMenu(model, empParam);
			
			int numPerPage   = 10;  // 한 화면에 보여주는 게시물 수
			int total_page = 0;
			int findEmpTotCnt = 0;
			
			//초기 페이지 로딩될때 NULL값일 경우 1페이지로 고정시켜준다.
			if(GenericValidator.isBlankOrNull(empParam.getPageNum())) empParam.setPageNum("1");
			if(GenericValidator.isBlankOrNull(empParam.getSearchKey()))  empParam.setSearchKey("all");
			if(GenericValidator.isBlankOrNull(empParam.getEmpOutYn()))  empParam.setEmpOutYn("all");
			if(GenericValidator.isBlankOrNull(empParam.getSearchVal())) empParam.setSearchVal("");
			
			model.addAttribute("searchKey",empParam.getSearchKey());
			model.addAttribute("empOutYn",empParam.getEmpOutYn());
			model.addAttribute("searchVal",empParam.getSearchVal());
			
			int current_page = 1;   // 현재페이지 번호
			if(!GenericValidator.isBlankOrNull(empParam.getPageNum())) current_page = Integer.parseInt(empParam.getPageNum());
			findEmpTotCnt = adminEmpMngService.findEmpTotCnt(empParam);
			if(findEmpTotCnt > 0) total_page = PageUtil.getPageCount(numPerPage,  findEmpTotCnt) ;

			// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
	        if(total_page < current_page && total_page != 0) current_page = total_page;	

	        // 리스트에 출력할 데이터를 가져오기
	        int end   = current_page * numPerPage;
	        int start = end - (numPerPage - 1);
	        empParam.setStart(start);
	        empParam.setEnd(end);
	        
	        if(total_page > current_page) {
	        	//최종페이지 기본 수 만큼 set
	        	empParam.setShowPage(numPerPage);
	        }else {
	        	if(current_page == 1) {
	        		//첫페이지일 경우 총 수만큼 보여준다 (10개가 안되기 때문에)
	        		empParam.setShowPage(findEmpTotCnt);
	        	} else {
	        		//마지막 페이지 총페이지 개수에서 데이터 총수를 뺀다
	        		empParam.setShowPage(findEmpTotCnt - ((current_page-1) * numPerPage));	
	        	}
	        }
	        
	        empParam.setNumperPage(numPerPage);
	        empParam.setCurrentPage(numPerPage*current_page);
	        
	        
			ArrayList<Emp> listEmpMng = adminEmpMngService.listEmpMng(empParam);
			 // 목록번호를 화면에 출력하기 위한 로직
	        listNoSet( empParam,listEmpMng, start, findEmpTotCnt);
	        model.addAttribute("listEmpMng",listEmpMng);
	        if(listEmpMng != null && listEmpMng.size() > 0)  model.addAttribute("pageIndexList",PageUtil.pageIndexList(current_page,total_page));	
		} catch (Exception e) {
			printStackTrace(e);
		}
        return "admin/empMng/listEmpMng";
    }
    
    /**
     * 조직관리 목록 조회
     * @return String String
     */
    @RequestMapping("/admin/listEmpMngPop")
    public String listEmpMngPop(Model model, Emp empParam) {
    	logger.info("AdminEmpMngController - listEmpMngPop");
    	PageUtil PageUtil = new PageUtil();
		try {
			int numPerPage   = 10;  // 한 화면에 보여주는 게시물 수
			int total_page = 0;
			int findEmpTotCnt = 0;
			
			//초기 페이지 로딩될때 NULL값일 경우 1페이지로 고정시켜준다.
			if(GenericValidator.isBlankOrNull(empParam.getPageNum())) 	empParam.setPageNum("1");
			if(GenericValidator.isBlankOrNull(empParam.getSearchKey())) empParam.setSearchKey("all");
			if(GenericValidator.isBlankOrNull(empParam.getSearchVal())) empParam.setSearchVal("");
			
			model.addAttribute("searchKey",empParam.getSearchKey());
			model.addAttribute("searchVal",empParam.getSearchVal());
			
			int current_page = 1;   // 현재페이지 번호
			if(!GenericValidator.isBlankOrNull(empParam.getPageNum()))	current_page = Integer.parseInt(empParam.getPageNum());
			findEmpTotCnt = adminEmpMngService.findEmpTotCnt(empParam);
			if(findEmpTotCnt > 0) total_page = PageUtil.getPageCount(numPerPage,  findEmpTotCnt) ;

			// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
	        if(total_page < current_page && total_page != 0) current_page = total_page;	
	        // 리스트에 출력할 데이터를 가져오기
	        int end   = current_page * numPerPage;
	        int start = end - (numPerPage - 1);
	        empParam.setStart(start);
	        empParam.setEnd(end);
	        
	        if(total_page > current_page) {
	        	//최종페이지 기본 수 만큼 set
	        	empParam.setShowPage(numPerPage);
	        }else {
	        	if(current_page == 1) {
	        		//첫페이지일 경우 총 수만큼 보여준다 (10개가 안되기 때문에)
	        		empParam.setShowPage(findEmpTotCnt);
	        	} else {
	        		//마지막 페이지 총페이지 개수에서 데이터 총수를 뺀다
	        		empParam.setShowPage(findEmpTotCnt - ((current_page-1) * numPerPage));	
	        	}
	        }
	        
	        empParam.setCurrentPage(numPerPage*current_page);
	        
			ArrayList<Emp> listEmpMng = adminEmpMngService.listEmpMng(empParam);
			
			 // 목록번호를 화면에 출력하기 위한 로직
			listNoSet( empParam,listEmpMng, start, findEmpTotCnt);
	        model.addAttribute("listEmpMng",listEmpMng);
	        if(listEmpMng != null && listEmpMng.size() > 0) model.addAttribute("pageIndexList",PageUtil.pageIndexList(current_page,total_page));	
		} catch (Exception e) {
			printStackTrace(e);
		}
        return "admin/empMng/listEmpMngPop";
    }
    
    
    /**
     * 조직관리 등록폼
     * 
     * @param model model
     * @return String String
     */
	@RequestMapping("/admin/formCreateEmpMng")
    public String formCreateEmpMng(Model model, Emp empParam) {
		try {
			logger.info("AdminEmpMngController - formCreateEmpMng");
			commonMenu(model, empParam);
			
			// select box 리스트
			Common commonParam = null; 
			commonParam = new Common();
			commonParam.setCodeGbnCd("mail");
			model.addAttribute("mailList",aminMgrMngService.listFacil(commonParam));
			commonParam = new Common();
			commonParam.setCodeGbnCd("phonearea");
			commonParam.setCodeId("01");
			model.addAttribute("mobileList",aminMgrMngService.listFacil(commonParam));
			commonParam = new Common();
			commonParam.setCodeGbnCd("phonearea");
			commonParam.setCodeId("00");
			model.addAttribute("phoneList",aminMgrMngService.listFacil(commonParam));
		} catch (Exception e) {
			printStackTrace(e);
		}
    	return "admin/empMng/formCreateEmpMng";
    }
	
    /**
     * 조직관리 수정폼
     * 
     * @param model model
     * @return String String
     */
	@RequestMapping(value="/admin/formUpdateEmpMng",method=RequestMethod.POST)
    public String formUpdateEmpMng(Model model, Emp empParam) {
		try {
			logger.info("AdminEmpMngController - formUpdateEmpMng");
			commonMenu(model, empParam);
			
			//상세조회
			Emp findEmpMng = adminEmpMngService.findEmpMng(empParam);
			model.addAttribute("findEmpMng",findEmpMng);
			
			// select box 리스트
			Common commonParam = null; 
			commonParam = new Common();
			commonParam.setCodeGbnCd("mail");
			model.addAttribute("mailList",aminMgrMngService.listFacil(commonParam));
			commonParam = new Common();
			commonParam.setCodeGbnCd("phonearea");
			commonParam.setCodeId("01");
			model.addAttribute("mobileList",aminMgrMngService.listFacil(commonParam));
			commonParam = new Common();
			commonParam.setCodeGbnCd("phonearea");
			commonParam.setCodeId("00");
			model.addAttribute("phoneList",aminMgrMngService.listFacil(commonParam));
		} catch (Exception e) {
			printStackTrace(e);
		}
    	return "admin/empMng/formUpdateEmpMng";
    }
    
	/**
     * 조직관리 등록
     * 
     * @param model model
     * @return String String
     */
    @RequestMapping(value="/admin/saveEmpMng",method=RequestMethod.POST)
    public String saveEmpMng(HttpServletRequest request, Emp empParam) {
    	try {
    		logger.info("AdminEmpMngController - saveEmpMng");
    		String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
            String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
            Admin admInfo = (Admin) request.getSession().getAttribute("adminInfo");
            
            empParam.setCreateYmd(inDate);
            empParam.setCreateHms(inTime);
            empParam.setCreateIp(request.getRemoteAddr());
            empParam.setCreateId(admInfo.getAdmId());
        	
            String deptNm = empParam.getEmpDept();
        	if(deptNm.trim().indexOf("기획경영") >= 0) {
        		empParam.setEmpOrder(1);
        	} else if(deptNm.trim().indexOf("생활관") >= 0) {
        		empParam.setEmpOrder(2);
        	} else if(deptNm.trim().indexOf("구민회관") >= 0) {
        		empParam.setEmpOrder(3);
        	} else if(deptNm.trim().indexOf("체육센터") >= 0) {
        		empParam.setEmpOrder(4);
        	} else if(deptNm.trim().indexOf("주차사업") >= 0) {
        		empParam.setEmpOrder(5);
        	} else if(deptNm.trim().indexOf("공공시설") >= 0) {
        		empParam.setEmpOrder(6);
        	}
        	
    		adminEmpMngService.saveEmpMng(empParam);	
		} catch (Exception e) {
			printStackTrace(e);
		}
    	return "redirect:/admin/listEmpMng?gseq="+empParam.getGseq()+"&lseq="+empParam.getLseq();
    }
    
    /**
     * 조직관리 수정
     * 
     * @param model model
     * @return String String
     */
    @RequestMapping(value="/admin/updateEmpMng",method=RequestMethod.POST)
    public String updateEmpMng(HttpServletRequest request, Emp empParam) {
    	try {
    		logger.info("AdminEmpMngController - updateEmpMng");
    		String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
            String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
            Admin admInfo = (Admin) request.getSession().getAttribute("adminInfo");
            
            empParam.setModiYmd(inDate);
            empParam.setModiHms(inTime);
            empParam.setModiIp(request.getRemoteAddr());
            empParam.setModiId(admInfo.getAdmId());
        	
            String deptNm = empParam.getEmpDept();
        	if(deptNm.trim().indexOf("기획경영") >= 0) {
        		empParam.setEmpOrder(1);
        	} else if(deptNm.trim().indexOf("생활관") >= 0) {
        		empParam.setEmpOrder(2);
        	} else if(deptNm.trim().indexOf("구민회관") >= 0) {
        		empParam.setEmpOrder(3);
        	} else if(deptNm.trim().indexOf("체육센터") >= 0) {
        		empParam.setEmpOrder(4);
        	} else if(deptNm.trim().indexOf("주차사업") >= 0) {
        		empParam.setEmpOrder(5);
        	} else if(deptNm.trim().indexOf("공공시설") >= 0) {
        		empParam.setEmpOrder(6);
        	}
        	
    		adminEmpMngService.updateEmpMng(empParam);	
		} catch (Exception e) {
			printStackTrace(e);
		}
    	return "redirect:/admin/listEmpMng?gseq="+empParam.getGseq()+"&lseq="+empParam.getLseq();
    }
    
    @SuppressWarnings("deprecation")
	@RequestMapping(value="/admin/saveExcelBatch",method=RequestMethod.POST)
    public String saveExcelBatch(HttpServletRequest request, Emp empParam) {
    	
    	logger.info("AdminEmpMngController - saveExcelBatch");
    	
    	ArrayList<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
    	Map<String, Object> hmap = null;
    	
    	if(GenericValidator.isBlankOrNull(empParam.getSearchKey())) empParam.setSearchKey("all");
		if(GenericValidator.isBlankOrNull(empParam.getSearchVal())) empParam.setSearchVal("");
		
    	try {
    		ArrayList<Emp> listAllMng = adminEmpMngService.listAllMng(empParam);
    		
    		if(empParam.getBatchFile().getOriginalFilename()
    				.substring(empParam.getBatchFile().getOriginalFilename().lastIndexOf(".") + 1).equals("xls")) {
    			HSSFWorkbook workbook = new HSSFWorkbook(empParam.getBatchFile().getInputStream());
    			
    			int i = 0;
        		short c = 0;
        		HSSFSheet sheet = workbook.getSheetAt(0);
        		int rows = sheet.getPhysicalNumberOfRows();
        		for(i=1; i<rows; i++) {
        			HSSFRow row = sheet.getRow(i);
        			if(row != null) {
        				hmap = new HashMap<String,Object>();
        				int cells = row.getPhysicalNumberOfCells();
        				for(c = 0; c<=cells;c++) {
        					HSSFCell cell = row.getCell(c);
        					String value="";
        					if(cell == null) {
        						hmap.put("CELL"+c, null);
        						continue;
        					} else {
        						switch (cell.getCellType()) {
    	    						case HSSFCell.CELL_TYPE_FORMULA:
    	    			                value = cell.getCellFormula();
    	    			                break;
    	    			               case HSSFCell.CELL_TYPE_NUMERIC:
    	    			                value =""+(int)cell.getNumericCellValue();
    	    			                break;
    	    			               case HSSFCell.CELL_TYPE_STRING:
    	    			                value =""+cell.getStringCellValue();
    	    			                break;
    	    			               case HSSFCell.CELL_TYPE_BLANK:
    	    			                value =""+cell.getBooleanCellValue();
    	    			                break;
    	    			               case HSSFCell.CELL_TYPE_ERROR:
    	    			                value=""+cell.getErrorCellValue();
    	    			                break;
    	    			               default:
        						}
        						hmap.put("CELL"+c, value);
        					}
        				}
        				if(listAllMng != null && listAllMng.size() > 0) {
        					int cnt = 0;
        					for(Emp empTmp : listAllMng){
            					if(empTmp.getEmpNo().trim().equals(hmap.get("CELL0").toString().trim())) {
            						cnt ++;
            					}
            				}
        					if(cnt == 0) {
        						list.add(hmap);
        					}
        				} else {
        					list.add(hmap);	
        				}
        			}    
        		}
    		} else {
    			XSSFWorkbook workbook = new XSSFWorkbook(empParam.getBatchFile().getInputStream());
    			int i = 0;
        		short c = 0;
        		XSSFSheet sheet = workbook.getSheetAt(0);
        		int rows = sheet.getPhysicalNumberOfRows();
        		for(i=1; i<rows; i++) {
        			XSSFRow row = sheet.getRow(i);
        			if(row != null) {
        				hmap = new HashMap<String,Object>();
        				int cells = row.getPhysicalNumberOfCells();
        				
        				for(c = 0; c<=cells;c++) {
        					XSSFCell cell = row.getCell(c);
        					String value="";
        					if(cell == null) {
        						hmap.put("CELL"+c, null);
        						continue;
        					} else {
        						switch (cell.getCellType()) {
    	    						case HSSFCell.CELL_TYPE_FORMULA:
    	    			                value = cell.getCellFormula();
    	    			                break;
    	    			               case HSSFCell.CELL_TYPE_NUMERIC:
    	    			                value =""+(int)cell.getNumericCellValue();
    	    			                break;
    	    			               case HSSFCell.CELL_TYPE_STRING:
    	    			                value =""+cell.getStringCellValue();
    	    			                break;
    	    			               case HSSFCell.CELL_TYPE_BLANK:
    	    			                value =""+cell.getBooleanCellValue();
    	    			                break;
    	    			               case HSSFCell.CELL_TYPE_ERROR:
    	    			                value=""+cell.getErrorCellValue();
    	    			                break;
    	    			               default:
    	    			            	value =""+cell.getStringCellValue();
        						}
        						hmap.put("CELL"+c, value);
        					}
        				}
        				if(listAllMng != null && listAllMng.size() > 0) {
        					int cnt = 0;
        					for(Emp empTmp : listAllMng){
            					if(empTmp.getEmpNo().trim().equals(hmap.get("CELL0").toString().trim())) {
            						cnt ++;
            					}
            				}
        					if(cnt == 0) {
        						list.add(hmap);
        					}
        				} else {
        					list.add(hmap);	
        				}
        			}    
        		}
    		}
    		
            if(list != null && list.size()> 0) {
            	
            	String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
                String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
                Admin admInfo = (Admin) request.getSession().getAttribute("adminInfo");
                
            	ArrayList<Emp> empList = new ArrayList<Emp>();
        		Emp emp = null;
        		for(Map<String, Object> test : list) {
        			emp = new Emp();
        			Iterator<String> iterator = test.keySet().iterator();
        		    while (iterator.hasNext()) {
        		        String key = (String) iterator.next();
        		        if(key.equals("CELL0")) {
        		        	emp.setEmpNo((String)test.get(key)); 	
        		        } else if(key.equals("CELL1")) {
        		        	emp.setEmpNm((String)test.get(key));
        		        }else if(key.equals("CELL3")) {
        		        	String deptNm = (String)test.get(key);
        		        	if(deptNm.trim().indexOf("기획경영") >= 0) {
        		        		emp.setEmpOrder(1);
        		        	} else if(deptNm.trim().indexOf("생활관") >= 0) {
        		        		emp.setEmpOrder(2);
        		        	} else if(deptNm.trim().indexOf("구민회관") >= 0) {
        		        		emp.setEmpOrder(3);
        		        	} else if(deptNm.trim().indexOf("체육센터") >= 0) {
        		        		emp.setEmpOrder(4);
        		        	} else if(deptNm.trim().indexOf("주차사업") >= 0) {
        		        		emp.setEmpOrder(5);
        		        	} else if(deptNm.trim().indexOf("공공시설") >= 0) {
        		        		emp.setEmpOrder(6);
        		        	}
        		        	emp.setEmpDept(deptNm);
        		        }else if(key.equals("CELL5")) {
        		        	emp.setEmpPart((String)test.get(key));
        		        }else if(key.equals("CELL7")) {
        		        	emp.setEmpPosition((String)test.get(key));
        		        }else if(key.equals("CELL9")) {
        		        	emp.setEmpJob((String)test.get(key));
        		        }else if(key.equals("CELL10")) {
        		        	String empPhone = (String)test.get(key);
        		        	if(empPhone != null && !empPhone.equals("")) {
        		        		String[] empPhoneArr = empPhone.split("-");
        		        		if(empPhoneArr != null && empPhoneArr.length > 0) {
        		        			emp.setEmpPhone1(empPhoneArr[0]);
        		        			emp.setEmpPhone2(empPhoneArr[1]);
        		        			emp.setEmpPhone3(empPhoneArr[2]);
        		        		}
        		        	}
        		        }else if(key.equals("CELL11")) {
        		        	String empMobile = (String)test.get(key);
        		        	String[] empMobileArr = empMobile.split("-");
        		        	if(empMobileArr != null && empMobileArr.length > 0) {
        		        		emp.setEmpMobile1(empMobileArr[0]);
    		        			emp.setEmpMobile2(empMobileArr[1]);
    		        			emp.setEmpMobile3(empMobileArr[2]);
        		        	}
        		        }else if(key.equals("CELL12")) {
        		        	emp.setEmpOutYn((String)test.get(key));
        		        }
        		    }	
                    emp.setCreateYmd(inDate);
                    emp.setCreateHms(inTime);
                    emp.setCreateIp(request.getRemoteAddr());
                    emp.setCreateId(admInfo.getAdmId());
        		    empList.add(emp);
        		}
        		adminEmpMngService.saveEmpMngList(empList);
            }
		} catch (Exception e){
			printStackTrace(e);
		}
    	return "redirect:/admin/listEmpMng?gseq="+empParam.getGseq()+"&lseq="+empParam.getLseq();
    }
    
    @RequestMapping(value="/admin/removeEmpMng",method=RequestMethod.POST)
    public String removeEmpMng(Model model, Emp empParam, HttpServletRequest request) {
    	try {
    		logger.info("AdminEmpMngController - removeEmpMng");
    		Admin admInfo = (Admin) request.getSession().getAttribute("adminInfo");
    		String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
            String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
            
            empParam.setModiId(admInfo.getAdmId());
            empParam.setModiIp(request.getRemoteAddr());
            empParam.setModiYmd(inDate);
            empParam.setModiHms(inTime);
            
    		adminEmpMngService.removeEmpMng(empParam);
		} catch (Exception e) {
			printStackTrace(e);
		}
    	return "redirect:/admin/listEmpMng?gseq="+empParam.getGseq()+"&lseq="+empParam.getLseq();
    }
    
    @RequestMapping("/admin/empSampleDown")
    public void empSampleDown(HttpServletRequest request, HttpServletResponse response) {
    	try {
    		logger.info("AdminEmpMngController - empSampleDown");
    		String filePath = "/resources/sample/";
    		String rltFilNm = "emp_sample.xls";
    		String fileNm = "조직도일괄등록_샘플양식.xls";
    		FileUtil.filDown(request, response, filePath, rltFilNm, fileNm);
		} catch (Exception e) {
			printStackTrace(e);
		}
    }
    
   
    //메뉴 공통 메서드
    private void commonMenu(Model model, Emp empParam) throws SQLException{
		/////////////////////LNB 메뉴///////////////////
		Menu menu = new Menu();
		menu.setPageGbnCd("ADMIN");
		menu.setMenuLvl(2);
		menu.setGseq(empParam.getGseq());
		ArrayList<Menu> lnbResult = adminLoginService.listMenu(menu);
		model.addAttribute("gseq",empParam.getGseq());
		model.addAttribute("lseq",empParam.getLseq());
		model.addAttribute("lnb",lnbResult);	
		///////////////////////////////////////////////
    }
    /**
     * 공통 목록 번호 set메서드
     * 
     * @param bbsParam bbsParam
     * @param list list
     * @param start start
     * @param totCnt totCnt
     */
    private void listNoSet(Emp empParam,ArrayList<Emp> list, int start, int totCnt){
			int listNum, n = 0;
	        ListIterator<Emp> it = list.listIterator();
	        while(it.hasNext()) {
	        	empParam = (Emp)it.next();
	       	 	listNum = totCnt - (start + n) + 1;
	       	 	empParam.setListNo(listNum);
				n++;
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


