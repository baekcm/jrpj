$(function(){
	//관리자권한 - 권한 선택
	$("#adminAuth").change(function(){
		if($("#adminAuth").val() == "") {
			//2depth(dynamic select box)
			$("#facilTbl").empty().hide();
			//3depth(hard select box)
			$("#menuGbn").val("");
			$("#menuGbnTbl").hide();
			$("#addbtnTbl").hide();
			$("#saleGbnTbl").empty().hide();
			$("#listChkTbl").empty().hide();
			$("#changeSaleSlct").remove();
			return;
		}
		//2depth(dynamic select box)
		$("#facilTbl").empty().hide();
		//3depth(hard select box)
		$("#menuGbn").val("");
		$("#menuGbnTbl").hide();
		$("#addbtnTbl").hide();
		$("#saleGbnTbl").empty().hide();
		$("#listChkTbl").empty().hide();
		if($(this).val() == "FRONT") {
			$("#menuGbnTbl").show();
		}
	});
	
	//메뉴(게시판/컨텐츠/프로그램변경)
	$("#menuGbn").change(function(){
		if($("#menuGbn").val() == "") {
			$("#listChkTbl").empty().hide();
			$("#saleGbnTbl").empty().hide();
			$("#addbtnTbl").show();
			$("#facilTbl").empty().hide();
			$("#changeSaleSlct").remove();
			return;
		}
		$("#listChkTbl").empty().hide();
		$("#saleGbnTbl").empty().hide();
		$("#addbtnTbl").show();
		$("#facilTbl").empty().hide();
		var codeGbnCd = "";

		if($("#menuGbn").val() == "BBS") {
			codeGbnCd = "board_id";			
		} else if($("#menuGbn").val() == "ACPT"){
			codeGbnCd = "minwon";
		} else {
			codeGbnCd = "up_id";
		}
		
		$.ajax({
	           type:"POST", 
	           url: "/admin/listFacil",
	           data : {"codeGbnCd" : codeGbnCd},
	           dataType : "json",
	           success: function(data){
	        	   if(data != undefined && data.listFacil != null && data.listFacil != ''){
			  		   	 var slctTag = "<span id='deptSpan'><select name='changeDeptSlct' id='changeDeptSlct'>";
			  		   	     slctTag+="<option value=''>선택</option>";
			  		   	   $.each(data.listFacil,function(idx,val){
			  	 	   				slctTag+="<option id='"+val.commCodeSeq+"' value='"+val.codeId+"'>"+val.codeNm+"</option>";
			  		   	   });
			  		   	   slctTag+="</select></span>&nbsp;&nbsp;";
			  		    $("#facilTbl").html(slctTag).show();
	        	   }
	           }, 
	           error : function(request, status, error) {
				alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
			}
		});
	});
	
	//시설 변경
	$(document).on("change","select[name=changeDeptSlct]",function(){
		if($.trim($("select[name=changeDeptSlct] option:selected").val()) == "") {
			$("#listChkTbl").empty();
			$("#changeSaleSlct").remove();
			return;
		}
		var menuType = $("#menuGbn").val();
		var bar = new Array( "11", "21", "31","32","33","41");
		if(menuType == "PGM") {
			$.ajax({
		           type:"POST", 
		           url: "/admin/listSaleIdByUpId",
		           data : {"upId" : $("#changeDeptSlct").val()},
		           dataType : "json",
		           success: function(data){
		        	   if(data != undefined && data.listSaleIdByUpId != null && data.listSaleIdByUpId != ''){
		        		   if(data.flag == "Y") {
		        			   var slctTag = "<span id='saleSpan'><select name='changeSaleSlct' id='changeSaleSlct'>";
				  		   	      slctTag+="<option value=''>선택</option>";
				  		   	    $.each(data.listSaleIdByUpId,function(idx,val){
				  	 	   				 slctTag+="<option value='"+val.id+"'>"+val.nm+"</option>";
				  		   	    });
				  		   	    slctTag+="</select></span>&nbsp;&nbsp;";
					  		    $("#saleGbnTbl").html(slctTag).show();
		        		   } else {
		        			   alert("에러::"+data.flag);
		        		   }
		        	   }
		           }, 
		           error : function(request, status, error) {
					alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
				}
			});
		} else if(menuType == "ACTS") {
			$.ajax({
		           type:"POST", 
		           url: "/admin/listMenuByType",
		           data : {"pageGbnCd" : "ADMIN" ,"menuType" : menuType},
		           dataType : "json",
		           success: function(data){
		        	  if(data != undefined && data.listMenuByType != null && data.listMenuByType != ''){
				  		   	 var chkTag = "";
				  		   	   $.each(data.listMenuByType,function(idx,val){
				  		   		   if(val.menuNm != "컨텐츠리스트") {
				  		   			chkTag += "<input type='checkbox' name='authChk' data='"+val.menuNm+"' value='"+val.menuSeq+"' />"+val.menuNm+"<br/>";   
				  		   		   }
				  		   	   });
				  		   	   
				  		    $("#listChkTbl").html(chkTag).show();
		        	   }
		           }, 
		           error : function(request, status, error) {
					alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
				}
			});
		} else if(menuType == "BBS") {
			$.ajax({
		           type:"POST", 
		           url: "/admin/listMenuByType",
		           data : {"pageGbnCd" : "FRONT" ,"menuType" : menuType, "commCodeSeq" : $("select[name=changeDeptSlct] option:selected").attr("id")},
		           dataType : "json",
		           success: function(data){
		        	   if(data != undefined && data.listMenuByType != null && data.listMenuByType != ''){
				  		   	 	var chkTag = "";
				  		   	 		chkTag += "<input type='checkbox' id='allChk' />전체선택<br/>";
				  		   	 		
				  		   	    var cnt = 0;
				  		   	 	for(var i=0; i<bar.length; i++) {
				  		   	 		if($("#changeDeptSlct").val() == bar[i]) {
				  		   	 			cnt++;
					  		   	   }	
				  		   	 	}
				  		   	 	
				  		   	 	if(cnt > 0 ) {
					  		   	   $.each(data.listMenuByType,function(idx,val){
					  		   			chkTag += "<input type='checkbox' name='authChk' data='"+val.menuNm+"' value='"+val.menuSeq+"' />"+val.menuNm+"<br/>";
					  		   	   });	
				  		   	 	} else {
					  		   	   $.each(data.listMenuByType,function(idx,val){
					  		   		   if(val.menuNm != "분실물습득안내" && val.menuNm != "무료체험강좌" && val.menuNm != "개인레슨안내") {
					  		   			   chkTag += "<input type='checkbox' name='authChk' data='"+val.menuNm+"' value='"+val.menuSeq+"' />"+val.menuNm+"<br/>";   
					  		   		   }
					  		   	   });
				  		   	 	}
				  		   	   
				  		    $("#listChkTbl").html(chkTag).show();
		        	   }
		           }, 
		           error : function(request, status, error) {
					alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
				}
			});
		} else if(menuType == "ACPT") {
			$.ajax({
		           type:"POST", 
		           url: "/admin/listMenuByType",
		           data : {"pageGbnCd" : "ADMIN" ,"menuType" : menuType},
		           dataType : "json",
		           success: function(data){
		        	  if(data != undefined && data.listMenuByType != null && data.listMenuByType != ''){
				  		   	 var chkTag = "";
				  		   	   $.each(data.listMenuByType,function(idx,val){
				  		   			chkTag += "<input type='checkbox' name='authChk' data='"+val.menuNm+"' value='"+val.menuSeq+"' />"+val.menuNm+"<br/>";   
				  		   	   });
				  		   	   
				  		    $("#listChkTbl").html(chkTag).show();
		        	   }
		           }, 
		           error : function(request, status, error) {
					alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
				}
			});
		}
	});
	
	// 프로그램 권한 최종select box
	$(document).on("change","#changeSaleSlct",function(){
		if($("#changeSaleSlct").val() == "") {
			$("#listChkTbl").empty();
			return;
		}
		$.ajax({
	           type:"POST", 
	           url: "/admin/listBasIdBySaleId",
	           data : {"upId" :  $("#changeDeptSlct").val() ,"saleId" : $("#changeSaleSlct").val()},
	           dataType : "json",
	           success: function(data){
	        	   if(data != undefined && data.listBasIdBySaleId != null && data.listBasIdBySaleId != ''){
			  		   	 var chkTag = "";
			  		   	 		chkTag += "<input type='checkbox' id='allChk' />전체선택<br/>";
			  		   	   $.each(data.listBasIdBySaleId,function(idx,val){
			  		   			chkTag += "<input type='checkbox' name='authChk' data='"+val.nm+"' value='"+val.id+"' />"+val.nm+"<br/>";
			  		   	   });
			  		   	   
			  		    $("#listChkTbl").html(chkTag).show();
	        	   }
	           }, 
	           error : function(request, status, error) {
				alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
			}
		}); 
	});
	
	//권한 선택후 추가버튼 클릭
	$("#addbtn").click(function(){
		var menuType = $("#menuGbn").val();
			if($("input[name=authChk]:checked").size() == 0) {
				alert("권한추가 메뉴를 체크해주세요");
				return;
			} else {
				var dpSeq = "";
				$("input[name=authChk]:checked").each(function(){
					$this = $(this);
					var facilNm = $.trim($("select[name=changeDeptSlct] option:selected").text());
					var slctMenuNm = $.trim($this.attr("data"));
					
					$("#tmpSaveData").find("input[name=menuSeqStrArr]").each(function(){
						$subthis = $(this);
						if($("select[name=changeDeptSlct] option:selected").val()+"_"+$this.val() == $subthis.parent().find("input[name=codeIdArr]").val()+"_"+$subthis.val()){
							dpSeq = $this.val();
							return false;
						}
					});
					
					if(dpSeq == "") {
						var tag = "";

						tag+= '<span>'+facilNm +' > ';
						if($("#menuGbn").val() == "PGM"){
							tag+= $("#changeSaleSlct option:selected").text() +' > ';
						}
						tag+= slctMenuNm;
						if($("#menuGbn").val() == "PGM"){
							tag+= "(프로그램)";
						} else if($("#menuGbn").val() == "ACTS"){
							tag+= "(컨텐츠)";
						} else if($("#menuGbn").val() == "BBS"){
							tag+= "(게시판)";
						} else if($("#menuGbn").val() == "ACPT") {
							tag+= "(민원관리)";
						}
						tag+= "&nbsp;</span>";
						tag+='<span><input type="button" name="rmMenuBtn" value="X" />';
						tag+='<input type="hidden" name="codeIdArr" value="'+$("select[name=changeDeptSlct] option:selected").val()+'" />';
						if($("#menuGbn").val() == "PGM"){
							tag+='<input type="hidden" name="pgmGbnCdArr" value="PGM" />';
							tag+='<input type="hidden" name="saleIdArr" value="'+$("#changeSaleSlct").val()+'" />';
						} else if($("#menuGbn").val() == "ACTS"){
							tag+='<input type="hidden" name="pgmGbnCdArr" value="CTS" />';
							tag+='<input type="hidden" name="saleIdArr" value="" />';
							
						} else if($("#menuGbn").val() == "BBS"){
							tag+='<input type="hidden" name="pgmGbnCdArr" value="BBS" />';
							tag+='<input type="hidden" name="saleIdArr" value="" />';
						} else if($("#menuGbn").val() == "ACPT"){
							tag+='<input type="hidden" name="pgmGbnCdArr" value="CPT" />';
							tag+='<input type="hidden" name="saleIdArr" value="" />';
						}
						tag+='<input type="hidden" name="menuSeqStrArr" value="'+$this.val()+'" /><br/></span>';
						$("#tmpSaveData").append(tag);	
					}else {
						dpSeq = "";
					}
				});
			}
	});
	
	//권한 추가후 삭제버튼 클릭
	$(document).on("click","input[name=rmMenuBtn]",function(){
		$(this).parent().prev().remove();
		$(this).parent().remove();
	});
});
	

