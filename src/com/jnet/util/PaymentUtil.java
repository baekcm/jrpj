package com.jnet.util;

import java.io.Serializable;


public class PaymentUtil implements Serializable {
	
    /**
	 * 
	 */
	private static final long serialVersionUID = 2543309543615548055L;

	/* ============================================================================== */
    /* =   PAGE : 결제 정보 환경 설정 PAGE                                          = */
    /* =----------------------------------------------------------------------------= */
    /* =   연동시 오류가 발생하는 경우 아래의 주소로 접속하셔서 확인하시기 바랍니다.= */
    /* =   접속 주소 : http://kcp.co.kr/technique.requestcode.do			        = */
    /* =----------------------------------------------------------------------------= */
    /* =   Copyright (c)  2013   KCP Inc.   All Rights Reserverd.                   = */
    /* ============================================================================== */

    /* ============================================================================== */
    /* = ※ 주의 ※                                                                 = */
    /* = * 지불 데이터 설정                                                         = */
    /* =----------------------------------------------------------------------------= */
    /* = ※ 주의 ※                                                                 = */
	/* = * g_conf_home_dir 변수 설정                                                = */
    /* =   BIN 절대 경로 입력 (bin전까지 설정)                                      = */
    /* =                                                                            = */
    /* = * g_conf_key_dir 변수 설정                                                 = */
    /* =   pub.key 파일의 절대 경로 설정(파일명을 포함한 경로로 설정)               = */
    /* =                                                                            = */
    /* = * g_conf_log_dir 변수 설정                                                 = */
    /* =   log 디렉토리 설정                                                        = */
    /* ==============================================================================*/
    //public static final String g_conf_home_dir  = "D:\\project\\workspaces\\ijongro\\src\\com\\kcp";                  // BIN 절대경로 입력 (bin전까지) 
    //public static final String g_conf_key_dir   = "D:\\project\\workspaces\\ijongro\\src\\com\\kcp\\bin\\pub.key";    // 공개키 파일 절대경로 
    //public static final String g_conf_log_dir   = "D:\\project\\logs\\ijongro\\kcp\\log";             // LOG 디렉토리 절대경로 입력
    /* ==============================================================================*/
    /* = ※ 주의 ※                                                                 = */
    /* = * g_conf_gw_url 설정                                                       = */
    /* =----------------------------------------------------------------------------=*/
    /* = 테스트 시 : testpaygw.kcp.co.kr로 설정해 주십시오.                         = */
    /* = 실결제 시 : paygw.kcp.co.kr로 설정해 주십시오.                             = */
    /* ==============================================================================*/
    //public static final  String g_conf_gw_url    = "testpaygw.kcp.co.kr";
	public static final  String g_conf_gw_url    = "paygw.kcp.co.kr";

    /* ============================================================================== */
    /* = ※ 주의 ※                                                                 = */
    /* = * g_conf_js_url 설정                                                       = */
    /* =----------------------------------------------------------------------------= */
	/* = 테스트 시 : src="http://pay.kcp.co.kr/plugin/payplus_test.js"              = */
	/* =             src="https://pay.kcp.co.kr/plugin/payplus_test.js"             = */
    /* = 실결제 시 : src="http://pay.kcp.co.kr/plugin/payplus.js"                   = */
	/* =             src="https://pay.kcp.co.kr/plugin/payplus.js"                  = */
    /* =                                                                            = */
	/* = 테스트 시(UTF-8) : src="http://pay.kcp.co.kr/plugin/payplus_test_un.js"    = */
	/* =                    src="https://pay.kcp.co.kr/plugin/payplus_test_un.js"   = */
    /* = 실결제 시(UTF-8) : src="http://pay.kcp.co.kr/plugin/payplus_un.js"         = */
	/* =                    src="https://pay.kcp.co.kr/plugin/payplus_un.js"        = */
    /* ============================================================================== */
    //public static final  String g_conf_js_url    = "https://pay.kcp.co.kr/plugin/payplus_test_un.js";
    public static final  String g_conf_js_url    = "https://pay.kcp.co.kr/plugin/payplus_un.js";

