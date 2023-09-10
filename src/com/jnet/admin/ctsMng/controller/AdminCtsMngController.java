package com.jnet.admin.ctsMng.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.PrintStream;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.ListIterator;
import java.util.UUID;

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

import com.jnet.admin.ctsMng.service.AdminCtsMngService;
import com.jnet.admin.login.service.AdminLoginService;
import com.jnet.admin.mgrMng.service.AdminMgrMngService;
import com.jnet.domain.Admin;
import com.jnet.domain.Common;
import com.jnet.domain.Cts;
import com.jnet.domain.Menu;
import com.jnet.domain.Popup;
import com.jnet.util.FileUtil;
import com.jnet.util.PageUtil;
import com.jnet.util.ParsingUtil;

@Controller
public class AdminCtsMngController {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private AdminCtsMngService adminCtsMngService;
	@Autowired
	private AdminLoginService adminLoginService;
	@Autowired
	private AdminMgrMngService adminMgrMngService;
	
	/**
	 * 컨텐츠관리 목록 조회 (껍데기)
	 * @param model model
	 * @param ctsParam ctsParam
	 * @param request request
	 * @return String String
	 */
	@RequestMapping("/admin/listCtsMng")
    public String listCtsMng(Model model, Cts ctsParam, HttpServletRequest request) {
    	logger.info("AdminCtsMngController - listCtsMng");
		try {
			commonMenu(model, ctsParam);
		} catch (Exception e) {
			printStackTrace(e);
		}
        return "admin/ctsMng/listCtsMng";
    }
	
	/**
	 * 컨텐츠관리 목록 조회 (ajax list)
	 * 
	 * @param model model
	 * @param ctsParam ctsParam
	 * @param request request
	 * @return String String
	 */
	@RequestMapping("/admin/listAjaxCtsMng")
    public String listAjaxCtsMng(Model model, Cts ctsParam, HttpServletRequest request) {
    	logger.info("AdminCtsMngController - listAjaxCtsMng");
    	PageUtil PageUtil = new PageUtil();
		try {
			int numPerPage   = 15;  // 한 화면에 보여주는 게시물 수
			int total_page = 0;
			int findCtsTotCnt = 0;
			
			//초기 페이지 로딩될때 NULL값일 경우 1페이지로 고정시켜준다.
			if(GenericValidator.isBlankOrNull(ctsParam.getPageNum())) ctsParam.setPageNum("1");
			if(GenericValidator.isBlankOrNull(ctsParam.getSearchKey())) ctsParam.setSearchKey("menu_nm");
			if(GenericValidator.isBlankOrNull(ctsParam.getSearchVal())) ctsParam.setSearchVal("");
			
			int current_page = 1;   // 현재페이지 번호
			if(!GenericValidator.isBlankOrNull(ctsParam.getPageNum())) current_page = Integer.parseInt(ctsParam.getPageNum());
			
			findCtsTotCnt = adminCtsMngService.findCtsTotCnt(ctsParam);
			
			if(findCtsTotCnt > 0) total_page = PageUtil.getPageCount(numPerPage,  findCtsTotCnt) ;

			// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
	        if(total_page < current_page && total_page != 0) current_page = total_page;	

	        // 리스트에 출력할 데이터를 가져오기
	        int end   = current_page * numPerPage;
	        int start = end - (numPerPage - 1);
	        ctsParam.setStart(start);
	        ctsParam.setEnd(end);
	        
			ArrayList<Cts> listCtsMng = adminCtsMngService.listCtsMng(ctsParam);
			
			 // 목록번호를 화면에 출력하기 위한 로직
				int listNum, n = 0;
		        ListIterator<Cts> it = listCtsMng.listIterator();
		        while(it.hasNext()) {
		        	ctsParam = (Cts)it.next();
		       	 	listNum = findCtsTotCnt - (start + n) + 1;
		       	 	ctsParam.setListNo(listNum);
					n++;
				}
	        model.addAttribute("listCtsMng",listCtsMng);
	        if(listCtsMng != null && listCtsMng.size() > 0) {
	        	model.addAttribute("pageIndexList",PageUtil.pageIndexList(current_page,total_page));	
	        }
		} catch (Exception e) {
			printStackTrace(e);
		}
        return "admin/ctsMng/listAjaxCtsMng";
    }
    