//비밀번호 검증
function CehckPassWord(ObjUserPassWord){
    if(ObjUserPassWord.length<6){
        return false;
    }
    if(!ObjUserPassWord.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/)){
        return false;
    }
 return true;
}



function mgrBeforeSubmit(flag){
	if($.trim($("#adminId").val()) == "") {
		alert("아이디를 입력해주세요");
		return;
	}
	if($.trim($("#dpYn").val()) == "N") {
		alert("중복체크를 해주세요");
		return;
	}
	
	//등록일 경우에만 비밀번호 체크
	if(flag == "I") {
		if($.trim($("#adminPwd").val()) == "") {
			alert("비밀번호를 입력해주세요");
			return;
		} else {
			if(!CehckPassWord(document.getElementById("adminId"), document.getElementById("adminPwd"))){
				return;
			}
		}
		if($.trim($("#adminRePwd").val()) == "") {
			alert("비밀번호 확인을 입력해주세요");
			return;
		}
		if($.trim($("#adminRePwd").val()) != $.trim($("#adminPwd").val())) {
			alert("비밀번호와 비밀번호 확인값이 서로 일치하지 않습니다.	");
			return;
		}
	}
	
	if($.trim($("#adminNm").val()) == "N") {
		alert("담당자이름을 입력해주세요");
		return;
	}
	/*if($("#admPhone1Slct").val() == "") {
		alert("연락처를 입력해주세요");
		return;
	} 
	if($.trim($("#adminPhone1").val()) == "" || $.trim($("#adminPhone2").val()) == "" || $.trim($("#adminPhone3").val()) == "") {
		alert("연락처를 입력해주세요");
		return;
	}*/
	
	if($("#adminEmail2Slct").val() == "") {
		alert("이메일을 입력해주세요");
		return;
	} 
	
	if($.trim($("#adminEmail1").val()) == "" || $.trim($("#adminEmail2").val()) == "") {
		alert("이메일을 입력해주세요");
		return;
	}
	
	if($("#adminAuth").val() == "FRONT"){
		if($("input[name=menuSeqStrArr]").size() == 0) {
			alert("운영자 권한설정이 필요합니다");
			return;
		}	
	}
	
	$("#frm").submit();	
}
function adminLogout(){
	location.href = "/admin/logout";
}
 function NumObj(obj){
	   if (event.keyCode >= 48 && event.keyCode <= 57) { //숫자키만 입력
	    return true;
	   } else {
	   event.returnValue = false;
	  }
  }
 function callChart(mainTab,subTab){
	 	if(subTab == "4") {
	 		$("#monthSearch").hide();
	 		$("#yearSearch").hide();
	 		$("#slctSearch").show();
	 		$("#yearSpn").hide();
			$("#monthSpn").hide();
			$("#weekSpn").hide();
	 		$("#chart1").empty();
	 	} else { 
	 		$.ajax({
		           type:"POST", 
		           url: "/admin/formChart",
		           data : {"mainTab" : mainTab, "subTab":subTab},
		           success: function(data){
		        	  $("div.textBox1").show();
		        	  $("#chart1").empty();
		        	  $("#slctSpn").hide();
		        	  eval(data);
		           }, 
		           error : function(request, status, error) {
					alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
				}
			});
	 	}
} 
 
