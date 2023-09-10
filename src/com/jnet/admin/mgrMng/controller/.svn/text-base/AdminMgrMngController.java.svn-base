package com.jnet.admin.mgrMng.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.validator.GenericValidator;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jnet.admin.login.service.AdminLoginService;
import com.jnet.admin.mgrMng.service.AdminMgrMngService;
import com.jnet.domain.Admin;
import com.jnet.domain.Common;
import com.jnet.domain.Menu;
import com.jnet.domain.TeacherImg;
import com.jnet.util.PageUtil;
import com.jnet.util.ParsingUtil;

@Controller
public class AdminMgrMngController {
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private AdminMgrMngService adminMgrMngService;
	@Autowired
	private AdminLoginService adminLoginService;
	@Autowired
	private AdminMgrMngService aminMgrMngService;
	
    /**
     * 관리자 관리 목록 조회
     * @return String String
     */
    @RequestMapping("/admin/listMgrMng")
    public String listMgrMng(Model model, Menu menuParam) {
    	logger.info("AdminMgrMngController - listMgrMng");
    	PageUtil PageUtil = new PageUtil();
		try {
			// LNB 공통 메뉴 목록 조회
			commonMenu(model, menuParam);
			
			// 한 화면에 보여주는 게시물 수
			int numPerPage = 10;
			// 현재페이지 번호
			int current_page = 1;
			int total_page = 0;
			int findMgrTotCnt = 0;
			   
			if(GenericValidator.isBlankOrNull(menuParam.getSearchKey())) menuParam.setSearchKey("all");
			if(GenericValidator.isBlankOrNull(menuParam.getSearchVal())) menuParam.setSearchVal("");
			if(GenericValidator.isBlankOrNull(menuParam.getSearchLvl())) menuParam.setSearchLvl("all");
			
			model.addAttribute("searchLvl",menuParam.getSearchLvl());
			model.addAttribute("searchKey",menuParam.getSearchKey());
			model.addAttribute("searchVal",menuParam.getSearchVal());
			
			//초기 페이지 로딩될때 NULL값일 경우 1페이지로 고정시켜준다.
			if(GenericValidator.isBlankOrNull(menuParam.getPageNum()))  menuParam.setPageNum("1");
			if(!GenericValidator.isBlankOrNull(menuParam.getPageNum())) current_page = Integer.parseInt(menuParam.getPageNum());
			
			findMgrTotCnt = adminMgrMngService.findMgrTotCnt(menuParam);
			
			if(findMgrTotCnt > 0) total_page = PageUtil.getPageCount(numPerPage,  findMgrTotCnt) ;

			// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
	        if(total_page < current_page && total_page != 0) current_page = total_page;	

	        // 리스트에 출력할 데이터를 가져오기
	        int end   = current_page * numPerPage;
	        int start = end - (numPerPage - 1);
	        
	        menuParam.setStart(start);
	        menuParam.setEnd(end);
			ArrayList<Menu> listMgrMng = adminMgrMngService.listMgrMng(menuParam);
			 // 목록번호를 화면에 출력하기 위한 로직
			/*listNoSet(menuParam,listMgrMng,  start,  findMgrTotCnt);*/
	        model.addAttribute("listMgrMng",listMgrMng);
	        if(listMgrMng != null && listMgrMng.size() > 0) model.addAttribute("pageIndexList",PageUtil.pageIndexList(current_page,total_page));	
		} catch (Exception e) {
			printStackTrace(e);
		}
        return "admin/mgrMng/listMgrMng";
    }
    