   /**
    * 컨텐츠관리 수정폼
    * 
    * @param request request
    * @param model model
    * @param ctsParam ctsParam
    * @return String String
    */
	@RequestMapping(value="/admin/formUpdateCtsMng",method=RequestMethod.POST)
    public String formUpdateCtsMng(HttpServletRequest request, Model model, Cts ctsParam) {
		logger.info("AdminCtsMngController - formUpdateCtsMng");
    	try {
    		commonMenu(model, ctsParam);
	
    		Cts ctsResult = adminCtsMngService.findCtsMng(ctsParam);
    		model.addAttribute("cts",ctsResult);
		} catch (Exception e) {
			printStackTrace(e);
		}
    	return "admin/ctsMng/formUpdateCtsMng";
    }
    
    /**
     * 컨텐츠 정보수정
     * @param request request
     * @param ctsParam ctsParam
     * @return  String String
     */
    @RequestMapping(value="/admin/updateCtsMng",method=RequestMethod.POST)
    public String updateCtsMng(HttpServletRequest request, Cts ctsParam) {
    	logger.info("AdminCtsMngController - updateCtsMng");
    	try {
    		String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
            String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
            Admin admInfo = (Admin) request.getSession().getAttribute("adminInfo");
            
            ctsParam.setCreateYmd(inDate);
            ctsParam.setCreateHms(inTime);
            ctsParam.setCreateIp(request.getRemoteAddr());
            ctsParam.setCreateId(admInfo.getAdmId());
            ctsParam.setModiYmd(inDate);
            ctsParam.setModiHms(inTime);
            ctsParam.setModiIp(request.getRemoteAddr());
            ctsParam.setModiId(admInfo.getAdmId());

    		adminCtsMngService.updateCtsMng(ctsParam);
		} catch (Exception e) {
			printStackTrace(e);
		}
    	return "redirect:/admin/listCtsMng?gseq="+ctsParam.getGseq()+"&lseq="+ctsParam.getLseq();
    }
    
    
    /**
     * 팝업 폼
     *  
     * @param model model
     * @param popUpParam popUpParam
     * @return String String
     */
    @RequestMapping("/admin/formPopMng")
    public String formPopMng(Model model, Popup popUpParam) {
    	logger.info("AdminCtsMngController - formPopMng");
		try {
			commonMenu(model, popUpParam);
			
			model.addAttribute("t1",popUpParam.getT1());
			model.addAttribute("t2",popUpParam.getT2());
			
			//사업소 목록 조회
			popUpParam.setCodeGbnCd("up_id");
			ArrayList<Common> listFacil =  adminMgrMngService.listFacil(popUpParam);
			model.addAttribute("listFacil",listFacil);
		} catch (Exception e) {
			printStackTrace(e);
		}
        return "admin/ctsMng/formPopMng";
    }
    
    /**
     * 팝업 목록 조회
     * 
     * @param model model
     * @param popUpParam popUpParam
     * @return String String
     */
    @RequestMapping("/admin/listPopMng")
    public String listPopMng(Model model, Popup popUpParam) {
    	logger.info("AdminCtsMngController - listPopMng");
		try {
			ArrayList<Popup> listPopMng = adminCtsMngService.listPopMng(popUpParam);
			model.addAttribute("listPopMng",listPopMng);
		} catch (Exception e) {
			printStackTrace(e);
		}
        return "admin/ctsMng/listPopMng";
    }
    
