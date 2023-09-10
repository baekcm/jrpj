package com.jnet.util;

public class PageUtil {
		
		// *******************************************************************************
	    // 페이지 수 구하기
	    // *******************************************************************************
		public int getPageCount(int numPerPage, int dataCount) {
			int pageCount = 0;
			int remain = 0;
			 // 총 페이지 수를 구하기 위한 나머지 계산
			remain = dataCount % numPerPage;
			if(remain == 0){
				pageCount = dataCount / numPerPage;
			}
			else{
				pageCount = dataCount / numPerPage + 1;
			}
			return pageCount;
		}
		
		// 자바 스크립트(listPage 함수)에 의한 페이지 처리 메서드 ***********************
	    public String pageIndexList(int current_page, int total_page) {
	    	int numPerBlock = 10;   // 리스트에 나타낼 페이지 수
	        int currentPageSetUp;
	        int n;
	        int page;

	        String strList="";
	        
	        if(current_page == 0)
	        	return "";
	        
	        // 표시할 첫 페이지
	        currentPageSetUp = (current_page / numPerBlock) * numPerBlock;
	        if (current_page % numPerBlock == 0)
	            currentPageSetUp = currentPageSetUp - numPerBlock;

	        // 1 페이지
	        if ((total_page > numPerBlock) && (currentPageSetUp > 0)) {
	        	strList = "<span class='prev'><a style='cursor: pointer;'  onclick='setPage(1)'><img src='/resources/admin_include/commonfile/image/board/btn_pageFirst.gif' alt='맨 첫 페이지로 가기' /></a></span>";
	        }

	        // [Prev] : 총 페이지수가 numPerBlock 이상인 경우 이전 numPerBlock 보여줌
	        n = current_page - 1;
	        if (total_page > numPerBlock && currentPageSetUp > 0) {
	        	strList = strList + "<span class='prev mr15'><a style='cursor: pointer;' onclick='setPage("+n+")'><img src='/resources/admin_include/commonfile/image/board/btn_pagePrev.gif' alt='이전 10개 보기' /></a></span>";
	        }

	        // 바로가기 페이지 구현
	        page = currentPageSetUp + 1;
	        while((page <= total_page) && (page <= currentPageSetUp + numPerBlock)) {
	           if(page == current_page) {
	        	   strList = strList + "<span class='paging tp first'>" + page + "</span>";
	           } else {
	        	   strList = strList +"<span class='paging'><a style='cursor: pointer;' onclick='setPage("+page+")'>" + page + "</a></span>";
	           }
	           page++;
	        }
	        
	        // [Next] : 총 페이지수가 numPerBlock 페이지 이상인 경우 다음 numPerBlock 페이지를 보여줌
	        n = current_page + 1;
	        if (total_page - currentPageSetUp > numPerBlock) {
	        	strList = strList + "<span class='next ml10'><a style='cursor: pointer;' onclick='setPage("+n+")'><img src='/resources/admin_include/commonfile/image/board/btn_pageNext.gif' alt='다음 10개 보기' /></a></span>";
	        }

	        // 마지막 페이지
	        if ((total_page > numPerBlock) && (currentPageSetUp + numPerBlock < total_page)) {
	            strList = strList + "<span class='next'><a style='cursor: pointer;' onclick='setPage("+total_page+")'><img src='/resources/admin_include/commonfile/image/board/btn_pageLast.gif' alt='맨 마지막 페이지로 가기' /></a></span>";
	        }
	        return strList;
			
	    }
	    // 자바 스크립트(listPage 함수)에 의한 페이지 처리 메서드 ***********************
	    /*
    	<div class="paging"> 
		<span class="pagePrev"><img src="/resources/include/mobile/image/board/btn_pagePrev.png" width="22" height="22" alt="이전페이지로" /></span>
		<p class="page"> <a href="#" class="on">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> </p>
		<span class="pageNext"><img src="/resources/include/mobile/image/board/btn_pageNext.png" width="22" height="22" alt="다음페이지로" /></span> 
		</div>
		*/
	    public String mPageIndexList(int current_page, int total_page) {
	    	int numPerBlock = 5;   // 리스트에 나타낼 페이지 수
	    	int currentPageSetUp;
	    	int n;
	    	int page;
	    	
	    	String strList="";
	    	
	    	if(current_page == 0)
	    		return "";
	    	
	    	// 표시할 첫 페이지
	    	currentPageSetUp = (current_page / numPerBlock) * numPerBlock;
	    	if (current_page % numPerBlock == 0)
	    		currentPageSetUp = currentPageSetUp - numPerBlock;
	    	
	    	// 1 페이지
	    	/*if ((total_page > numPerBlock) && (currentPageSetUp > 0)) {
	    		strList = "<span class='prev'><a style='cursor: pointer;'  onclick='setPage(1)'><img src='/resources/admin_include/commonfile/image/board/btn_pageFirst.gif' alt='맨 첫 페이지로 가기' /></a></span>";
	    	}*/
	    	
	    	// [Prev] : 총 페이지수가 numPerBlock 이상인 경우 이전 numPerBlock 보여줌
	    	n = current_page - 1;
	    	if (total_page > numPerBlock && currentPageSetUp > 0) {
	    		strList = strList + "<span class='pagePrev'><a style='cursor: pointer;' onclick='setPage("+n+")'><img src='/resources/include/mobile/image/board/btn_pagePrev.png' width='22' height='22' alt='이전5페이지로' /></a></span>";
	    	}
	    	
	    	// 바로가기 페이지 구현
	    	page = currentPageSetUp + 1;
	    	strList=strList +"<p class='page'>";
	    	while((page <= total_page) && (page <= currentPageSetUp + numPerBlock)) {
	    		if(page == current_page) {
	    			strList = strList + "<a class='on'>" + page + "</a>";
	    		} else {
	    			strList = strList +"<a style='cursor: pointer;' onclick='setPage("+page+")'>" + page + "</a>";
	    		}
	    		page++;
	    	}
	    	strList=strList +"</p>";
	    	// [Next] : 총 페이지수가 numPerBlock 페이지 이상인 경우 다음 numPerBlock 페이지를 보여줌
	    	n = current_page + 1;
	    	if (total_page - currentPageSetUp > numPerBlock) {
	    		strList = strList + "<span class='pageNext'><a style='cursor: pointer;' onclick='setPage("+n+")'><img src='/resources/include/mobile/image/board/btn_pageNext.png' width='22' height='22' alt='다음5페이지로' /></a></span>";
	    	}
	    	
	    	// 마지막 페이지
/*	    	if ((total_page > numPerBlock) && (currentPageSetUp + numPerBlock < total_page)) {
	    		strList = strList + "<span class='next'><a style='cursor: pointer;' onclick='setPage("+total_page+")'><img src='/resources/admin_include/commonfile/image/board/btn_pageLast.gif' alt='맨 마지막 페이지로 가기' /></a></span>";
	    	}*/
	    	return strList;
	    	
	    }
}
