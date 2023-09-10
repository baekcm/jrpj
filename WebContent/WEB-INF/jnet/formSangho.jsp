<%@  page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!--/상호 검색설명-입력 영역 시작/-->
<div class="infoArea">
    <div>
        <strong>* 건물명으로 검색합니다.</strong><br />
        <span class="MAL10">예) 서울특별시 송파구 잠실동 35 트리지움아파트</span><br />
    </div>
    <div class="emp3">
        ※ 자세한 표기법은(<a href="http://juso.go.kr" target="_blank" title="도로명주소안내홈페이지">도로명주소안내홈페이지</a>)를 참조하세요.
    </div>
</div>

<div class="regiArea">
    <ul class="formarea">
        <li class="first">
            <label class="title" for="city">시도</label>
            <select name="city" id="city" style="width:150px;" >
                <option value="">선택</option>
                <option value="11" title="서울특별시" >서울특별시</option>
                <option value="42" title="강원도" >강원도</option>
                <option value="41" title="경기도">경기도</option>
                <option value="48" title="경상남도" >경상남도</option>
                <option value="47" title="경상북도" >경상북도</option>
                <option value="46" title="전라남도" >전라남도</option>
                <option value="45" title="전라북도" >전라북도</option>
                <option value="44" title="충청남도" >충청남도</option>
                <option value="43" title="충청북도" >충청북도</option>
                <option value="29" title="광주광역시" >광주광역시</option>
                <option value="27" title="대구광역시" >대구광역시</option>
                <option value="30" title="대전광역시" >대전광역시</option>
                <option value="26" title="부산광역시" >부산광역시</option>
                <option value="31" title="울산광역시" >울산광역시</option>
                <option value="28" title="인천광역시" >인천광역시</option>
                <option value="36" title="세종특별자치시" >세종특별자치시</option>
                <option value="50" title="제주특별자치도" >제주특별자치도</option>
            </select>
        </li>
        <li class="second">
            <label class="title" for="county">시군구</label>
            <select name="county" id="county" style="width:150px;" >
                <option value="">선택</option>
            </select>
        </li>
        <li class="first">
            <label class="title" for="town">읍면동</label>
            <select name="town" id="town" style="width:150px;" >
                <option value="">선택</option>
            </select>
        </li>
        <li class="second">
            <label class="title" for="bldgname">건물명</label>
            <input type="text" name="bldgname" id="bldgname" maxlength="20" style="width:146px; ime-mode:active" class="inputText" onkeydown="javascript:sendkeydown();" />
            <input type="text" name="bldgname1" id="bldgname1" style="display:none" />
        </li>
    </ul>
    <input type="button" name="btnfind" value="검색" class="btn"  />
</div>
<!--/상호 검색설명-입력 영역 끝/-->