   /**
    * 팝업관리 - 팝업저장
    * @param model model
    * @param request request
    * @param popUpParam popUpParam
    * @return String String
    */
    @RequestMapping(value="/admin/savePopMng ",method=RequestMethod.POST)
    public String savePopMng(Model model, HttpServletRequest request, Popup popUpParam) {
    	logger.info("AdminCtsMngController - savePopMng");
    	String rlFileNm = "";
		String thFileNm = "";
		//파일 기본경로
		String dftFilePath = request.getServletContext().getRealPath("/");
		//파일 상세 경로
		String dtlFilePath = "resources" + File.separator + "Pds" + File.separator + "Pop" + File.separator;
		//파일 기본경로 _ 상세경로
		String filePath = dftFilePath + dtlFilePath;
		ArrayList<Popup> fileList = null;
    		try {
        		Admin admInfo = (Admin) request.getSession().getAttribute("adminInfo");
        		String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
                String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
                
                popUpParam.setCreateYmd(inDate);
                popUpParam.setCreateHms(inTime);
                popUpParam.setCreateIp(request.getRemoteAddr());
                popUpParam.setCreateId(admInfo.getAdmId());
        		
        		File file = null;
        		
        		Popup popUpImg = null;
        		//파일처리
        		if(popUpParam.getPopFileArr() != null && popUpParam.getPopFileArr().size() > 0) {
        			fileList = new ArrayList<Popup>();
            		for(int ii = 0; ii<popUpParam.getPopFileArr().size(); ii++){
            			popUpImg = new Popup();
            			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        				String today= formatter.format(new java.util.Date());
                		file = new File(filePath);
                		
                		if(!file.exists()) {
                			file.mkdirs();
                		}
                		
                		//db 저장될 경로
                		String dbPath = "/resources/Pds/Pop/";
                		String realFileNm = "";
                		
        				realFileNm = admInfo.getAdmId()+today+UUID.randomUUID().toString() + popUpParam.getPopFileArr().get(ii).getOriginalFilename().substring(popUpParam.getPopFileArr().get(ii).getOriginalFilename().lastIndexOf("."));
        				
        				popUpImg.setFilePath(dbPath);
        				popUpImg.setOrgnlFileNm(popUpParam.getPopFileArr().get(ii).getOriginalFilename());
        				popUpImg.setRealFileNm(realFileNm);
        				popUpImg.setThumbYn("N");
        				popUpImg.setLinkUrl(popUpParam.getLinkUrlArr()[ii]);
        				//추가
        				popUpImg.setDescript(popUpParam.getDescriptArr()[ii]);
        				popUpImg.setLinkTgt(popUpParam.getLinkTgtArr()[ii]);
        				popUpImg.setPopGbnCd(popUpParam.getPopGbnCd());				
        				popUpImg.setCommCodeSeq(popUpParam.getCommCodeSeq());
        				popUpImg.setCreateId(popUpParam.getCreateId());
        				popUpImg.setCreateIp(popUpParam.getCreateIp());
        				popUpImg.setCreateYmd(popUpParam.getCreateYmd());
        				popUpImg.setCreateHms(popUpParam.getCreateHms());
        				popUpImg.setModiId(popUpParam.getCreateId());
        				popUpImg.setModiIp(popUpParam.getCreateIp());
        				popUpImg.setModiYmd(popUpParam.getCreateYmd());
        				popUpImg.setModiHms(popUpParam.getCreateHms());
        				
        				fileList.add(popUpImg);
        				//파일저장
        				rlFileNm = filePath + realFileNm;
        				thFileNm = filePath + "thumb_"+realFileNm ;
        				file = new File(rlFileNm);
        				popUpParam.getPopFileArr().get(ii).transferTo(file);
        				File thumbFile = new File(thFileNm);
        				//썸네일 생성 부분
        		        boolean thumbYn = FileUtil.mkThumbNail(file, thumbFile, 100, 100);
        		        if(thumbYn){
        		        	popUpImg = new Popup();
        		        	popUpImg.setFilePath(dbPath);
        		        	popUpImg.setOrgnlFileNm(popUpParam.getPopFileArr().get(ii).getOriginalFilename());
        		        	popUpImg.setRealFileNm("thumb_"+realFileNm );
        		        	popUpImg.setThumbYn("Y");
        		        	popUpImg.setLinkUrl(popUpParam.getLinkUrlArr()[ii]);
        		        	//추가
        		        	popUpImg.setDescript(popUpParam.getDescriptArr()[ii]);
        		        	popUpImg.setLinkTgt(popUpParam.getLinkTgtArr()[ii]);
        		        	popUpImg.setPopGbnCd(popUpParam.getPopGbnCd());				
            				popUpImg.setCommCodeSeq(popUpParam.getCommCodeSeq());
            				popUpImg.setCreateId(popUpParam.getCreateId());
            				popUpImg.setCreateIp(popUpParam.getCreateIp());
            				popUpImg.setCreateYmd(popUpParam.getCreateYmd());
            				popUpImg.setCreateHms(popUpParam.getCreateHms());
            				popUpImg.setModiId(popUpParam.getCreateId());
            				popUpImg.setModiIp(popUpParam.getCreateIp());
            				popUpImg.setModiYmd(popUpParam.getCreateYmd());
            				popUpImg.setModiHms(popUpParam.getCreateHms());
        					fileList.add(popUpImg);
        		        }
            		}
            		popUpParam.setListPopup(fileList);
        		}
                adminCtsMngService.savePopMng(popUpParam);
		} catch (Exception e) {
			File fileRemoveFile = null;
			if(fileList != null && fileList.size() > 0){
				for(Popup popup : fileList) {
					fileRemoveFile = new File(dtlFilePath+popup.getRealFileNm());
					if(fileRemoveFile.exists()) {
						fileRemoveFile.delete();
					}
				}
			}
			printStackTrace(e);
		}
    		return "redirect:/admin/formPopMng?gseq="+popUpParam.getGseq()+"&lseq="+popUpParam.getLseq()+"&t1="+popUpParam.getT1()+"&t2="+popUpParam.getT2();
    }
    
