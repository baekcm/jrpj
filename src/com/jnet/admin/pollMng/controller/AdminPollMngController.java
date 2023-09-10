package com.jnet.admin.pollMng.controller;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.ListIterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.validator.GenericValidator;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jnet.admin.login.service.AdminLoginService;
import com.jnet.admin.pollMng.service.AdminPollMngService;
import com.jnet.domain.APoll;
import com.jnet.domain.Admin;
import com.jnet.domain.Cts;
import com.jnet.domain.Menu;
import com.jnet.domain.Poll;
import com.jnet.domain.QPoll;
import com.jnet.util.PageUtil;

@Controller
public class AdminPollMngController {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private AdminLoginService adminLoginService;
	@Autowired
	private AdminPollMngService adminPollMngService;

	/**
	 * 설문조사 목록 조회
	 * 
	 * @param request request
	 * @param poll poll
	 * @param model model
	 * @return String
	 */
	@RequestMapping("/admin/listPoll")
	public String listPoll(HttpServletRequest request, Poll poll,Model model) {
		logger.info("AdminPollMngController - listPoll");
		if (!GenericValidator.isBlankOrNull(poll.getSearchKey())) {
			model.addAttribute("searchKey",poll.getSearchKey());
		}
		if (!GenericValidator.isBlankOrNull(poll.getSearchVal())) {
			model.addAttribute("searchVal",poll.getSearchVal());
		}
		PageUtil PageUtil = new PageUtil();
		int numPerPage = 10; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int findTotCnt = 0;

		// 초기 페이지 로딩될때 NULL값일 경우 1페이지로 고정시켜준다.
		if (GenericValidator.isBlankOrNull(poll.getPageNum())) {
			poll.setPageNum("1");
		}

		int current_page = 1; // 현재페이지 번호
		if (!GenericValidator.isBlankOrNull(poll.getPageNum())) {
			current_page = Integer.parseInt(poll.getPageNum());
		}
		try {
			commonMenu( model,  poll);
			Map<String, Object> hmap = new HashMap<String, Object>();
			hmap.put("searchKey", poll.getSearchKey());
			hmap.put("searchVal", poll.getSearchVal());

			findTotCnt = adminPollMngService.findPollTotCnt(hmap);

			if (findTotCnt > 0)
				total_page = PageUtil.getPageCount(numPerPage, findTotCnt);

			// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
			if (total_page < current_page)
				current_page = total_page;

			// 리스트에 출력할 데이터를 가져오기
			int start = (current_page - 1) * numPerPage + 1;
			int end = current_page * numPerPage;

			hmap.put("start", String.valueOf(start));
			hmap.put("end", String.valueOf(end));

			ArrayList<Poll> listPoll = adminPollMngService.listPoll(hmap);

			// 목록번호를 화면에 출력하기 위한 로직
			if(listPoll != null && listPoll.size() > 0) {
				int listNum, n = 0;
				ListIterator<Poll> it = listPoll.listIterator();
				while (it.hasNext()) {
					poll = (Poll) it.next();
					listNum = findTotCnt - (start + n);
					poll.setListNo(listNum + 1);
					n++;
				}
				model.addAttribute("listPoll",listPoll);
				// 페이징 화면출력 //
				model.addAttribute("pageIndexList",PageUtil.pageIndexList(current_page, total_page));
			}
		} catch (Exception e) {
			printStackTrace(e);
		}
		return "admin/poll/listPoll";
	}
	
	
	/**
	 * 설문조사 등록폼
	 * 
	 * @param model model
	 * @param poll poll
	 * @return String String
	 */
	@RequestMapping("/admin/formCreatePoll")
	public String formCreatePoll(Model model, Poll poll) {
		logger.info("AdminPollMngController - /admin/formCreatePoll");
		try {
			commonMenu( model,  poll);	
		} catch (Exception e) {
			printStackTrace(e);
		}
		return "admin/poll/formCreatePoll";
	}
	
