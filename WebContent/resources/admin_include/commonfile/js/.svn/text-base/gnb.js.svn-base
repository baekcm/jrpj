// JavaScript Document


// Top Menu. belong script for GNB

function initNavigation2(seq,subq) {
	nav = document.getElementById("topmenu");
	nav.menu = new Array();
	nav.current = null;
	nav.menuseq = 0;
	navLen = nav.childNodes.length;
	//비쥬얼 이미지 변경 시작 //
	if(seq==1) {
		$('#visual > img').attr('src',$('#visual > img').attr('src').replace('01','0'+seq+subq));
	}
	if(seq>1) {
		$('#visual > img').attr('src',$('#visual > img').attr('src').replace('01','0'+seq));
	}
	//비쥬얼 이미지 변경 끝//
	
	allA = nav.getElementsByTagName("a")
	for(k = 0; k < allA.length; k++) {
		allA.item(k).onmouseover = allA.item(k).onfocus = function () {
			nav.isOver = true;
		}
		allA.item(k).onmouseout = allA.item(k).onblur = function () {
			nav.isOver = false;
			setTimeout(function () {
				if (nav.isOver == false) {
					if (nav.menu[seq])
						nav.menu[seq].onmouseover();
					else if(nav.current) {
						menuImg = nav.current.childNodes.item(0);
						menuImg.src = menuImg.src.replace("_on.png", ".png");
						if (nav.current.submenu)
							nav.current.submenu.style.display = "none";
						nav.current = null;
					}
				}
			}, 500);
		}
	}

	for (i = 0; i < navLen; i++) {
		navItem = nav.childNodes.item(i);
		if (navItem.tagName != "LI")
			continue;

		navAnchor = navItem.getElementsByTagName("a").item(0);
		navAnchor.submenu = navItem.getElementsByTagName("ul").item(0);
		
		navAnchor.onmouseover = navAnchor.onfocus = function () {

			if (nav.current) {
				menuImg = nav.current.childNodes.item(0);
				menuImg.src = menuImg.src.replace("_on.png", ".png");
				
				if (nav.current.submenu)
					nav.current.submenu.style.display = "none";
				nav.current = null;
			}
			if (nav.current != this) {
				menuImg = this.childNodes.item(0);
				menuImg.src = menuImg.src.replace(".png", "_on.png");
				//$(this).parent(this).addClass('fb');
				if (this.submenu)
					{
						this.submenu.style.display = "block";
						//2depth 현재 메뉴 처리
						if(subq !=0) {
						$('#gnb'+seq+'_'+ subq+' > a').addClass('fb');						
						}

					}
				nav.current = this;
				
			}
			nav.isOver = true;
		}
		nav.menuseq++;
		nav.menu[nav.menuseq] = navAnchor;
	}
	if (nav.menu[seq])
		nav.menu[seq].onmouseover();
}
// Top Menu. above are for GNB

function initNavigation3(geq,seq,subq,teq) {
	$('#lnb > li > ul').css('display','none'); 
	if(geq==1) {	//4depth적용 특정 서브메뉴 변형 LNB적용을 위함`
		var seq=subq;
		var subq=teq;
	}
	var sub2=seq-1;
	var sub3=subq-1;
	var lcode = "#lnb" + seq + "_" + subq;
	$(lcode+ ' > a').addClass('current');
	$('#lnb' + seq + '_0 > a').addClass('current');
		
	if(subq>0) {
		$('#lnb' + seq + '_0 > ul').css('display', 'none');  // 서브를 탭으로 처리했음. 
	}
	
		
	//lnb toggle
	var cnt=0;
	var prev;
	$('#lnb li a').click(function() { 
	$('#lnb li a').removeClass('current');
	$(this).link="#";
	$(this).addClass('current');
	if($(this).parent(this).parent().children().find('ul')){
		
		if(cnt==0) {
			$(this).parent(this).parent().children().find('ul').css('display','none');
			$(this).parent(this).find('ul').css('display','none');  // 서브를 탭으로 처리했음. 
			cnt=1;
		}
		else {
			$(this).parent(this).parent().children().find('ul').css('display','none');
			$(this).parent(this).find('ul').css('display','none');
			cnt=0;
	}
		if(prev!=$(this)) $(this).parent(this).find('ul').css('display','none');  // 서브를 탭으로 처리했음. 
		prev=$(this);
	}
	});
	// 롤 오버
	$('#lnb img').each(function() {
		$(this).mouseover(function() {
			if ($(this).attr('src').match('_off')) {
				$(this).css('cursor', 'pointer');
				$(this).attr('src', $(this).attr('src').replace('_off', '_on'));
				$(this).mouseout(function() {
					$(this).attr('src', $(this).attr('src').replace('_on', '_off'));
				});
			}
		});
	});
}
// above are for LNB till GNB