    /* ============================================================================== */
    /* = 스마트폰 SOAP 통신 설정                                                    = */
    /* =----------------------------------------------------------------------------= */
    /* = 테스트 시 : false                                                          = */
    /* = 실결제 시 : true                                                           = */
    /* ============================================================================== */
    public static final  boolean g_conf_server    = false;

    /* ============================================================================== */
    /* = g_conf_site_cd, g_conf_site_key 설정                                       = */
    /* = 실결제시 KCP에서 발급한 사이트코드(site_cd), 사이트키(site_key)를 반드시   = */
    /* = 변경해 주셔야 결제가 정상적으로 진행됩니다.                                = */
    /* =----------------------------------------------------------------------------= */
    /* = 테스트 시 : 사이트코드(T0000)와 사이트키(3grptw1.zW0GSo4PQdaGvsF__)로      = */
    /* =            설정해 주십시오.                                                = */
    /* = 실결제 시 : 반드시 KCP에서 발급한 사이트코드(site_cd)와 사이트키(site_key) = */
    /* =            로 설정해 주십시오.                                             = */
    /* ============================================================================== */
    public static final  String g_conf_site_cd_test   = "T0000";
    public static final  String g_conf_site_key_test  = "3grptw1.zW0GSo4PQdaGvsF__";
    public static final  String g_conf_site_name_test = "KCP TEST SHOP";
    
    
    public static final  String g_conf_site_cd_olympic   = "S4225";
    public static final  String g_conf_site_key_olympic  = "1bo9DkqLCLnS7P2UZ6DXD5L__";
    public static final  String g_conf_site_name_olympic = "올림픽기념국민생활관";
    
    public static final  String g_conf_site_cd_gumin   = "S4316";
    public static final  String g_conf_site_key_gumin  = "3985CpF4YtkaU4APJwyAsm6__";
    public static final  String g_conf_site_name_gumin = "종로구민회관";
    
    public static final  String g_conf_site_cd_culture   = "S4317";
    public static final  String g_conf_site_key_culture  = "1636zJ462UFNBslFil.U-LL__";
    public static final  String g_conf_site_name_culture = "종로문화체육센터";
    
    
    

    /* ============================================================================== */
    /* = g_conf_site_name 설정                                                      = */
    /* =----------------------------------------------------------------------------= */
    /* = 사이트명 설정(한글 불가) : 반드시 영문자로 설정하여 주시기 바랍니다.       = */
    /* ============================================================================== */
    //public static final  String g_conf_site_name = "KCP TEST SHOP";

    /* ============================================================================== */
    /* = 지불 데이터 셋업 (변경 불가)                                               = */
    /* ============================================================================== */
    public static final  String g_conf_log_level = "3";
    public static final  String g_conf_gw_port   = "8090";        // 포트번호(변경불가)
    public static final  String module_type      = "01";          // 변경불가
    public static final  int    g_conf_tx_mode   = 0;             // 변경불가
    
    private String g_conf_site_cd = "";
    private String g_conf_site_key = "";
    private String g_conf_site_name = "";
    
    
	public String getG_conf_site_cd() {
		return g_conf_site_cd;
	}
	public void setG_conf_site_cd(String g_conf_site_cd) {
		this.g_conf_site_cd = g_conf_site_cd;
	}
	public String getG_conf_site_key() {
		return g_conf_site_key;
	}
	public void setG_conf_site_key(String g_conf_site_key) {
		this.g_conf_site_key = g_conf_site_key;
	}
	public String getG_conf_site_name() {
		return g_conf_site_name;
	}
	public void setG_conf_site_name(String g_conf_site_name) {
		this.g_conf_site_name = g_conf_site_name;
	}
    
    
    
    
}