    /**
     * 관리자 등록폼
     * 
     * @param model model
     * @return String String
     */
    @RequestMapping("/admin/formCreateMgrMng")
    public String formCreateMgrMng(Model model, Menu menuParam) {
    	try {
    		logger.info("AdminMgrMngController - formCreateMgrMng");
    		// LNB 공통 메뉴 목록 조회
    		commonMenu(model, menuParam);
    		
    		
    		//메일코드 목록 조회, 전화번호코드 목록 조회
    		Common commonParam = null;
    		listSetSlct(commonParam, "mail", model, "mailList");
    		listSetSlct(commonParam, "phonearea", model, "phoneList");
		} catch (Exception e) {
			printStackTrace(e);
		}
    	return "admin/mgrMng/formCreateMgrMng";
    }
    
    
    /**
     * 관리자 수정폼
     * 
     * @param model model
     * @return String String
     */
    @SuppressWarnings("unchecked")
	@RequestMapping(value="/admin/formUpdateMgrMng",method=RequestMethod.POST)
    public String formUpdateMgrMng(Model model, Menu menuParam) {
    	try {
    		logger.info("AdminMgrMngController - formUpdateMgrMng");
    		// LNB 공통 메뉴 목록 조회
    		commonMenu(model, menuParam);
	
    		Map<String, Object> hmap = adminMgrMngService.listAdminAuthWithMenu(menuParam);
    		// 1. 관리자 정보 조회
    		Menu findAdminAuth = (Menu) hmap.get("findAdminAuth");
    		model.addAttribute("findAdminAuth",findAdminAuth);
    		if(findAdminAuth.getAdmType().equals("O")) {
    			// 2. 메뉴권한 정보 조회
        		ArrayList<Menu> listAdminAuthMenu = (ArrayList<Menu>) hmap.get("listAdminAuthMenu");
        		if(listAdminAuthMenu != null && listAdminAuthMenu.size() > 0) {
        			ArrayList<TeacherImg> listPgmAuth = new ArrayList<TeacherImg>();
        			for(Menu menu : listAdminAuthMenu) {
            			if(menu.getPgmGbnCd().equals("PGM")) {
            				TeacherImg teacherImg = new TeacherImg();
            				if(Integer.parseInt(menu.getMenuSeqStr()) < 10) menu.setMenuSeqStr("0"+menu.getMenuSeqStr());
            				teacherImg.setUpId(menu.getSlctFacilId());
            				teacherImg.setSaleId(menu.getSaleId());
            				teacherImg.setBasId(menu.getMenuSeqStr());
            				listPgmAuth.add(adminMgrMngService.findPgmAuth(teacherImg));
            			}
            		}
        			model.addAttribute("listPgmAuth",listPgmAuth);	
        		}
        		model.addAttribute("listAdminAuthMenu",listAdminAuthMenu);
    		}
    		
    		//메일코드 목록 조회, 전화번호코드 목록 조회
    		Common commonParam = null;
    		listSetSlct(commonParam, "mail", model, "mailList");
    		listSetSlct(commonParam, "phonearea", model, "phoneList");
		} catch (Exception e) {
			printStackTrace(e);
		}
    	return "admin/mgrMng/formUpdateMgrMng";
    }
    
    /**
     * 관리자 저장
     * 
     * @param model model
     * @return String String
     */
    @RequestMapping(value="/admin/saveMgrMng",method=RequestMethod.POST)
    public String saveMgrMng(HttpServletRequest request, Menu menuParam) {
    	logger.info("AdminMgrMngController - saveMgrMng");
    	try {
    		if(menuParam.getAdmType().equals("ADMIN")) 	    menuParam.setAdmType("S");
        	else if(menuParam.getAdmType().equals("FRONT")) menuParam.setAdmType("O");
    		String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
            String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
            Admin admInfo = (Admin) request.getSession().getAttribute("adminInfo");
            
            menuParam.setCreateYmd(inDate);
        	menuParam.setCreateHms(inTime);
        	menuParam.setCreateIp(request.getRemoteAddr());
        	menuParam.setCreateId(admInfo.getAdmId());
    		menuParam.setAdmPwd(ParsingUtil.ShaParse(menuParam.getAdmPwd().trim()));
    		adminMgrMngService.saveMgrMng(menuParam);	
		} catch (Exception e) {
			printStackTrace(e);
		}
    	return "redirect:/admin/listMgrMng?gseq="+menuParam.getGseq();
    }
    