	/**
	 * 설문조사 수정폼
	 * 
	 * @param request request
	 * @param aPoll aPoll
	 * @param model model
	 * @return String String
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/admin/formUpdatePoll",method=RequestMethod.POST)
	public String formUpdatePoll(HttpServletRequest request, APoll aPoll, Model model) {
		logger.info("AdminPollMngController - /admin/formUpdatePoll");
		try {
			commonMenu( model,  aPoll);
			Map<String, Object> findObj = adminPollMngService.findPoll(aPoll);
			Poll findPoll = (Poll)findObj.get("findPoll");
			ArrayList<QPoll> listPollQuestion = (ArrayList<QPoll>)findObj.get("listPollQuestion");
			model.addAttribute("findPoll",findPoll);
			model.addAttribute("listPollQuestion",listPollQuestion);
		} catch (Exception e) {
			printStackTrace(e);
		}
		return "admin/poll/formUpdatePoll";
	}
	
	/**
	 * 설문조사 상세조회
	 * 
	 * @param pollSeq pollSeq
	 * @param request request
	 * @param aPoll aPoll
	 * @param model model
	 * @return String String
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/admin/findPoll/{pollSeq}")
	public String findPoll(@PathVariable("pollSeq")int pollSeq, HttpServletRequest request, APoll aPoll,Model model) {
		try {
			logger.info("AdminPollMngController - /admin/findPoll");
			commonMenu( model,  aPoll);
			aPoll.setPollSeq(pollSeq);
			Map<String, Object> findObj = adminPollMngService.findPoll(aPoll);
			Poll findPoll = (Poll)findObj.get("findPoll");
			ArrayList<QPoll> listPollQuestion = (ArrayList<QPoll>)findObj.get("listPollQuestion");
			
			model.addAttribute("findPoll",findPoll);
			model.addAttribute("listPollQuestion",listPollQuestion);
		} catch (Exception e) {
			printStackTrace(e);
		}
		return "admin/poll/findPoll";
	}
	
	/**
	 * 설문조사 폼 저장
	 * 
	 * @param request request
	 * @param qPoll qPoll
	 * @param model model
	 * @return String String
	 */
	@RequestMapping(value="/admin/savePoll",method=RequestMethod.POST)
	public String savePoll(HttpServletRequest request, QPoll qPoll,Model model) {
		try {
			logger.info("AdminPollMngController - /admin/savePoll");
			commonMenu( model,  qPoll);
			String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
            String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
			Admin admInfo = (Admin) request.getSession().getAttribute("adminInfo");
			qPoll.setCreateYmd(inDate);
			qPoll.setCreateHms(inTime);
			qPoll.setCreateIp(request.getRemoteAddr());
			qPoll.setCreateId(admInfo.getAdmId());
			qPoll.setModiYmd(inDate);
			qPoll.setModiHms(inTime);
            qPoll.setModiIp(request.getRemoteAddr());
            qPoll.setModiId(admInfo.getAdmId());
			adminPollMngService.savePoll(qPoll);
		} catch (Exception e) {
			printStackTrace(e);
		}
		
		return "redirect:/admin/listPoll?qseq="+qPoll.getqSeq()+"&lseq="+qPoll.getLseq();
	}
	
	/**
	 * 설문조사 폼 수정 + (삭제_저장)
	 * 
	 * @param request request
	 * @param qPoll qPoll
	 * @param model model
	 * @return String String
	 */
	@RequestMapping(value="/admin/updatePoll",method=RequestMethod.POST)
	public String updatePoll(HttpServletRequest request, QPoll qPoll, Model model) {
		try {
			logger.info("AdminPollMngController - /admin/updatePoll");
			commonMenu( model,  qPoll);
			String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
            String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
			Admin admInfo = (Admin) request.getSession().getAttribute("adminInfo");
			qPoll.setModiYmd(inDate);
			qPoll.setModiHms(inTime);
            qPoll.setModiIp(request.getRemoteAddr());
            qPoll.setModiId(admInfo.getAdmId());
			adminPollMngService.updatePoll(qPoll);
		} catch (Exception e) {
			printStackTrace(e);
		}
		
		return "redirect:/admin/listPoll?qseq="+qPoll.getqSeq()+"&lseq="+qPoll.getLseq();
	}
	