function loadEditor(id, flag){
	//flag구분으로 한페이지당 에디터를 몇개를 쓰냐 결정됨
	if(flag == undefined)	 {
		oEditors = [];
		// 추가 글꼴 목록
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: id,
			sSkinURI: "/resources/editor/SmartEditor2Skin.html",	
			htParams : {
				bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				fOnBeforeUnload : function(){
				}
			}, //boolean
			fCreator: "createSEditor2"
		});
	} else if(flag == "two") {
		oEditors2 = [];
		// 추가 글꼴 목록
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors2,
			elPlaceHolder: id,
			sSkinURI: "/resources/editor/SmartEditor2Skin.html",	
			htParams : {
				bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				fOnBeforeUnload : function(){
				}
			}, //boolean
			fCreator: "createSEditor2"
		});
	}
	
}


function mergeRowSpan(tableId,idx,flag){
	var that;
	$("#"+tableId+" > tbody tr").each(function(i){
		$(this).find("td:eq("+idx+")").each(function(){
			if ($(this).attr("data") == $(that).attr("data")) {
	            rowspan = $(that).prop("rowSpan");
	            if (rowspan == undefined) {
	       
	              $(that).prop("rowSpan",1);
	              rowspan = $(that).prop("rowSpan");
	            }
	            rowspan = Number(rowspan)+1;
	            $(that).prop("rowSpan",rowspan);
	            $(this).hide();
	            $(that).next().prop("rowSpan",rowspan);
	            $(this).next().hide();
	            if(flag == "pgm") {
	            	$(that).next().next().prop("rowSpan",rowspan);
		            $(this).next().next().hide();
	            }
	          } else {
	            that = this;
	          }
	          that = (that == null) ? this : that; 

		});
	});
}


function setCookie (name, value, expires) {
  document.cookie = name + "=" + escape (value) +"; path=/; expires=" + expires.toGMTString();
}

function getCookie(Name) {
  var search = Name + "=";
  if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면
    offset = document.cookie.indexOf(search);
    if (offset != -1) { // 쿠키가 존재하면
      offset += search.length;
      // set index of beginning of value
      end = document.cookie.indexOf(";", offset);
      // 쿠키 값의 마지막 위치 인덱스 번호 설정
      if (end == -1)
        end = document.cookie.length;
      return unescape(document.cookie.substring(offset, end));
    }
  }
  return "";
}

function saveid() {
  var expdate = new Date();
  // 기본적으로 30일동안 기억하게 함. 일수를 조절하려면 * 30에서 숫자를 조절하면 됨
  if($("#idChk").prop("checked")){
	  expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30); // 30일
  } else {
	  expdate.setTime(expdate.getTime() - 1); // 쿠키 삭제조건
  }
  setCookie("saveid", $("#userId").val(), expdate);
}

function getid() {
	var saveId = getCookie("saveid");
	if(saveId != "") {
		$("#userId").val(saveId);
		$("#idChk").prop("checked",true);
	}
}