function initMenu(n1,n2,n3,n4) {
	
	
	if (n1==0) {
	initNavigation2(0,0);}
	else {
	docTitleNavi(n1,n2,n3,n4);
	makeLnb(n1,n2,n3,n4);
	initNavigation2(n1,n2);
	initNavigation3(n1,n2,n3,n4);}
	if ( n3 != 0 || (n3==1 && n4 !=0 )) {
		makeTab(n1,n2,n3,n4);
	}
	else {
		$('#ttab3').parent().css('display','none');
	}
}




$(document).ready(function(e) {
	ttab3();
});


// ttab3 version 0.3 2013.09.06
// *simplfy code.
// *added makeTab function. that make ttab3 ul with in read GNB structure;
// Powered by Cho hyun jung  hidechen75Gmail.com
function ttab3()
{
	
    $('#ttab3 a').mouseover(function(){
        //alert($(this).find('img').attr('src'));
			//alert(!$(this).parent().html());
		if(!$(this).parent().hasClass('on')){
		$(this).parent().addClass('on');}
    }); 
 
    $('#ttab3 a').focus(function(){
        //alert($(this).find('img').attr('src'));
		if(!$(this).parent().hasClass('on')){
		$(this).parent().addClass('on');}
    }); 
    $('#ttab3 a').mouseout(function(){
        //alert($(this).find('img').attr('src'));
		if($(this).parent().hasClass('on')){
		$(this).parent().removeClass('on');}
    });
    $('#ttab3 a').blur(function(){
        //alert($(this).find('img').attr('src'));
		if($(this).parent().hasClass('on')){
		$(this).parent().removeClass('on');}
    });
    $('#ttab3 a').click(function(){
		ltab = document.getElementById("ttab3");
		allB = ltab.getElementsByTagName("a")
			for(j = 0; j < allB.length; j++) {
				allB.item(j).parentNode.className = '';
				}
				
			$(this).parent().addClass('choiced');			
    }); 
}

function makeTab(n1,n2,n3,n4) {
	var tmp3 = n4 - 1;
	var tmp2 = n3 - 1;
	var contWidth = 700; //컨텐츠 영역 폭 입력
	var apadding = 5;  // a태그가 가지는 패딩 값 입력
	var tabMargin = 5; // 탭간격 입력
	if(n1==1){
		$('#ttab3').html($('#gnb'+n1+'_'+n2+'_'+n3+' > ul').html());
		$('#ttab3>li:eq('+tmp3+')').addClass('choiced');
		$('#ttab3 a').css('text-decoration','none');
	}
	else{
		$('#ttab3').html($('#gnb'+n1+'_'+n2+' > ul').html());
		$('#ttab3>li:eq('+tmp2+')').addClass('choiced');
		$('#ttab3 a').css('text-decoration','none');

	}
	
	//아래는 탭의 가변 폭 계산 부분이나 종로에서는 가변 처리하지 않음
	//ltab = document.getElementById("ttab3");
	//allB = ltab.getElementsByTagName("a")
	//var cntTab = allB.length; // 탭의 갯수 계산
	
	//var tabWidth = (contWidth-apadding*2*cntTab-tabMargin*cntTab) / cntTab;
	//$('#ttab3 a').css('width',tabWidth);
	
}