	/**
	 * 설문조사 삭제
	 * 
	 * @param request request
	 * @param qPoll qPoll
	 * @param model model
	 * @return String String
	 */
	@RequestMapping(value="/admin/removePoll",method=RequestMethod.POST)
	public String removePoll(HttpServletRequest request, QPoll qPoll,Model model) {
		try {
			logger.info("AdminPollMngController - /admin/removePoll");
			commonMenu( model,  qPoll);
			String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
            String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
			Admin admInfo = (Admin) request.getSession().getAttribute("adminInfo");
			qPoll.setModiYmd(inDate);
			qPoll.setModiHms(inTime);
            qPoll.setModiIp(request.getRemoteAddr());
            qPoll.setModiId(admInfo.getAdmId());
			adminPollMngService.removePoll(qPoll);
		} catch (Exception e) {
			printStackTrace(e);
		}
		
		return "redirect:/admin/listPoll?qseq="+qPoll.getqSeq()+"&lseq="+qPoll.getLseq();
	}
	
	/**
	 * 기타선택 상세내용 보기
	 * @param request request
	 * @param qPoll qPoll
	 * @return ModelAndView ModelAndView
	 */ 
	@RequestMapping("/admin/listPollViewer/{gbnCd}/{problemSeq}")
	public String listPollViewer(@PathVariable("gbnCd") String gbnCd, @PathVariable("problemSeq") int problemSeq , Poll pollParam, Model model) {
		try {
			logger.info("AdminPollMngController - /admin/listPollViewer");
			commonMenu(model, pollParam);
			PageUtil PageUtil = new PageUtil();
			int numPerPage = 10; // 한 화면에 보여주는 게시물 수
			int total_page = 0;
			int findTotCnt = 0;

			// 초기 페이지 로딩될때 NULL값일 경우 1페이지로 고정시켜준다.
			if (GenericValidator.isBlankOrNull(pollParam.getPageNum())) {
				pollParam.setPageNum("1");
			}

			int current_page = 1; // 현재페이지 번호
			if (!GenericValidator.isBlankOrNull(pollParam.getPageNum())) {
				current_page = Integer.parseInt(pollParam.getPageNum());
			}
			
			QPoll qPoll = new QPoll();
			qPoll.setProblemSeq(problemSeq);
			
			//전체갯수조회
			findTotCnt = adminPollMngService.findPollViewerTotCnt(qPoll);

			if (findTotCnt > 0)
				total_page = PageUtil.getPageCount(numPerPage, findTotCnt);

			// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
			if (total_page < current_page)
				current_page = total_page;

			// 리스트에 출력할 데이터를 가져오기
			int start = (current_page - 1) * numPerPage + 1;
			int end = current_page * numPerPage;

			
			qPoll.setStart(start);
			qPoll.setEnd(end);
			
			//목록조회
			ArrayList<APoll> list = adminPollMngService.listPollViewer(qPoll);
			
			if(list != null && list.size() > 0) {
				// 목록번호를 화면에 출력하기 위한 로직
				int listNum, n = 0;
				for(APoll poll : list) {
					listNum = findTotCnt - (start + n) ;
					poll.setListNo(listNum+1);
					n++;
				}
				model.addAttribute("list",list);
				// 페이징 화면출력 //
				model.addAttribute("pageIndexList",PageUtil.pageIndexList(current_page, total_page));
			}
			
			model.addAttribute("problemSeq",problemSeq);
			model.addAttribute("gbnCd",gbnCd);
		} catch (Exception e) {
			printStackTrace(e);
		}
		
		return "admin/poll/listPollViewer";
	}
	
	 //메뉴 공통 메서드
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


