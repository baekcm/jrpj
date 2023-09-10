package com.jnet.front.menu.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jnet.domain.Menu;
import com.jnet.front.menu.service.FrontMenuService;

@Controller
public class FrontMenuController {

	
	@Autowired
	private FrontMenuService frontMenuService;
	
	
	@RequestMapping("/front/contents/{menuSeq}")
    public String menu(Model model,@PathVariable("menuSeq") String menuSeq) {
		System.out.println("returnStr ------ > ");
		String returnStr="front/index";
    	try {
    		Menu menu =null;
    		menu = new Menu();
    		menu.setMenuSeq(menuSeq);
    		HashMap<String, String> hmap =new HashMap<String, String>();
    		hmap.put("menuSeq",menuSeq);
    		ArrayList<Menu> menuList= frontMenuService.frontContents(menu);
    		String Contents=""; 
    		Contents= frontMenuService.findFrontCts(hmap);
    		if(Contents == null)Contents="";
    		if("".equals(Contents.trim())){
    			Contents="<img src=\"/resources/include/commonfile/image/common/prepare.jpg\" alt=\"자료를 준비중입니다.\" />";
    		}
    		model.addAttribute("contents", Contents);
    		model.addAttribute("menuSeq", menuSeq);
    		if(menuList.size() > 0 ){
    			for(int i =0; i < menuList.size();i++){
    				Menu m =null;
    				m= menuList.get(i);
    				returnStr="front"+m.getMenuUrl();
    				System.out.println("returnStr ------ > " + returnStr);
    			}
    		}
		} catch (Exception e) {
			e.printStackTrace();
		}
        return returnStr;
    }
    
	@RequestMapping("/front/index")
	public String index() {
		String returnStr="front/index";
		return returnStr;
	}
	
	
	@RequestMapping("/front/content")
	public String content() {
		String returnStr="front/content/contents";
		return returnStr;
	}
	@RequestMapping("/front/testList")
	public String testList() {
		String returnStr="front/testList";
		return returnStr;
	}
	@RequestMapping("/front/menuUrlList")
	public String menuUrlList(Model model,HttpServletRequest request, Menu menu) {
		String returnStr="front/boardList";
		try{
			ArrayList<Menu> list =frontMenuService.listTest();
			model.addAttribute("list", list);
		}catch (Exception e) {
			// TODO: handle exception
		}
		return returnStr;
	}
	
	@RequestMapping("/front/updateMenuUrl")
	public String updateMenuUrl(Model model,HttpServletRequest request, Menu menu) {
		String returnStr="front/testList";
		try{
			frontMenuService.updateTest(menu);
		}catch (Exception e) {
			// TODO: handle exception
		}
		return returnStr;
	}
	
	
	@RequestMapping("/front/findYear")
	public String findYear(Model model,HttpServletRequest request,String title, String year) {
		String returnStr="front/info/";
		try{
			returnStr=returnStr+title+year;
		}catch (Exception e) {
			// TODO: handle exception
		}
		return returnStr;
	}
	
	@RequestMapping("/front/findEtc")
	public String findEtc(Model model,HttpServletRequest request,String title, String gb) {
		String returnStr="front/etc/";
		try{
			returnStr=returnStr+title+gb;
		}catch (Exception e) {
			// TODO: handle exception
		}
		return returnStr;
	}
	
	
}
