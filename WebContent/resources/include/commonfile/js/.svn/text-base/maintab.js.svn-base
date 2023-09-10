// JavaScript Document
//메인공지사항 탭
function tabList(ele, active){
	var ele = document.getElementById(ele);
	if(active === undefined) active = 0;						
	
	// tabtit를 포함하는 제목 노드들 수집 
	var btn = ele.getElementsByTagName("*");
	for(var i=0; i<btn.length; i++){
		if(btn[i].className.indexOf('tabtit') != -1){
			btn = btn[i].nodeName;
			btn = ele.getElementsByTagName(btn);
			break;
		}
	}
	
	// 타이틀의 타겟 레이어 이름중 숫자만 뺀 영문만 tab1 중 tab만
	var layerName = btn[0].getElementsByTagName("A")[0].href.split("#")[1];
	layerName = layerName.slice(0, layerName.length-1);

	for(var i=0; i<btn.length; i++){
		ele["target" + i] = document.getElementById(layerName + (i+1)); // 노드저장 예) tab1, tab2, tab3
		ele["a" + i] = btn[i].getElementsByTagName("A")[0]; // 탭링크
		ele["img" + i] = btn[i].getElementsByTagName("IMG")[0]; // 이미지노드 저장
		btn[i].style.position = "absolute"; // 제목레이어 적용
		ele.getElementsByTagName("P")[i].style.position = "absolute"; // 더보기 레이어
	}
	
	/* 초기세팅 */
	var oldActive = active;
	for(var i=0; i<btn.length; i++){
		ele["a" + i].cnt = i;
		ele["a" + i].onclick = function menuActive(){
			ele["target" + oldActive].style.display = "none";
			ele["img" + oldActive].src = ele["img" + oldActive].src.replace("_on", "_off");
			
			ele["target" + this.cnt].style.display = "block";
			ele["img" + this.cnt].src = ele["img" + this.cnt].src.replace("_off", "_on");
			oldActive = this.cnt;
			return false;
		}
		
		if(active == i) continue; // 초기 활성화
		ele["target" + i].style.display = "none";
		ele["img" + i].src = ele["img" + i].src.replace("_on", "_off");

	}
	
	
	
}
