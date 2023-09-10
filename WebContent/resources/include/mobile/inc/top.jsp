<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


	<div id="headTop">
		<h1 id="logo"><a href="/m/index"><img src="/resources/include/mobile/image/logo.png" alt="종로구시설관리공단" /></a></h1>
		<div id="hutil">
			<select name="totalMenu" id="totalMenu" title="메뉴를 선택해주세요" onchange="totalMenu();">
			<optgroup label="전체메뉴"><option value="">전체메뉴</option></optgroup>
				<optgroup label="문화체육시설">
				<option value="/m/facil/olympic/index">올림픽기념관</option>
				<option value="/m/facil/gumin/index">종로구민회관</option>
				<option value="/m/facil/jculture/index">종로문화체육센터</option>
				<option value="/m/facil/eastcult/index">동부여성문화센터</option>
				<option value="/m/facil/youth/index">청소년문화센터</option>
				<option value="/m/facil/stennis/index">삼청테니스장</option>
				</optgroup>
				<optgroup label="프로그램안내">
				<option value="/m/program/index/11">올림픽기념관</option>
				<option value="/m/program/index/21">종로구민회관</option>
				<option value="/m/program/index/41">종로문화체육센터</option>
				<option value="/m/program/index/31">동부여성문화센터</option>
				<option value="/m/program/index/32">청소년문화센터</option>
				<option value="/m/program/index/33">삼청테니스장</option>
				</optgroup>
				<optgroup label="주차">
				<option value="/m/parking/intro/index">주차</option>
				<option value="/m/parking/public/index">공영주차장</option>
				</optgroup>
				<optgroup label="공공시설">
				<option value="/m/public/insadong">인사동문화지구</option>
				<option value="/m/public/octagon">북악팔각정</option>
				<option value="/m/public/parkfacil">공원시설물</option>
				</optgroup>
				<optgroup label="공단소개">
				<option value="/m/intro/greeting">인사말</option>
				<option value="/m/intro/history">설립배경 및 연혁</option>
				<option value="/m/intro/condition">사업현황</option>
				<option value="/m/intro/organ">조직안내</option>
				<option value="/m/intro/location">오시는길</option>
				</optgroup>
				<optgroup label="안내">
				<option value="4">공지사항</option>
				<option value="9">입찰정보</option>
				<option value="10">채용공고</option>
				<option value="8">강좌안내</option>
				</optgroup>
			</select>
		</div>
	</div>
	<div id="visualLine">
		<div id="vl1"></div>
		<div id="vl2"></div>
		<div id="vl3"></div>
	</div>
