package com.jnet.front.common.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jnet.domain.BbsFileReply;
import com.jnet.domain.Menu;
import com.jnet.front.common.service.CommonService;
import com.jnet.util.FileUtil;
import com.jnet.util.ParsingUtil;

@Controller
public class CommonController {

	
	@Autowired
	private CommonService commonService;
	
	
	
	@RequestMapping("/front/etc/nomail")
    public String nomail() {
        return "front/etc/nomail";
    }
	
    @RequestMapping("/front/satfact/{menuSeq}")
    public String satfact(Model model,@PathVariable("menuSeq") String menuSeq) {
    	System.out.println(" menuSeq ------- " + menuSeq);
    	model.addAttribute("menuSeq",menuSeq);
    	Menu menuParm = new Menu();
    	menuParm.setMenuSeq(menuSeq);
    	try{
    		Menu retMenu =new Menu();
    		retMenu=commonService.selectContentInfo(menuParm);
    		model.addAttribute("retMenu", retMenu);
    	}catch (Exception e) {
			// TODO: handle exception
		}

        return "front/common/satisfaction";
    }
    
    @RequestMapping(value="/front/saveSatfact" , method=RequestMethod.POST)
		public void saveSatfact(HttpServletRequest request, HttpServletResponse response, String score,String menuSeq) throws Exception {
			JSONObject jsonObj = new JSONObject();
			int ret=0;
			try {
				String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
        		String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
				Map<String, String> hmap = new HashMap<String, String>();
				hmap.put("score", score);
				hmap.put("menuSeq", menuSeq);
				hmap.put("createYmd", inDate);
				hmap.put("createHms", inTime);
				hmap.put("createIp", request.getRemoteAddr());
				ret=commonService.selectSatfactDup(hmap);
				if(ret>0){
					jsonObj.put("flag", "N");
				}else{
					jsonObj.put("flag", "Y");
					commonService.saveSatfact(hmap);
				}
				ParsingUtil.getjsonObj(response, jsonObj);
				
			} catch (SQLException e) {
				e.getStackTrace();
			}
		}
    
    @RequestMapping("/front/downEtc")
    public void aboutIntro(HttpServletRequest request, HttpServletResponse response,  BbsFileReply bbsParam) throws Exception {
    	try {
    		String filePath ="/resources/";
    		
    		FileUtil.filDown(request, response, filePath, bbsParam.getRealFileNm(), bbsParam.getOrgnlFileNm());
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
}