    /**
     * 관리자 수정
     * 
     * @param model model
     * @return String String
     */
    @RequestMapping(value="/admin/updateMgrMng",method=RequestMethod.POST)
    public String updateMgrMng(HttpServletRequest request, Menu menuParam) {
    	logger.info("AdminMgrMngController - updateMgrMng");
    	if(menuParam.getAdmType().equals("ADMIN")) 		menuParam.setAdmType("S");
    	else if(menuParam.getAdmType().equals("FRONT")) menuParam.setAdmType("O");

    	String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
        String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
        Admin admInfo = (Admin) request.getSession().getAttribute("adminInfo");
        
        menuParam.setModiYmd(inDate);
    	menuParam.setModiHms(inTime);
    	menuParam.setModiIp(request.getRemoteAddr());
    	menuParam.setModiId(admInfo.getAdmId());

    	try {
    		adminMgrMngService.updateMgrMng(menuParam);	
		} catch (Exception e) {
			printStackTrace(e);
		}
    	return "redirect:/admin/listMgrMng?gseq="+menuParam.getGseq();
    }
    
    /**
     * 관리자 수정
     * 
     * @param model model
     * @return String String
     */
    @RequestMapping(value="/admin/removeMgrMng",method=RequestMethod.POST)
    public String removeMgrMng(HttpServletRequest request, Menu menuParam) {
    	logger.info("AdminMgrMngController - removeMgrMng");
    	String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
        String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
        Admin admInfo = (Admin) request.getSession().getAttribute("adminInfo");
        
        menuParam.setModiYmd(inDate);
    	menuParam.setModiHms(inTime);
    	menuParam.setModiIp(request.getRemoteAddr());
    	menuParam.setModiId(admInfo.getAdmId());

    	try {
    		adminMgrMngService.removeMgrMng(menuParam);	
		} catch (Exception e) {
			printStackTrace(e);
		}
    	return "redirect:/admin/listMgrMng?gseq="+menuParam.getGseq();
    }
    
    
    
    /**
     * 관리자 등록폼 - 시설목록조회(AJAX - JSON 호출)
     * 
     * @param request request
     * @param response response
     * @param model model
     * @param commonParam commonParam
     */
    @RequestMapping(value="/admin/listFacil",method=RequestMethod.POST)
    public void listFacil(HttpServletRequest request, HttpServletResponse response, Model model, Common commonParam) {
    	logger.info("AdminMgrMngController - listFacil");
    	JSONObject jsonObj = new JSONObject();
    	JSONArray jsonArr = null;
    	JSONObject arrayObject = null;
    	try {
    		//사업소 목록 조회
    		ArrayList<Common> listFacil = adminMgrMngService.listFacil(commonParam);
    		
			if(listFacil != null && listFacil.size() > 0) {
				jsonArr = new JSONArray();
				for(Common commonResult : listFacil) {
					arrayObject = new JSONObject();
					arrayObject.put("codeNm", commonResult.getCodeNm());
					arrayObject.put("codeId", commonResult.getCodeId());
					arrayObject.put("commCodeSeq", commonResult.getCommCodeSeq());
					jsonArr.add(arrayObject);
				}
			}
			jsonObj.put("listFacil", jsonArr);
		} catch (Exception e) {
			printStackTrace(e);
		} finally{
			try {
				ParsingUtil.getjsonObj(response, jsonObj);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				printStackTrace(e);
			}
		}
    }
    
    
    /**
     * 타입에 의한 메뉴목록 조회(AJAX - JSON 호출)
     * 
     * @param request request
     * @param response response
     * @param model model
     * @param menuParam menuParam
     */
    @RequestMapping(value="/admin/listMenuByType",method=RequestMethod.POST)
    public void listMenuByType(HttpServletRequest request, HttpServletResponse response, Model model, Menu menuParam) {
    	logger.info("AdminMgrMngController - listMenuByType");
    	JSONObject jsonObj = new JSONObject();
    	JSONArray jsonArr = null;
    	JSONObject arrayObject = null;
    	try {
    		//메뉴타입에 의한 메뉴목록 조회
    		ArrayList<Menu> listMenuByType = adminMgrMngService.listMenuByType(menuParam);
			if(listMenuByType != null && listMenuByType.size() > 0) {
				jsonArr = new JSONArray();
				for(Menu menuResult : listMenuByType) {
					arrayObject = new JSONObject();
					arrayObject.put("menuSeq", menuResult.getMenuSeq());
					arrayObject.put("menuNm", menuResult.getMenuNm());
					jsonArr.add(arrayObject);
				}
			}
			jsonObj.put("listMenuByType", jsonArr);
		} catch (Exception e) {
			printStackTrace(e);
		} finally{
			try {
				ParsingUtil.getjsonObj(response, jsonObj);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				printStackTrace(e);
			}
		}
    }
    