//Doc Title & navigation Changer 
//ver 0.3
//This version improved, more detail navigation tracing, and page title, Document title were sperated for accessbillity.
//Powered by Cho Hyunjung hidechen75@gmail.com
function docTitleNavi(n1,n2,n3,n4) {
	var navi;
	var pageTitle,docTitle,subDocTitle, pSort;
	var pName = window.location.href;
	var basicTitle = "종로구 시설관리공단";
	
	if(pName.indexOf('_list.jsp')>0) { pSort = "목록보기"}
	else if(pName.indexOf('_view.jsp')>0) { pSort = "상세보기"}
	else if(pName.indexOf('_write.jsp')>0) { pSort = "작성하기"}
	else if(pName.indexOf('_modify.jsp')>0) { pSort = "수정하기"}
	else if(pName.indexOf('_apply.jsp')>0) { pSort = "신청하기"}
	else if(pName.indexOf('_calen')>0) { pSort = "달력보기"}
	else if(pName.indexOf('_category.jsp')>0) { pSort = "카테고리보기"}
	else if(pName.indexOf('_resultlist.jsp')>0) { pSort = "검색결과목록보기"}
	else { pSort =""}
	
	
	if(n1==1){
		
		if (n4 == 0 ){
			if(n3==0){
				navi = "<a href=\"/index.jsp\"><img src=\"/resources/admin_include/commonfile/image/common/icon_home.gif\" alt=\"홈\" /></a> &gt; "+ $('#gnb'+n1+ '>a > img').attr('alt') + " &gt; <strong> " + $('#gnb'+n1+'_'+n2+' > a').text() + "</strong>";
			
			docTitle = $('#gnb'+n1+'_'+n2 +' >a ').text() + " "+ pSort;
			pageTitle = $('#gnb'+n1+'_'+n2 +' >a ').text();
			$('#topVisual').css('display','none');
				}
			else{
			navi = "<a href=\"/index.jsp\"><img src=\"/resources/admin_include/commonfile/image/common/icon_home.gif\" alt=\"홈\" /></a> &gt; "+ $('#gnb'+n1+ '>a > img').attr('alt') + " &gt; " + $('#gnb'+n1+'_'+n2+' > a').text() + " &gt; <strong> " + $('#gnb'+n1+'_'+n2+'_'+n3+' > a').text() + "</strong>";
			
			docTitle = $('#gnb'+n1+'_'+n2+'_'+n3+' >a ').text() + " "+ pSort;
			pageTitle = $('#gnb'+n1+'_'+n2+'_'+n3+' >a ').text();
			}
			
		}
		else {
			var n4=n4-1;
			//$('#gnb'+n1+'_'+n2+'_'+n3+' li:eq('+n4+') >a').css('text-decoration','underline');
			//navi = "<a href="/index.jsp/">홈</a> > "+ $('#gnb'+n1+ '>a > img').attr('alt') + " > " + $('#gnb'+n1+'_'+n2+' > a').text() + " > " +	$('#gnb'+n1+'_'+n2+' > ul > li:eq('+n3+')').text() +"";
			
			navi = "<a href=\/index.jsp\"><img src=\"/resources/admin_include/commonfile/image/common/icon_home.gif\" alt=\"홈\" /></a> &gt; "+ $('#gnb'+n1+ '>a > img').attr('alt') + " &gt; " + $('#gnb'+n1+'_'+n2+' > a').text() + " &gt; " + $('#gnb'+n1+'_'+n2+'_'+n3+' > a').text() + " &gt; <strong>" + $('#gnb'+n1+'_'+n2+'_'+n3+' li:eq('+n4+') >a ').text() + "</strong>";
			subDocTitle = $('#gnb'+n1+'_'+n2+'_'+n3+' >a ').text();
			docTitle = subDocTitle  +"(" + $('#gnb'+n1+'_'+n2+'_'+n3+' > ul > li:eq('+n4+')').text() + " "+ pSort +")";
			pageTitle = $('#gnb'+n1+'_'+n2+'_'+n3+' li:eq('+n4+') >a ').text();
		}
	}
	else{
		if (n3 == 0 ){
			navi = "<a href=\"/index.jsp\"><img src=\"/resources/admin_include/commonfile/image/common/icon_home.gif\" alt=\"홈\" /></a> &gt; "+ $('#gnb'+n1+ '>a > img').attr('alt') + " ><strong> " + $('#gnb'+n1+'_'+n2+' > a').text() + "</strong>";
			
			docTitle = $('#gnb'+n1+'_'+n2+' > a').text() + " "+ pSort;
			pageTitle = $('#gnb'+n1+'_'+n2+' > a').text();
			
		}
		else {
			var n3=n3-1;
			//$('#gnb'+n1+'_'+n2+' > ul > li:eq('+n3+') >a').css('text-decoration','underline');
			//navi = "<a href="/index.jsp/">홈</a> > "+ $('#gnb'+n1+ '>a > img').attr('alt') + " > " + $('#gnb'+n1+'_'+n2+' > a').text() + " > " +	$('#gnb'+n1+'_'+n2+' > ul > li:eq('+n3+')').text() +"";
			
			navi = "<a href=\/index.jsp\"><img src=\"/resources/admin_include/commonfile/image/common/icon_home.gif\" alt=\"홈\" /></a> &gt; "+ $('#gnb'+n1+ '>a > img').attr('alt') + " &gt; " + $('#gnb'+n1+'_'+n2+' > a').text() + " &gt; <strong>" + $('#gnb'+n1+'_'+n2+' > ul > li:eq('+n4+')').text(); + "</strong>";
			subDocTitle = $('#gnb'+n1+'_'+n2+ ' >a ').text();
			docTitle = subDocTitle + " "+ pSort +"(" + $('#gnb'+n1+'_'+n2+' > ul > li:eq('+n4+')').text() +")";
			pageTitle = $('#gnb'+n1+'_'+n2+' > ul > li:eq('+n4+')').text();
		}
	}
	document.title =  docTitle + " : "+ basicTitle;
	$('.naviandtitle > h3').text(pageTitle);
	$('.naviandtitle > .navi').html(navi);
}

