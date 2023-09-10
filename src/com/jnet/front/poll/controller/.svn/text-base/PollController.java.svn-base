package com.jnet.front.poll.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.ListIterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.validator.GenericValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jnet.admin.pollMng.service.AdminPollMngService;
import com.jnet.domain.APoll;
import com.jnet.domain.Member;
import com.jnet.domain.Poll;
import com.jnet.util.CommonUtil;
import com.jnet.util.PageUtil;


@Controller
public class PollController {
	
//	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private AdminPollMngService adminPollMngService;
	 /**
		 * 설문조사 등록폼[사용자]
		 * @return ModelAndView ModelAndView
		 */
		@SuppressWarnings("unused")
		@RequestMapping("/front/listPoll")
		public String listPoll(Model model,Poll poll, HttpServletRequest request) {
			String pollSeq = String.valueOf(poll.getPollSeq());
			
			if (!GenericValidator.isBlankOrNull(poll.getSearchKey())) {
				model.addAttribute("searchKey", poll.getSearchKey());
			}
			if (!GenericValidator.isBlankOrNull(poll.getSearchVal())) {
				model.addAttribute("searchVal", poll.getSearchVal());
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
				
				Map<String, Object> hmap = new HashMap<String, Object>();
				hmap.put("searchKey", poll.getSearchKey());
				hmap.put("searchVal", poll.getSearchVal());
				hmap.put("useYn", "R");
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
				int listNum, n = 0;
				ListIterator<Poll> it = listPoll.listIterator();
				while (it.hasNext()) {
					poll = (Poll) it.next();
					listNum = findTotCnt - (start + n);
					poll.setListNo(listNum + 1);
					n++;
				}
				model.addAttribute("listPoll", listPoll);
				// 페이징 화면출력 //
				model.addAttribute("pageIndexList", PageUtil.pageIndexList(current_page, total_page));
				// 기본적으로 가지고 있어야 할 값들
				model.addAttribute("searchKey", hmap.get("searchKey"));
				model.addAttribute("searchVal", hmap.get("searchVal"));
				model.addAttribute("menuSeq", "52");
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return "/front/open/poll_list";
		}
		
		@SuppressWarnings({ "unchecked", "unused" })
		@RequestMapping("/front/findPoll")
		public String findPoll(Model model,APoll aPoll, HttpServletRequest request) {
			String pollSeq = String.valueOf(aPoll.getPollSeq());
			try{
				Member userInfo = (Member)request.getSession().getAttribute("userInfo");
				//map.put("userId", userInfo.getUserId());
				if(userInfo != null && userInfo.getUserId() != "") {
					aPoll.setCreateId(userInfo.getUserId());
				}
				Map<String, Object> findObj = adminPollMngService.findPoll(aPoll);
				Poll findPoll = (Poll)findObj.get("findPoll");
				ArrayList<Poll> listPollQuestion = (ArrayList<Poll>)findObj.get("listPollQuestion");
				
				model.addAttribute("findPoll",findPoll);
				model.addAttribute("listPollQuestion",listPollQuestion);
				model.addAttribute("menuSeq", "52");
			} catch (Exception e) {
			}
			return "/front/open/poll_view";
		}
		
		/**
		 * 설문조사 저장
		 * @return ModelAndView ModelAndView
		 */
		@RequestMapping(value="/front/savePoll",method=RequestMethod.POST)
		public String savePoll(Model model,HttpServletRequest request, APoll aPoll) {
			try {
				Member userInfo = (Member)request.getSession().getAttribute("userInfo");
				String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
	            String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
				aPoll.setCreateYmd(inDate);
				aPoll.setCreateHms(inTime);
				aPoll.setCreateId(CommonUtil.checkNull(userInfo.getUserId(), "guest"));
				aPoll.setCreateIp(request.getRemoteAddr());
				
				adminPollMngService.savePollAnswer(aPoll);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return "redirect:/front/listPoll";
		}
		
		
}