   /**
    * 관리자 등록폼 - 아이디 중복체크(AJAX - JSON 호출)
    * 
    * @param request request
    * @param response response
    * @param model model
    * @param menuParam menuParam
    */
    @RequestMapping(value="/admin/findDpAdmId",method=RequestMethod.POST)
    public void findDpAdmId(HttpServletRequest request, HttpServletResponse response, Model model, Menu menuParam) {
    	logger.info("AdminMgrMngController - findDpAdmId");
    	try {
    		int findDpAdmId = adminMgrMngService.findDpAdmId(menuParam);
    		boolean dpYn = true;
    		if(findDpAdmId > 0) {
    			dpYn = false;
    		} else {
    			dpYn = true;
    		}
    		response.setContentType("text/plain; charset=UTF-8");
			PrintWriter pw = response.getWriter();
			pw.print(dpYn);
			pw.flush();
			pw.close();
		} catch (Exception e) {
			printStackTrace(e);
		}
    }
    
    /**
     * 관리자 등록폼 - 비밀번호 변경(AJAX - JSON 호출)
     * 
     * @param request request
     * @param response response
     * @param model model
     * @param menuParam menuParam
     */
     @RequestMapping(value="/admin/updateAdmPwd",method=RequestMethod.POST)
     public void updateAdmPwd(HttpServletRequest request, HttpServletResponse response, Menu menuParam) {
     	logger.info("AdminMgrMngController - updateAdmPwd");
     	JSONObject jsonObj = new JSONObject();
     	try {
     		
     		String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
            String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
            Admin admInfo = (Admin) request.getSession().getAttribute("adminInfo");
            
            menuParam.setModiYmd(inDate);
        	menuParam.setModiHms(inTime);
        	menuParam.setModiIp(request.getRemoteAddr());
        	menuParam.setModiId(admInfo.getAdmId());
     		menuParam.setAdmPwd(ParsingUtil.ShaParse(menuParam.getAdmPwd().trim()));
     		adminMgrMngService.updateAdmPwd(menuParam);
 			jsonObj.put("flag", "Y");
 		} catch (Exception e) {
 			printStackTrace(e);
 			jsonObj.put("flag", e.toString());
 		} finally{
 			try {
				ParsingUtil.getjsonObj(response, jsonObj);
			} catch (IOException e) {
				printStackTrace(e);
			}
 		}
     }
    
    
 
    //메뉴 공통 메서드
    private void commonMenu(Model model, Menu menuParam) throws SQLException{
		/////////////////////LNB 메뉴///////////////////
		Menu menu = new Menu();
		menu.setPageGbnCd("ADMIN");
		menu.setMenuLvl(2);
		menu.setGseq(menuParam.getGseq());
		ArrayList<Menu> lnbResult = adminLoginService.listMenu(menu);
		model.addAttribute("gseq",menuParam.getGseq());
		model.addAttribute("lseq",menuParam.getLseq());
		model.addAttribute("lnb",lnbResult);	
		///////////////////////////////////////////////
    }
    
    private void listSetSlct(Common commonParam, String codeGbnCd, Model model, String setAttrNm) throws Exception{
    	// select box 리스트
		commonParam = new Common();
		commonParam.setCodeGbnCd(codeGbnCd);
		model.addAttribute(setAttrNm,aminMgrMngService.listFacil(commonParam));
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