//Make LnB
function makeLnb(n1,n2,n3) {
	var userArea = 8;  //GNB에 있는 메뉴인지 여부를 판단하기 위해 부여하는 숫자. 
	if (n1 < userArea){
		if(n1==1){ //종로구 시설관리공단 사이트의 특정 메뉴 영역 처리
			var h2Text = $('#gnb'+n1+'>a > img').attr('alt');
			h2Text = "문화체육. "
			var h2Text2 = $('#gnb'+n1+'_'+n2+'>a').text();
			var h2html = "<img src='/resources/admin_include/commonfile/image/title/h2title"+n1+"_"+n2+".gif' alt='"+h2Text+h2Text2+"'>";
			$('#contleft > h2').html(h2html);
			
			var tmp2 = $('#gnb'+n1+'_'+n2+'> ul').html();
			tmp2=tmp2.replace(/gnb/g,'lnb');  
			$('#lnb').html(tmp2);
			$('#lnb > li').each(function(index, element) {
				var tmpNo= $('#lnb > li').index(this) +1;
				$(this).attr('id','lnb' + tmpNo + '_0');
				$(this).children(this).css('text-decoration','normal');
			});
			}
		else{
			var h2Text = $('#gnb'+n1+'>a > img').attr('alt');
			var h2html = "<img src='/resources/admin_include/commonfile/image/title/h2title"+n1+".gif' alt='"+h2Text+"'>";
			$('#contleft > h2').html(h2html);
			
			
			var tmp2 = $('#gnb'+n1+'> ul').html();
			tmp2=tmp2.replace(/gnb/g,'lnb');
			$('#lnb').html(tmp2);
			$('#lnb > li').each(function(index, element) {
				var tmpNo= $('#lnb > li').index(this) +1;
				$(this).attr('id','lnb' + tmpNo + '_0');
			});
		}
		$('#lnb > li > ul').addClass('submenu');
	}
}