    /**
     * 팝업 관리 - 팝업삭제
     * @param model model
     * @param request request
     * @param response response
     * @param popUpParam popUpParam
     */
    @RequestMapping(value="/admin/removePopMngByPopSeq",method=RequestMethod.POST)
    public void removePopMngByPopSeq(Model model, HttpServletRequest request, HttpServletResponse response, Popup popUpParam) {
    	JSONObject jsonObj = null;
    	logger.info("AdminCtsMngController - removePopMngByPopSeq");
    	try {
    		jsonObj = new JSONObject(); 
    		//popSeq 팝업테이블 조회
        	adminCtsMngService.removePopMngByPopSeq(popUpParam,request);
        	jsonObj.put("flag", "Y");
		} catch (Exception e) {
			jsonObj = new JSONObject();
			printStackTrace(e);
			jsonObj.put("flag",e.toString());
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
     * 팝업관리 - 팝업순서변경
     * @param model
     * @param request
     * @param response
     * @param popUpParam
     * @return
     */
    @RequestMapping(value="/admin/updatePopOrdinary",method=RequestMethod.POST)
    public String updatePopOrdinary(Model model, HttpServletRequest request, HttpServletResponse response, Popup popUpParam) {
    	try {
    		adminCtsMngService.updatePopOrdinary(popUpParam);
		} catch (Exception e) {
			printStackTrace(e);
		}
    	return "redirect:/admin/formPopMng?gseq="+popUpParam.getGseq()+"&lseq="+popUpParam.getLseq()+"&t1="+popUpParam.getT1()+"&t2="+popUpParam.getT2();
    }
    
    /**
     * 카테고리 목록 조회
     * @param model model
     * @param request request
     * @param response response
     * @param ctsParam ctsParam
     */
    @RequestMapping(value="/admin/listDepthCat",method=RequestMethod.POST)
    public void listDepthCat(Model model, HttpServletRequest request, HttpServletResponse response, Cts ctsParam) {
    	JSONObject jsonObj = null;
    	JSONArray jsonArr = null;
    	
    	try {
    		ArrayList<Menu> listDepthCat = adminCtsMngService.listDepthCat(ctsParam);
    		jsonArr = new JSONArray();
    		if(listDepthCat != null && listDepthCat.size() > 0) {
    			for(Menu menu : listDepthCat) {
    				jsonObj = new JSONObject();
    				jsonObj.put("menuSeq", menu.getMenuSeq());
    				jsonObj.put("menuNm", menu.getMenuNm());
    				jsonArr.add(jsonObj);
    			}
    		}
    		jsonObj = new JSONObject();
    		jsonObj.put("listDepthCat", jsonArr);
		} catch (SQLException e) {
			printStackTrace(e);
		}finally{
			try {
				ParsingUtil.getjsonObj(response, jsonObj);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				printStackTrace(e);
			}
		}
    }
    
    /**
     * 한줄 알리미 설정화면
     * @param model model
     * @param request request
     * @param response response
     * @param ctsParam ctsParam
     * @return String String
     */
    @RequestMapping("/admin/formOneNotiMng")
    public String formOneNotiMng(Model model, HttpServletRequest request, HttpServletResponse response, Cts ctsParam) {
    	try {
    		model.addAttribute("t1",ctsParam.getT1());
    		
    		commonMenu(model, ctsParam);
    		//사업소 목록 조회
    		ctsParam.setCodeGbnCd("up_id");
			ArrayList<Common> listFacil =  adminMgrMngService.listFacil(ctsParam);
			model.addAttribute("listFacil",listFacil);
		} catch (Exception e) {
			printStackTrace(e);
		}
		return "admin/ctsMng/formOneNotiMng";
    }
    
    
    /**
     * 한줄알리미 - 알리미저장
     * @param model model
     * @param request request
     * @param popUpParam popUpParam
     * @return String String
     */
     @RequestMapping(value=" /admin/saveOneNotiMng",method=RequestMethod.POST)
     public String saveOneNotiMng(Model model, HttpServletRequest request, Popup popupParam) {
     	logger.info("AdminCtsMngController - saveOneNotiMng");
     	try{
     		
     		Admin admInfo = (Admin) request.getSession().getAttribute("adminInfo");
    		String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
            String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
            
            popupParam.setCreateYmd(inDate);
            popupParam.setCreateHms(inTime);
            popupParam.setCreateIp(request.getRemoteAddr());
            popupParam.setCreateId(admInfo.getAdmId());
            
            adminCtsMngService.saveOneNotiMng(popupParam);
 		} catch (Exception e) {
 			printStackTrace(e);
 		}
     		return "redirect:/admin/formOneNotiMng?gseq="+popupParam.getGseq()+"&lseq="+popupParam.getLseq()+"&t1="+popupParam.getT1();
     }
    
     
     
     /**
      * 알리미 목록 조회
      * 
      * @param model model
      * @param popUpParam popUpParam
      * @return String String
      */
     @RequestMapping("/admin/listOneNotiMng")
     public String listOneNotiMng(Model model, Popup popUpParam) {
     	logger.info("AdminCtsMngController - listOneNotiMng");
 		try {
 			if(GenericValidator.isBlankOrNull(popUpParam.getCommCodeSeq())) {
 				popUpParam.setCommCodeSeq("0");
 			}
 			ArrayList<Popup> listOneNotiMng = adminCtsMngService.listOneNotiMng(popUpParam);
 			model.addAttribute("listOneNotiMng",listOneNotiMng);
 		} catch (Exception e) {
 			printStackTrace(e);
 		}
         return "admin/ctsMng/listOneNotiMng";
     }
     
     /**
      * 대표알리미 설정
      * 
      * @param model model
      * @param popUpParam popUpParam
      * @return String String
      */
     @RequestMapping(value="/admin/updateShowOneNoti",method=RequestMethod.POST)
     public void updateShowOneNoti(Popup popUpParam, HttpServletResponse response) {
     	logger.info("AdminCtsMngController - updateShowOneNoti");
     	JSONObject jsonObj = null;
 		try {
 			jsonObj = new JSONObject();
 			adminCtsMngService.updateShowOneNoti(popUpParam);
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
     
     /**
      * 알리미 - 알리미 삭제
      * @param model model
      * @param request request
      * @param response response
      * @param popUpParam popUpParam
      */
     @RequestMapping(value="/admin/removeOneNotiMngByOneNotiSeq",method=RequestMethod.POST)
     public void removeOneNotiMngByOneNotiSeq(Model model, HttpServletRequest request, HttpServletResponse response, Popup popUpParam) {
     	JSONObject jsonObj = null;
     	logger.info("AdminCtsMngController - removeOneNotiMngByOneNotiSeq");
     	try {
     		jsonObj = new JSONObject(); 
     		//popSeq 팝업테이블 조회
         	adminCtsMngService.removeOneNotiMngByOneNotiSeq(popUpParam);
         	jsonObj.put("flag", "Y");
 		} catch (Exception e) {
 			jsonObj = new JSONObject();
 			printStackTrace(e);
 			jsonObj.put("flag",e.toString());
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
     * 메뉴 공통 메서드
     * 
     * @param model model
     * @param ctsParam ctsParam
     * @throws SQLException SQLException
     */
    private void commonMenu(Model model, Cts ctsParam) throws SQLException{
		/////////////////////LNB 메뉴///////////////////
		Menu menu = new Menu();
		menu.setPageGbnCd("ADMIN");
		menu.setMenuLvl(2);
		menu.setGseq(ctsParam.getGseq());
		ArrayList<Menu> lnbResult = adminLoginService.listMenu(menu);
		model.addAttribute("gseq",ctsParam.getGseq());
		model.addAttribute("lseq",ctsParam.getLseq());
		model.addAttribute("lnb",lnbResult);	
		///////////////////////////////////////////////
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


