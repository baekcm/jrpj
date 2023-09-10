//////////////////////////////Update Zhang////////////////////////////////
// XecureWeb SSL Client Java Script ver4.1  2001.5.30
//
// ���� : Netscape 6.0�� ������� �ʽ��ϴ�....
// Edit List 2000,05,30
// process_error() --> XecureWebError() // by Zhang ����
// function IsNetscape60()		// by Zhang �߰�
// function XecureUnescape(Msg)		// by Zhang �߰�
// function XecureEscape(Msg)		// by Zhang �߰�
// function XecurePath(xpath)		// by zhang �߰�

/**
 * @mainpage XecureWeb SSL Client JavaScript API�޴���
 * 
 * @section Program XecureWeb SSL Client JavaScript
 * - ���α׷� �̸� : XecureWeb SSL Client JavaScript
 * - ���α׷� ���� : XecureWeb SSL Client�� API�� ��ȭ�� ����� ����� ���ǿ� �µ��� �����Ѵ�.
 *
 * @section CREATEINFO �ۼ�����
 * - �ۼ��� : 2008/04/28
 */
/**
 * @file xecureweb.js
 * xecureweb javascript�� ����ü
 *
 * @author  PKI Part, Softforum R&D Team
 * @date    2008/04/28
 * @attention Copyright (c) 2008 Softforum - All rights reserved.
 */


/**
 * @defgroup clientRequestCryptoAPI Ŭ���̾�Ʈ Request ��ȣ API
 * Ŭ���̾�Ʈ Request ��ȣ API<BR>
 */
/**
 * @defgroup serverResponseCryptoAPI ���� Response ��ȣ API
 * ���� Response ��ȣ API<BR>
 */
/**
 * @defgroup digitalSignAPI ���ڼ��� API
 * ���ڼ��� API<BR>
 * @code
 * var sign_desc=����; ( ����� Ȯ��â�� �⺻ ���? )
 * var show_plain=1; ( 0 : ����� Ȯ��â ������ �ʱ� , 1 : ����� Ȯ��â ���̱� )
 * var accept_cert = ��yessign,SoftForum CA��; (���? ���� ��ȿ�� ������� ��� (CN) )
 * // Yessign Test : yessignCA-TEST
 * // Yessign Real : yessignCA
 * // SignGate Test : SignGateFTCA
 * // SignGate Real : signGate CA
 * // SignKorea Test : SignKorea Test CA
 * // SignKorea Real : SignKorea CA
 * // ��Ÿ ������������߱���(�������)��CN
 * var pwd_fail = 3; (������ ��ȣ ���� ���ȸ��)
 * var xgate_addr	= window.location.hostname + ��:443:8080��; 
 * (������ ���ǰ����� IP�� ��Ʈ��ȣ , 443 : Direct port , 8080 : Proxy port )
 * @endcode
 */
/**
 * @defgroup CMPAPI ������ �߱�/����/��� ��� CMP API
 * ������ �߱�/����/��� ��� CMP API<BR>
 * @code
 * var ca_ip =  ��203.233.91.232��;  (YesSign ���� ������� IP - Test)
 * var ca_ip =  ��203.233.91.71��;  (YesSign ���� ������� IP - Real)
 * var ca_ip =  "192.168.10.25;SoftforumCA"; (Xecure ������� IP;CA Name)
 * var ca_port = 4512; (YesSign ���� ������� Port )
 * var ca_type = 11; (YesSign ������� Type ? Test)
 * var ca_type = 1; (YesSign ������� Type ? Real)
 * var ca_type = 101; (Xecure ������� Type ? RSA)
 * var ca_type = 101+256; (Xecure ������� Type ? RSA & CSP ���� Ű1�ָ� ��)
 * var ca_type = 102; (Xecure ������� Type ? GPKI)
 * var pwd_fail = 3; (������ ��ȣ ���� ���ȸ��)
 * @endcode
 */
/**
 * @defgroup SFCA_CMPAPI SFCA ������ ��� API
 * SFCA ������ ��� API<BR>
 * <B>Linux System������ �������� �ʴ´�.</B>
 */
/**
 * @defgroup etcAPI ��Ÿ API
 * ��Ÿ API<BR>
 */

var gIsContinue=0;
var busy_info = "��ȣȭ �۾��� �������Դϴ�. Ȯ���� �����ð� ��� ��ٷ� �ֽʽÿ�."

/**
 * �Ϻ�ȣ�� �������� ��õ� ���ڼ��� ��� ����<BR>
 * XecureWeb Java ���� �Ϻ�ȣ�� �ý��� ����Ʈ ���ڵ�� �ٸ� ���ڼ���<BR>
 * �޼����� ó���ϴ� ��� true ����
 *
 * @since 6.0 v210
 */
var usePageCharset=false;

// YESSIGN CA ADDRESS//////////////////////////////////////////////////////
// TEST : 203.233.91.234
// REAL : 203.233.91.71  
//var yessign_ca_type = 1;	// Yessign Real
/**
 * �ݰ�� CA�� ����<BR>
 * 1 : Yessign Real<BR>
 * 11 : Yessign Test
 */
var yessign_ca_type = 11;	// Yessign Test

/**
 * �ݰ�� CA�� ���� IP
 */
var yessign_ca_ip =  "203.233.91.234";

/**
 * �ݰ�� CA�� ���� Port
 */
var yessign_ca_port = 4512;

// XECURE CA ADDRESS///////////////////////////////////////////////////////
// TEST : 192.168.10.30
var xecure_ca_type = 101;	// XecureCA (RSA)
//var xecure_ca_type = 102;	// XecureCA (GPKI)
var xecure_ca_ip =  "192.168.10.25;SoftforumCA";
//var xecure_ca_ip =  "192.168.10.25";
var xecure_ca_port = 8200;

var xecure_ca_type_1 = 101;	// XecureCA (RSA)
//var xecure_ca_type = 102;	// XecureCA (GPKI)
var xecure_ca_ip_1 =  "192.168.10.30;mma ca";
var xecure_ca_port_1 = 2223;

/**
 * ���ڼ���, ������ ����, ������ ���ÿ� ������ ��ȣ���� ���ȸ��<BR>
 */
var pwd_fail = 3;

/**
 * ���? ���� ��ȿ�� ������� ��� (CN)<BR>
 * Sign, RequestCertificate, RevokeCertificate �� ��Ÿ���� ������ ��� <BR>
 * XecureWeb ver 5.1 ������ accept_cert �� ��ȿ�� ������� �������� <BR>
 * CN �� ��Ȯ�� ����ش�.<BR>
 * ver 4.0 ���� yessign �̶� ���� ���� yessignCA-TEST, yessignCA �� ����ȭ �ȴ�.<BR>
 * YESSIGN TEST : yessignCA-TEST<BR>
 * YESSIGN REAL : yessignCA<BR>
 */
var accept_cert = "yessignCA Class 1,CA131000002Test,CA131000002,Softforum CA 3.0,SoftforumCA,yessignCA,yessignCA-OCSP,signGATE CA,SignKorea CA,CrossCertCA,CrossCertCA-Test2,NCASign CA,TradeSignCA,yessignCA-TEST,lotto test CA,NCATESTSign,SignGateFTCA,SignKorea Test CA,TestTradeSignCA,Softforum Demo CA,mma ca,����û �������";


//////////////////////////////////////////////////////////////////////////////////
// �α��� â�� ���� �̹����� �ٿ�ε� ���� URL
//var bannerUrl =  "http://" + window.location.host + "/XecureObject/xecure.bmp";
/**
 * �α��� â�� ���� �̹����� �ٿ�ε� ���� URL<BR>
 */
var bannerUrl =  "http://" + window.location.host + "/XecureObject/xecureweb_big.bmp";

/**
 * ������� ������ �ٿ�ε�� ������� ������<BR>
 */
var pCaCertUrl= "http://" + window.location.host + "/XecureObject/signed_cacert.bin";
/**
 * ������� ������ �ٿ�ε�� ������� ������ CN<BR>
 */
var pCaCertName = "shinbo real ca";

/**
 * ����� Ȯ��â�� �⺻ ���?<BR>
 */
var sign_desc = "";
/**
 * ���ڼ��� Ȯ��â�� ���� �޼����� ���ڼ��� Ȯ��â ���� �ɼ�<BR>
 * 0 : ���� �� ��� ����, 1: ���� �� ��� 
 */
var show_plain = 0; 

/**
 * xgate ���� ��:��Ʈ ���� , ��Ʈ ��� ����Ʈ�� 443 ��Ʈ ���<BR>
 */
var xgate_addr	= window.location.hostname + ":1443:8443";

///////////////////////////////////////////////////////////////////////////////////
// Netscape plugin version information
var packageURL = 'http://' + window.location.host + '/XecureObject/NPXecSSL_Install.jar';
var versionMaj = 5;
var versionMin = 1;
var versionRel = 0;

/**
 * ��â, ����â, Loginâ���� ������ List�� �����Ͽ� �߱��ڸ� Rename�� ��<BR>
 * ����ϸ�, ������ �������� ��å���� �������� Rename�ǰ�, Default�� �缳������ �̴�.<BR>
 * �߱��ڴ� ������ �߱����� CN���� �������� Rename�ȴ�.<BR>
 * �ڼ��� ���� SE���� ����.<BR>
 * @ingroup etcAPI
 */
function SetConvertTable() {
}

function UserAgent()
{
	return navigator.userAgent.substring(0,9);
}

function IsNetscape()			// by Zhang
{
	//if(navigator.appName == 'Netscape')
	if((navigator.appName == 'Netscape') && (navigator.userAgent.indexOf("Trident") == -1))   //ie11대응
		return true ;
	else
		return false ;
}

function IsNetscape60()			// by Zhang
{
	if(IsNetscape() && UserAgent() == 'Mozilla/5')
		return true ;
	else
		return false ;
}

function IsNetscape60()			// by Zhang
{
	if(IsNetscape() && UserAgent() == 'Mozilla/5')
		return true ;
	else
		return false ;
}

function XecureUnescape(Msg)		// by Zhang
{
	if(IsNetscape())
		return unescape(Msg) ;
	else
		return Msg ;
}

/**
 * �־��� ���ڿ��� Escape ó�� ���ش�.<BR>
 *
 * @param Msg ��
 * @return Escape�� ���ڿ�
 */
function XecureEscape(Msg)		// by Zhang
{
	if(IsNetscape())
		return escape(Msg) ;
	else
		return Msg ;
}

function XecurePath(xpath)		// by zhang
{
	if(IsNetscape())
		return (xpath) ;
	else
		return ("/" + xpath) ;		
}

function XecureAddQuery(qs)
{
	if(qs == "")	
		return "" ;
	else
		return "&" + qs ;
}

function XecureWebError()		// by zhang
{
	var errCode = 0 ;
	var errMsg = "" ;
	
	if( IsNetscape60() )		// Netscape 6.0
	{
		errCode = document.XecureWeb.nsIXecurePluginInstance.LastErrCode();
		errMsg  = document.XecureWeb.nsIXecurePluginInstance.LastErrMsg();
	}
	else
	{
		errCode = document.XecureWeb.LastErrCode();
		errMsg  = document.XecureWeb.LastErrMsg();
	}
	
	if(errCode == -144)
	{
		if(confirm("�����ڵ� : " + errCode + "\n\n" + XecureUnescape(errMsg) + "\n\n ��������â�� ���ڽ��ϱ�?"))
			ShowCertManager() ;
	}
//	else if(errCode != 0)	
		alert( "�����ڵ� : " + errCode + "\n\n" + XecureUnescape(errMsg) );
	
	return false;
}

/**
 * ISO ����� url��ASCII ���ڿ��� ��ȯ�Ѵ�.
 *
 * @ingroup etcAPI
 * @param url escape ó���� ���ڿ�
 * @return escape ó���� ���ڿ�
 */
function escape_url(url) {
	var i;
	var ch;
	var out = '';
	var url_string = '';

	url_string = String(url);

	for (i = 0; i < url_string.length; i++) {
		ch = url_string.charAt(i);
		if (ch == ' ')		out += '%20';
		else if (ch == '%')	out += '%25';
		else if (ch == '&')	out += '%26';
		else if (ch == '+')	out += '%2B';
		else if (ch == '=')	out += '%3D';
		else if (ch == '?') out += '%3F';
		else				out += ch;
	}
	return out;
}

function ran_gen()
{
	var maxnumbers = "999999";
	var r = Math.round(Math.random() * (maxnumbers-1))+1+"";

	for(var i=0; i < 6-r.length; i++)
		r = "0" + r;
	
	return r;
}

/**
 * <B>���� ������ �����ϰ� �־��� url��query string �κ��� ��ȣȭ ���� �ʰ� �̵��Ѵ�. script ( javascript Ȥ�� VBscript ) ���ο��� �̵��� ��� ���</B><BR>
 * <BR>
 * script�� �ȿ��� window.open �̳�, document.location.href ���� �̿��� ������ <BR>
 * �̵��ÿ� query string�� ��ȣȭ ���� �ʰ� �̵��� ���<BR>
 * window.open, document.location.href ���XecureNavigate_NoEnc �Լ��� ȣ���Ѵ�.</B> <BR>
 * <BR>
 * Query string�� ��� ���  :   <B>url?q=��ȣȭ�� SID</B><BR>
 * Query string�� �ִ� ���  :   <B>url?q=��ȣȭ�� SID;��ȣȭ ���� ���� ������</B><BR>
 * <BR>
 * @ingroup clientRequestCryptoAPI
 * @param url : �̵��� URL
 * @param target �̵��� Ÿ��
 * @return Success : true<BR>
 * Fail : false
 */
function XecureNavigate_NoEnc( url, target )
{
	var qs ;
	var path = "/";
	var sid;
	var xecure_url;

	// get path info & query string & hash from url
	qs_begin_index = url.indexOf('?');
	path = getPath(url)

	// get query string action url
	if ( qs_begin_index < 0 ) {
		qs = "";
	}
	else {
		qs = url.substring(qs_begin_index + 1, url.length );
	}

	if( gIsContinue == 0 ) {
		gIsContinue = 1;
		if( IsNetscape60() )		// Netscape 6.0
			sid = document.XecureWeb.nsIXecurePluginInstance.BlockEnc(xgate_addr, path, "", "GET");
		else
			sid = document.XecureWeb.BlockEnc ( xgate_addr, path, "", "GET" );
		gIsContinue = 0;
	}
	else {
		alert(busy_info);
		return false ;
	}

	if( sid == "")	return XecureWebError();

	xecure_url = path + "?q=" + sid + XecureAddQuery(qs);
	// adding character set information
	if(usePageCharset)
		xecure_url += "&charset=" + document.charset;

	open ( xecure_url, target );
}

/**
 * <B>���� ������ �����ϰ� �־��� url��query string�� ��ȣȭ ���� �Էµ� frame ���� �̵��Ѵ�. script ( javascript Ȥ�� VBscript ) ���ο��� �̵��� ��� ���</B><BR>
 * <BR>
 * script�� �ȿ��� window.open �̳�, document.location.href ���� �̿��� ������ �̵��ÿ��� window.open, document.location.href ���<BR>
 * XecureNavigate �Լ��� ȣ���Ѵ�. <BR>
 * <BR>
 * Query string�� ��� ���  :   <B>url?q=��ȣȭ�� SID</B><BR>
 * Query string�� �ִ� ���  :   <B>url?q=��ȣȭ�� SID;��ȣȭ�� ������</B><BR>
 * <BR>
 * example><BR>
 * &lt;script language=javascript> <BR>
 * window.open ( ��/hello.php��, ��body�� ) ; <BR>
 * &lt;/script> <BR>
 * ==> <BR>
 * &lt;script language=javascript> <BR>
 * XecureNavigate ( ��/hello.php��, ��body�� ) ; <BR>
 * &lt;/script><BR>
 *
 * @ingroup clientRequestCryptoAPI
 * @param url �̵��� URL<BR>
 * @param target ��� ȭ���� ��µ� frame��<BR>
 * @param feature ���ο� â�� ���� ���� ( â ũ�� ��� ) ? �ɼ�
 *
 * @return Success : true<BR>
 * Fail : false
 *
 */
function XecureNavigate( url, target, feature )
{
var qs ;
var path = "/";
var cipher;
var xecure_url;

// get path info & query string & hash from url
qs_begin_index = url.indexOf('?');
path = getPath(url)
// get query string action url
if ( qs_begin_index < 0 ) {
	qs = "";
}
else {
	qs = url.substring(qs_begin_index + 1, url.length );
}

if( gIsContinue == 0 ) {
	gIsContinue = 1;
	if( IsNetscape60() )		// Netscape 6.0
		cipher = document.XecureWeb.nsIXecurePluginInstance.BlockEnc(xgate_addr, path, XecureEscape(qs), "GET");
	else 
		cipher = document.XecureWeb.BlockEnc(xgate_addr, path, XecureEscape(qs),"GET");
	gIsContinue = 0;
}
else {
	alert(busy_info);
	return false;
}
		
if( cipher == "" )	return XecureWebError();

xecure_url = path + "?q=" + escape_url(cipher);
// adding character set information
if(usePageCharset)
	xecure_url += "&charset=" + document.charset;

if (feature=="" || feature==null) open ( xecure_url, target );
else open(xecure_url, target, feature );

}

/**
 * ���ں����� �����ϴ� XecureNagivate<BR>
 *
 * @ingroup clientRequestCryptoAPI
 * @since XecureWeb 6.0 v220
 * @see XecureNavigate
 */
function XecureNavigate_Env( url, target, feature )
{
var qs ;
var path = "/";
var cipher;
var xecure_url;

// get path info & query string & hash from url
qs_begin_index = url.indexOf('?');
path = getPath(url)
// get query string action url
if ( qs_begin_index < 0 ) {
	qs = "";
}
else {
	qs = url.substring(qs_begin_index + 1, url.length );
}

if( gIsContinue == 0 ) {
	gIsContinue = 1;
	//cipher = document.XecureWeb.BlockEnc(xgate_addr, path, XecureEscape(qs), "GET");
	cipher = EnvelopData(XecureEscape(qs), "", serverCert, 1);
	gIsContinue = 0;
}
else {
	alert(busy_info);
	return false;
}
		
if( cipher == "" )	return XecureWebError();

//xecure_url = path + "?q=" + escape_url(cipher);
xecure_url = path + "?eq=" + escape_url(cipher);

// adding character set information
if(usePageCharset)
	xecure_url += "&charset=" + document.charset;

if (feature=="" || feature==null) {
	open ( xecure_url, target );
}
else {
	open(xecure_url, target, feature );
}

}

/**
 * ���ȼ����� �����ϰ� <a href> ���� �̿��Ͽ� �־��� link��query string�� ��ȣȭ �Ͽ� ����Ѵ�.<BR>
 * �� �Լ��� ȣ��Ǹ� ��Ʈ���� ClientSM ���� xgate��SSL handshaking�� ��û�Ͽ� ���ο� ���� ������<BR>
 * �����ϰų� ����� ���ȼ����� ������ Resume�� ����.  javascript onClick �̺�Ʈ�� ����Ͽ�<BR>
 * XecureLink �Լ��� ȣ���Ѵ�. �� �Լ��� ����Ǿ� �־��� url�� �̵��� ��append �Ǵ� query string��<BR>
 * ������ ����̴�.<BR>
 * <BR>
 * ��ȣȭ�� �����Ͱ� ��� ���  :   <B>url?q=��ȣȭ�� SID</B><BR>
 * ��ȣȭ�� �����Ͱ� �ִ� ���  :   <B>url?q=��ȣȭ�� SID;��ȣȭ�� ������</B><BR>
 * <BR>
 * ex><BR>
 * <a href=��enc_demo_result.php?aa=test&bb=test�� onClick=��return XecureLink(this);��>��ȣ</a><BR>
 *
 * @ingroup clientRequestCryptoAPI
 * @param link link ��ü
 * @return Success : true
 * Fail : false
 k*/
function XecureLink( link )
{
var qs ;
//	var path = "/";
var cipher;


// get path info & query string from action url 

if ( link.protocol != "http:" ) {
	// alert ( "http �������ݸ� ��� �����մϴ�." );
	return true;
}

qs = link.search;
if ( qs.length > 1 ) {
	qs = link.search.substring(1);
}

hash = link.hash;

if( gIsContinue == 0 ) {
	path = XecurePath(link.pathname) ;
	gIsContinue = 1;
	
	if( IsNetscape60() )		// Netscape 6.0
		cipher = document.XecureWeb.nsIXecurePluginInstance.BlockEnc(xgate_addr, path, XecureEscape(qs), "GET");
	else {
		//cipher = document.XecureWeb.BlockEnc(xgate_addr, "/XecureDemo/jsp/ibs/transfer_input.jsp", XecureEscape(qs),"GET");
		cipher = document.XecureWeb.BlockEnc(xgate_addr, path, XecureEscape(qs),"GET");
	}
	gIsContinue = 0;
}
else {
	alert(busy_info);
	return false;
}
if( cipher.length == 0)	return XecureWebError() ;

// link.search = "?q=" + escape_url(cipher);
xecure_url = "http://" + link.host + path + hash + "?q=" + escape_url(cipher);
// adding character set information
if(usePageCharset)
	xecure_url += "&charset=" + document.charset;

if ( link.target == "" || link.target == null ) open ( xecure_url, "_self" );
else open( xecure_url, link.target );
return false;
}

/**
 * ���ں����� �����ϴ� XecureLink<BR>
 *
 * @ingroup clientRequestCryptoAPI
 * @since XecureWeb 6.0 v220
 * @see XecureLink
 */
function XecureLink_Env( link )
{
var qs ;
//	var path = "/";
var cipher;


// get path info & query string from action url 

if ( link.protocol != "http:" ) {
	// alert ( "http �������ݸ� ��� �����մϴ�." );
	return true;
}

qs = link.search;
if ( qs.length > 1 ) {
	qs = link.search.substring(1);
}

hash = link.hash;

if( gIsContinue == 0 ) {
	path = XecurePath(link.pathname) ;
	gIsContinue = 1;
	//cipher = document.XecureWeb.BlockEnc(xgate_addr, path, XecureEscape(qs),"GET");
	cipher = EnvelopData(XecureEscape(qs), "", serverCert, 1);
	gIsContinue = 0;
}
else {
	alert(busy_info);
	return false;
}
if( cipher.length == 0)	return XecureWebError() ;

// link.search = "?q=" + escape_url(cipher);
//xecure_url = "http://" + link.host + path + hash + "?q=" + escape_url(cipher);
xecure_url = "http://" + link.host + path + hash + "?eq=" + escape_url(cipher);

// adding character set information
if(usePageCharset)
	xecure_url += "&charset=" + document.charset;

if ( link.target == "" || link.target == null ) open ( xecure_url, "_self" );
else open( xecure_url, link.target );
return false;
}

/**
 * <B>���� ������ �����ϰ� &lt;form> ���� �Էµ� �����͸� ��ȣȭ �Ͽ� ����Ѵ�.</B> <BR>
 * <B>�� �Լ��� ����ϱ� ���ؼ��� �ݵ��</B><BR>
 * <B>&lt;form name=��xecure��>&lt;input type=hidden name=��p��>&lt;/form> �� ������ ���� ��ġ�ϵ��� �Ѵ�.</B><BR>
 * <BR>
 * �� �Լ��� ȣ��Ǹ� ��Ʈ���� ClientSM ���� xgate��SSL handshaking�� ��û�Ͽ� ���ο� ���� ������ �����ϰų�<BR>
 * ����� ���ȼ����� ������ Resume�� ����. javascript onSubmit �̺�Ʈ�� ����Ͽ� XecureSubmit �Լ��� ȣ���Ѵ�. 
 * <BR>
 * <B><�־��� form ���� method�� ��GET�� �� ���></B><BR>
 * form ���� �Է��ʵ���� input1=x&input2=&�� ������� ���� ��Ʈ�ѿ� ������ ��Ʈ���� ���ȼ����� ����/Resume ����<BR>
 * �Էµ� �����͸� ��ȣȭ�Ͽ� �����Ѵ�. ��ȣ���� �޾Ƽ� attach ���� target url�� ����Ѵ�.
 * �̶� �־��� form��action��query string�� �ִ� ��� ��query string�� ���õǰ� ��۵��� �ʴ´�.
 * <BR>
 * <B><�־��� form ���� method�� ��POST�� �� ���></B><BR>
 * form��action�� �־��� query string�� ��Ʈ�ѿ� ������ ��Ʈ���� ���ȼ����� ����/Resume�� �� �Էµ� �����͸�<BR>
 * ��ȣȭ �Ͽ� �����Ѵ�. ��ȣ���� �޾Ƽ� url?q=xxx ���·� �̹� ����� xecure frame��action ���� �����Ѵ�. 
 * form ���� �Է��ʵ���� input1=x&input2=&�� ������� ���� ��Ʈ�ѿ� ������ ��Ʈ���� (1) �������� ����/Resume��<BR>
 * ���������� �̿��Ͽ� form ���� �Է��ʵ���� ��ȣȭ �Ͽ� �����Ѵ�.
 * Xecure frame��p�ʵ忡 ���ϵ� ��ȣ���� �������� <BR>
 * xecure.summit() ���� (1)���� ������ url�� �̵��Ѵ�.<BR>
 * <BR>
 * ��ȣȭ�� �����Ͱ� ��� ���  :     <B>url?q=��ȣȭ�� SID</B><BR>
 * ��ȣȭ�� �����Ͱ� �ִ� ���  :     <B>url?q=��ȣȭ�� SID;��ȣȭ�� ������</B><BR>
 * <BR>
 * example><BR>
 * &lt;form name=��xecure��>&lt;input type=hidden name=��p��>&lt;/form><BR>
 * <BR>
 * &lt;form name=transfer action=��enc_demo_result.php�� method=��post��<BR>
 *  onSubmit=��return XecureSubmit(this);��> <BR>
 *  ... <BR>
 * &lt;/form><BR>
 *
 * @ingroup clientRequestCryptoAPI
 * @param form : form ��ü
 * @return Success : true<BR>
 * Fail : false
 */
function XecureSubmit( form )
{
	var qs ;
	var path ;
	var cipher;

	qs_begin_index = form.action.indexOf('?');
	
	// if action is relative url, get base url from window location
	path = getPath(form.action)
	// get path info & query string & hash from action url
	if ( qs_begin_index < 0 ) {
		qs = "";
	}
	else {
		qs = form.action.substring(qs_begin_index + 1, form.action.length );
	}
	document.xecure.target = form.target;

	if ( form.method == "get" || form.method=="GET" ) {
		// collect input field values 
		//qs = XecureMakePlain( form );
		if(qs.length!=0)
			qs += "&"+XecureMakePlain( form );
		else
			qs = XecureMakePlain( form );

		// encrypt QueryString
		if( gIsContinue == 0 ) {
			gIsContinue = 1;
			if( IsNetscape60() )		// Netscape 6.0
				cipher = document.XecureWeb.nsIXecurePluginInstance.BlockEnc(xgate_addr, path, XecureEscape(qs),"GET");			
			else{
				cipher = document.XecureWeb.BlockEnc(xgate_addr, path, XecureEscape(qs),"GET");
			}
			gIsContinue = 0;
		}
		else {
			alert(busy_info);
			return false;
		}
		
		if( cipher == "" )	return XecureWebError() ;
		
		xecure_url = path + "?q=" + escape_url(cipher);
		// adding character set information
		if(usePageCharset)
			xecure_url += "&charset=" + document.charset;
		
		if ( form.target == "" || form.target == null ) open( xecure_url, "_self");
		else open ( xecure_url, form.target );
	}
	else {
		document.xecure.method = "post";

		// encrypt QueryString of action field
		if( gIsContinue == 0 ) {
			gIsContinue = 1;
			if( IsNetscape60() )		// Netscape 6.0
				cipher = document.XecureWeb.nsIXecurePluginInstance.BlockEnc(xgate_addr, path, XecureEscape(qs),"GET");			
			else {
				cipher = document.XecureWeb.BlockEnc(xgate_addr, path, XecureEscape(qs),"GET");
			}
			gIsContinue = 0;
		}
		else {
			alert(busy_info);
			return false;
		}		


		if( cipher == "" )	return XecureWebError() ;

		document.xecure.action = path + "?q=" + escape_url(cipher);
		// adding character set information
		if(usePageCharset)
			document.xecure.action += "&charset=" + document.charset;
		
		posting_data = XecureMakePlain( form );

		if( gIsContinue == 0 ) {
			gIsContinue = 1;
			if( IsNetscape60() )		// Netscape 6.0
				cipher = document.XecureWeb.nsIXecurePluginInstance.BlockEnc ( xgate_addr, path, XecureEscape(posting_data), "POST" );
			else{
				cipher = document.XecureWeb.BlockEnc ( xgate_addr, path, XecureEscape(posting_data), "POST" );
			}
			gIsContinue = 0;
		}
		else {
			alert(busy_info);
			return false;
		}		
		
		if( cipher == "" )	return XecureWebError() ;
		
		document.xecure.p.value = cipher;
		document.xecure.submit();
	}
	return false;
}

/**
 * ���ں����� �����ϴ� XecureSubmit<BR>
 *
 * @ingroup clientRequestCryptoAPI
 * @since XecureWeb 6.0 v220
 * @see XecureSubmit
 */
function XecureSubmit_Env( form )
{
	var qs ;
	var path ;
	var cipher;

	qs_begin_index = form.action.indexOf('?');
	
	// if action is relative url, get base url from window location
	path = getPath(form.action)
	// get path info & query string & hash from action url
	if ( qs_begin_index < 0 ) {
		qs = "";
	}
	else {
		qs = form.action.substring(qs_begin_index + 1, form.action.length );
	}
	document.xecure.target = form.target;
	
	if ( form.method == "get" || form.method=="GET" ) {
		// collect input field values 
		if(qs.length!=0)
			qs += "&"+XecureMakePlain( form );
		else
			qs = XecureMakePlain( form );
		
		// encrypt QueryString
		if( gIsContinue == 0 ) {
			gIsContinue = 1;
			//cipher = document.XecureWeb.BlockEnc(xgate_addr, path, XecureEscape(qs),"GET");
			cipher = EnvelopData(XecureEscape(qs), "", serverCert, 1);
			gIsContinue = 0;
		}
		else {
			alert(busy_info);
			return false;
		}
		
		if( cipher == "" )	return XecureWebError() ;
		
		//xecure_url = path + "?q=" + escape_url(cipher);
		xecure_url = path + "?eq=" + escape_url(cipher);
		
		// adding character set information
		if(usePageCharset)
			xecure_url += "&charset=" + document.charset;

		if ( form.target == "" || form.target == null ) open( xecure_url, "_self");
		else open ( xecure_url, form.target );
	}
	else {
		document.xecure.method = "post";

		// encrypt QueryString of action field
		if( gIsContinue == 0 ) {
			gIsContinue = 1;
			//cipher = document.XecureWeb.BlockEnc(xgate_addr, path, XecureEscape(qs),"GET");
			cipher = EnvelopData(XecureEscape(qs), "", serverCert, 1);
			gIsContinue = 0;
		}
		else {
			alert(busy_info);
			return false;
		}		


		if( cipher == "" )	return XecureWebError() ;

		//document.xecure.action = path + "?q=" + escape_url(cipher);
		document.xecure.action = path + "?eq=" + escape_url(cipher);
		// adding character set information
		if(usePageCharset)
			document.xecure.action += "&charset=" + document.charset;

		posting_data = XecureMakePlain( form );

		if( gIsContinue == 0 ) {
			gIsContinue = 1;
			//cipher = document.XecureWeb.BlockEnc ( xgate_addr, path, XecureEscape(posting_data), "POST" );
			cipher = EnvelopData(XecureEscape(posting_data), "", serverCert, 1);
			gIsContinue = 0;
		}
		else {
			alert(busy_info);
			return false;
		}				
				
		if( cipher == "" )	return XecureWebError() ;
		
		//document.xecure.p.value = cipher;
		document.xecure.ep.value = cipher;
		document.xecure.submit();
	}
	return false;
}

function XecureMakePlain_Org(form)
{
	var name = new Array(form.elements.length); 
	var value = new Array(form.elements.length); 
	var flag = false;
	var j = 0;
	var plain_text="";
	var enable=false;//for softcamp

	//for softcamp
	if(document.secukey==null || typeof(document.secukey) == "undefined" || document.secukey.object==null) {
		enable=false;
	}
	else {
		enable=secukey.GetSecuKeyEnable();
	}


	len = form.elements.length; 
	for (i = 0; i < len; i++) {
		if ((form.elements[i].type != "button") && (form.elements[i].type != "reset") && (form.elements[i].type != "submit")) {
			if (form.elements[i].type == "radio" || form.elements[i].type == "checkbox") { // Leejh 99.11.10 checkbox�߰�
				if (form.elements[i].checked == true) {
					name[j] = form.elements[i].name; 
					value[j] = form.elements[i].value;
					j++;
				}
			}
			//for softcamp
			else if(enable && form.elements[i].type == "password"){
				if(form.elements[i].type == "password"){
					name[j] = form.elements[i].name;
					value[j] = secukey.GetRealPass(form.elements[i].name,form.elements[i].value);
					j++;
				}
			}
			else {
				name[j] = form.elements[i].name; 
				if (form.elements[i].type == "select-one") {
					var ind = form.elements[i].selectedIndex;
					if (form.elements[i].options[ind].value != '')
						value[j] = form.elements[i].options[ind].value;
					else
						value[j] = form.elements[i].options[ind].text;
					// form.elements[i].selectedIndex = 0;
				}
				else {
					value[j] = form.elements[i].value;
				}
				j++;
			}
		}
	}
	for (i = 0; i < j; i++) {
		str = value[i]; 
		value[i] = escape_url(str); 
	}

	for (i = 0; i < j; i++) {
		if (flag)
			plain_text += "&";
		else
			flag = true;
		plain_text += name[i] ;
		plain_text += "=";
		plain_text += value[i];
	}

	return plain_text;
}

/**
 * �־��� form ���� �Է��ʵ��� type��button/reset/submit�� ���� �����ϰ�<BR>
 * aa=bb&cc=dd&ee=��  ������� ���ۼ��Ͽ� �����Ѵ�.
 *
 * @param form form ��ü
 * @return Form ���� �Է��ʵ�� ������ �ۼ��� ������
 */
function XecureMakePlain(form)	// modified by tiger on 2004/12/22
{
       var name = new Array(form.elements.length);
       var value = new Array(form.elements.length);
       var flag = false;
       var j = 0;
       var plain_text="";


       //for softcamp
       if(document.secukey==null || typeof(document.secukey) == "undefined" || document.secukey.object==null) {
                    enable=false;
       }
       else {
                    enable=secukey.GetSecuKeyEnable();
       }

       len = form.elements.length;
       for (i = 0; i < len; i++) {
                    if ((form.elements[i].type != "button") && (form.elements[i].type != "reset") && (form.elements[i].type != "submit")) {
                                 if (form.elements[i].type == "radio" || form.elements[i].type == "checkbox") {
                                              if (form.elements[i].checked == true) {
                                                if (form.elements[i].disabled == false) {
                                                          name[j] = form.elements[i].name;
                                                          value[j] = form.elements[i].value;
                                                          j++;
                                                }
                                              }
                                 }
                                 //for softcamp
                                 else if(enable && form.elements[i].type == "password"){
                                              if(form.elements[i].type == "password"){
                                                            name[j] = form.elements[i].name;
                                                            value[j] = secukey.GetRealPass(form.elements[i].name,form.elements[i].value);
                                                            j++;
                                              }
                                 }
                                 else {
                                              name[j] = form.elements[i].name;
                                              if (form.elements[i].type == "select-one") {
                                                            var ind = form.elements[i].selectedIndex;
                                                            var op_len = form.elements[i].length;
                                                if (op_len > 0) {
                                                          if(ind > 0) {
                                                                     if (form.elements[i].options[ind].value != '')
                                                                               value[j] = form.elements[i].options[ind].value;
                                                                     else
                                                                               //value[j] = form.elements[i].options[ind].text;
                                                                               value[j] = "";
                                                          } else {
                                                                     if(ind == 0)
                                                                     {
                                                                               if (form.elements[i].options[ind].value != '')
                                                                                          value[j] = form.elements[i].options[ind].value;
                                                                               else
                                                                                          //value[j] = form.elements[i].options[ind].text;
                                                                                          value[j] = "";
                                                                     }
                                                          }
                                                          // form.elements[i].selectedIndex = 0;
                                                }
                                     }
                                     else if (form.elements[i].type == "select-multiple") {
                                                var llen = form.elements[i].length;
                                                var increased = 0;
                                                for( k = 0; k < llen; k++) {
                                                          if (form.elements[i].options[k].selected) {
                                                                     name[j] = form.elements[i].name;
                                                                     if (form.elements[i].options[k].value != '')
                                                                               value[j] = form.elements[i].options[k].value;
                                                                     else
                                                                               //value[j] = form.elements[i].options[k].text;
                                                                               value[j] = "";
                                                                     j++;
                                                                     increased++;
                                                          }
                                                }
                                                if(increased > 0) {
                                                          j--;
                                                }
                                                else {
                                                          value[j] = "";
                                                }
                                     }
                                     else {
                                                value[j] = form.elements[i].value;
                                     }
                                     j++;
                          }
                }
     }

       for (i = 0; i < j; i++) {
                    str = value[i];
                    value[i] = escape_url(str);
       }
 
       for (i = 0; i < j; i++) {
                    if (flag)
                                 plain_text += "&";
                    else
                                 flag = true;
                    plain_text += name[i] ;
                    plain_text += "=";
                    if (value[i] !="undefined"){
                                 plain_text += value[i];
                    }else {
                                 plain_text += "";
                    }
       }
 
       return plain_text;
}

/*************For Applet**********************/
function BlockEnc(auth_type,plain_text)
{	
	var cipher = "";

	if( IsNetscape60() )		// Netscape 6.0
		cipher =  XecureUnescape(document.XecureWeb.nsIXecurePluginInstance.BlockEnc(xgate_addr,auth_type,plain_text,"GET"));
	else
		cipher =  XecureUnescape(document.XecureWeb.BlockEnc(xgate_addr,auth_type,plain_text,"GET"));
		
	if( cipher == "" ) XecureWebError() ;
	
	return cipher;
}

/**
 * ����� ���������� ã�Ƽ� �ش� Ű�� ��ȣ���� ��ȣȭ�Ѵ�.<BR>
 *
 * @ingroup serverResponseCryptoAPI
 * @param cipher ��ȣȭ�� ��ȣ��
 * @return Success : ��ȣȭ�� ��<BR>
 * Fail : empty string (����) 
 */
function BlockDec(cipher)
{
	var plain = "";

	if( IsNetscape60() )		// Netscape 6.0
		plain = XecureUnescape(document.XecureWeb.nsIXecurePluginInstance.BlockDec( xgate_addr, cipher));
	else {
		plain = XecureUnescape(document.XecureWeb.BlockDec( xgate_addr, cipher));
	}

	if( plain == "" ) XecureWebError() ;
		
	return plain;
}

/**
 * ����� ���������� ã�Ƽ� �ش� Ű�� ��ȣȭ�� XML �����͸� ��ȣȭ�Ѵ�.
 *
 * @ingroup serverResponseCryptoAPI
 * @param cipher : ��ȣȭ�� XML data�� ��ȣ��
 * @return Success : ��ȣȭ�� ��<BR>
 * Fail : empty string (����) 
 */
function BlockXMLDec(cipher)
{
	var path = "";

	if( IsNetscape60() )		// Netscape 6.0
		path = XecureUnescape(document.XecureWeb.nsIXecurePluginInstance.BlockXMLDec( xgate_addr, cipher));	
	else
		path = XecureUnescape(document.XecureWeb.BlockXMLDec( xgate_addr, cipher));
	
	if( path == "" ) 	XecureWebError() ;
	
	return path;
}

/**
 * ���ȼ����� �����ϰ� <a href> ���� �̿��Ͽ� �־��� link��query string�� ��ȣȭ �Ͽ� ����Ѵ�.<BR>
 * ex>
 * <a href=��transfer_input.php �� target=main 
 * onClick=��return XecureLogIn(this);��>�α���</a>
 *
 * @param link link ��ü
 * @return Success : true <BR>
 * Fail : false
 */
function XecureLogIn( link )
{
	EndSession();
	return XecureLink(link);
}

/**
 * Xgate_addr�� �ش��ϴ� ���ȼ����� ������ �����Ѵ�.
 *
 * @ingroup etcAPI
 * @return Success : 0<BR>
 * Fail : �����ڵ�
 */
function EndSession()
{
	if( IsNetscape60() )		// Netscape 6.0
		document.XecureWeb.nsIXecurePluginInstance.EndSession( xgate_addr );
	else
		document.XecureWeb.EndSession(xgate_addr);
}

// XecureWeb ver 4.1 add
// option : 0 : no confirm window, all certificates
// option : 1 : confirm window, all certificates
// option : 2 : no confirm window, log-on certificate only
// option : 3 : confirm window, log-on certificate only

/**
 * �־��� �����Ϳ� ���� ������ �Ѵ�. <BR>
 * ����� Ȯ��â Diplay ���� �� ������ ���� ��� �� �� �ִ�.<BR>
 * �� �Լ��� ȣ���ϸ� ���ڼ��? �̷���� �� ���ȼ����� ��������� �ʴ´�.<BR>
 * <BR>
 * @param option : 0 : ����� Ȯ��â No Display, ��� ������ ���� �����ϰ�<BR>
 * 1 : ����� Ȯ��â Display, ��� ������ ���� �����ϰ�<BR>
 * 2 : ����� Ȯ��â No Display, Login�� �������θ� ���� �����ϰ�<BR>
 * 3 : ����� Ȯ��â Display, Login�� �������θ� ���� �����ϰ�<BR>
 * @param plain : �����ϰ��� �ϴ� ���� ��
 * @return Success : ����� ����[���ڼ��?=��+���?+������]<BR>
 * Fail : empty string (����)
 */
function Sign_with_option( option, plain )
{
	var signed_msg;

	if( IsNetscape60() )	// Netscape 6.0
		signed_msg = document.XecureWeb.nsIXecurePluginInstance.SignDataCMS( xgate_addr,
							escape(accept_cert), 
							escape(plain), 
							option, 
							escape(sign_desc),
							pwd_fail);
	else
		signed_msg = document.XecureWeb.SignDataCMS(
							xgate_addr,
							XecureEscape(accept_cert), 
							XecureEscape(plain), 
							option, 
							XecureEscape(sign_desc),
							pwd_fail);

    if( signed_msg == "" )	XecureWebError();

    return signed_msg;
}
 
/**
 * �־��� ���� �����Ϳ� ���� ������ �Ѵ�. <BR>
 * ����� Ȯ��â Diplay ���� �� ������ ���� ��� �� �� �ִ�.<BR>
 * �� �Լ��� ȣ���ϸ� ���ڼ��? �̷���� �� ���ȼ����� ��������� �ʴ´�.<BR>
 * <BR>
 * @ingroup digitalSignAPI
 * @param option 0 : ����� Ȯ��â No Display, ��� ������ ���� �����ϰ�<BR>
 * 1 : ����� Ȯ��â Display, ��� ������ ���� �����ϰ�<BR>
 * 2 : ����� Ȯ��â No Display, Login�� �������θ� ���� �����ϰ�<BR>
 * 3 : ����� Ȯ��â Display, Login�� �������θ� ���� �����ϰ�
 * @param plain �����ϰ��� �ϴ� ���� ��
 *
 * @return Success : ����� ����[���ڼ��?=��+���?+������(n)]<BR>
 * Fail : empty string (����)
 */
function Sign_Add( option, plain )
{
	var signed_msg;

	signed_msg = document.XecureWeb.SignDataAdd ( xgate_addr, accept_cert, plain, option, sign_desc, pwd_fail );

    if( signed_msg == "" )	XecureWebError() ;

    return signed_msg;
}

/**
 * �־��� �����Ϳ� ���ڼ����� �Ѵ�.<BR>
 * ����� Ȯ��â�� �� ��� â�� ���?�� sign_desc �̴�.<BR>
 * �� �Լ��� ȣ���ϸ� ���ڼ��? �̷���� �� ���ȼ����� ��������� �ʴ´�.<BR>
 * @ingroup digitalSignAPI
 * @param plain :  �����ϰ��� �ϴ� ���� ��
 * @return Success : ����� ����[���ڼ��?=��+���?+������]<BR>
 * Fail : empty string (����) 
 */
function Sign( plain )
{
	var signed_msg;
	
	if( IsNetscape60() )		// Netscape 6.0
	{
		signed_msg = document.XecureWeb.nsIXecurePluginInstance.SignDataCMS( xgate_addr, XecureEscape(accept_cert), XecureEscape(plain), show_plain, XecureEscape(sign_desc) );
	}
	else
	{
		signed_msg = document.XecureWeb.SignDataCMS( xgate_addr, XecureEscape(accept_cert), XecureEscape(plain), show_plain, XecureEscape(sign_desc) );
	}
	
	if( signed_msg == "" )	XecureWebError() ;
	
	return signed_msg;
}

/**
 * �־��� �����Ϳ� ���� ������ �Ѵ�. <BR>
 * ����� Ȯ��â�� ���?�� ����� �� �ִ�.<BR>
 * �� �Լ��� ȣ���ϸ� ���ڼ��? �̷���� �� ���ȼ����� ��������� �ʴ´�.<BR>
 * @ingroup digitalSignAPI
 * @param plain �����ϰ��� �ϴ� ���� ��
 * @param desc ����� Ȯ��â�� ���?
 * @return Success : ����� ����[���ڼ��?=��+���?+������]<BR>
 * Fail : empty string (����)
 */
function Sign_with_desc( plain, desc )
{
	var signed_msg;

	if( IsNetscape60() )		// Netscape 6.0
		signed_msg = document.XecureWeb.nsIXecurePluginInstance.SignDataCMS( xgate_addr, XecureEscape(accept_cert), XecureEscape(plain), show_plain, XecureEscape(desc) );
	else
		signed_msg = document.XecureWeb.SignDataCSM( xgate_addr, XecureEscape(accept_cert), XecureEscape(plain), show_plain, XecureEscape(desc) );
		
	if( signed_msg == "" )	XecureWebError() ;
	
	return signed_msg;
}

// XecureWeb ver 4.1 add
// option : 0 : no confirm window, all certificates
// option : 1 : confirm window, all certificates
// option : 2 : no confirm window, log-on certificate only
// option : 3 : confirm window, log-on certificate only

// XecureWeb ver 5.0 add

/**
 * �־��� ���� �����Ϳ� ���� ������ �Ѵ�. <BR>
 * ����� Ȯ��â Diplay ���� �� ������ ���� ��� �� �� �ִ�.<BR>
 * �� �Լ��� ȣ���ϸ� ���ڼ��? �̷���� �� ���ȼ����� ��������� �ʴ´�.<BR>
 * �ĺ���ȣ�� ���Ե� �������� ����â���� ������� IDN�� �Է� �ϸ�, send_vid_info() �� ���� �ĺ� ��ȣ ������ ���� ��ȣȭ �� ���� ������ �� �ִ�.<BR>
 * <BR>
 * @ingroup digitalSignAPI
 * @param option 0 : ����� Ȯ��â No Display, ��� ������ ���� �����ϰ�<BR>
 * 1 : ����� Ȯ��â Display, ��� ������ ���� �����ϰ�<BR>
 * 2 : ����� Ȯ��â No Display, Login�� �������θ� ���� �����ϰ�<BR>
 * 3 : ����� Ȯ��â Display, Login�� �������θ� ���� �����ϰ�
 * @param plain �����ϰ��� �ϴ� ���� ��
 * @param svrCert IDN, R ���� ��ȣȭ�ϱ� ���� ������ ( pem type )
 *
 * @return Success : ����� ����[���ڼ��?=��+���?+������]<BR>
 * Fail : empty string (����)
 */
function Sign_with_vid_user( option, plain, svrCert )
{
	var signed_msg;

	option = option + 4;
	
	if(IsNetscape())
	{
		alert("Not supported function");
	}
	else {
		signed_msg = document.XecureWeb.SignDataWithVID ( xgate_addr, accept_cert, plain, svrCert, option, sign_desc, pwd_fail );
	}

    if( signed_msg == "" )	XecureWebError();

    return signed_msg;
}

/**
 * �־��� ���� �����Ϳ� ���� ������ �Ѵ�. <BR>
 * ����� Ȯ��â Diplay ���� �� ������ ���� ��� �� �� �ִ�.<BR>
 * �� �Լ��� ȣ���ϸ� ���ڼ��? �̷���� �� ���ȼ����� ��������� �ʴ´�.<BR>
 * ���ڼ���� �ĺ���ȣ Ȯ���� ���Ͽ� Web Application���� ������� IDN�� �Է� �ϸ�, send_vid_info() �� ���� �ĺ� ��ȣ ������ ���� ��ȣȭ �� ���� ������ �� �ִ�.<BR>
 * <BR>
 * @ingroup digitalSignAPI
 * @param option : 0 : ����� Ȯ��â No Display, ��� ������ ���� �����ϰ�<BR>
 * 1 : ����� Ȯ��â Display, ��� ������ ���� �����ϰ�<BR>
 * 2 : ����� Ȯ��â No Display, Login�� �������θ� ���� �����ϰ�<BR>
 * 3 : ����� Ȯ��â Display, Login�� �������θ� ���� �����ϰ�
 * @param plain �����ϰ��� �ϴ� ���� ��
 * @param svrCert IDN, R ���� ��ȣȭ�ϱ� ���� ������ ( pem type )
 * @param idn �������� �ֹε��(����ڵ��)��ȣ
 *
 * @return Success : ����� ����[���ڼ��?=��+���?+������]<BR>
 * Fail : empty string (����)
 */
function Sign_with_vid_web( option, plain, svrCert, idn )
{
	var ret;
	var signed_msg;

	option = option + 12;
	
	if(IsNetscape())
	{
		alert("Not supported function");
	}
	else {
		ret = Set_ID_Num(idn);
		if(ret != 0) {
			XecureWebError();
			return signed_msg;
		}
			
		signed_msg = document.XecureWeb.SignDataWithVID ( xgate_addr, accept_cert, plain, svrCert, option, sign_desc, pwd_fail );
	}

    if( signed_msg == "" )	XecureWebError();

    return signed_msg;
}

// only over XecureWeb Client v5.3.0.1
// [certLocation]
// 	0 : HARD
//	1 : REMOVABLE
//	2 : ICCARD
//	3 : CSP
//	4 : VSC
// [option]
//	0 : ����� Ȯ��â ����
//	1 : ����� Ȯ��â ���
/**
 * �־��� �ø��� ��ȣ�� ��ġ�ϴ� �������� �־��� �����͸� ���� ������ �Ѵ�.<BR>
 * ����� Ȯ��â Diplay �� ������ �� �ִ�.<BR>
 * �� �Լ��� ȣ���ϸ� ���ڼ��? �̷���� �� ���ȼ����� ��������� �ʴ´�.<BR>
 * �ĺ���ȣ�� ���Ե� �������� ����â���� ������� IDN�� �Է��ϸ�, send_vid_info() �� ���� �ĺ� ��ȣ ������ ���� ��ȣȭ�� ���� ������ �� �ִ�.<BR>
 *
 * @ingroup digitalSignAPI
 * @param certSerial : ���? ����� �������� �ø��� ��ȣ<BR>
 * ���� ���� �ø����� ����� ��� ��,���� �����Ѵ�.<BR>
 * Ex) ��008ade93, 008ade94��
 * @param certLocation ���? ����� ������ ��ġ<BR>
 * 0 : �ϵ��ũ, 1 : �̵��ĵ�ũ, 2 : ICī��,3 :CSP 4: pkcs11,5:USBTOKEN_KIUP, 6 :iccard,  7 :NO_SMARTON, 8 : USBTOKEN_KIUP, 9 :YESSIGNM
 * @param option 0 : ����� Ȯ��â No Display<BR>
 * 1 : ����� Ȯ��â Display
 * @param plain �����ϰ��� �ϴ� ���� ��
 * @param svrCert IDN, R ���� ��ȣȭ�ϱ� ���� ������ ( pem type )
 *
 * @return Success : ����� ����[���ڼ��?=��+���?+������]<BR>
 * Fail : empty string (����)
 */
function Sign_with_vid_user_serial( certSerial, certLocation, option, plain, svrCert )
{
	var signed_msg;

	option = option + 4;
	
	if(IsNetscape())
	{
		alert("Not supported function");
	}
	else {
		signed_msg = document.XecureWeb.SignDataWithVID_Serial ( xgate_addr, accept_cert, certSerial, certLocation, plain, svrCert, option, sign_desc, pwd_fail );
	}

    if( signed_msg == "" )	XecureWebError();

    return signed_msg;
}

// only over XecureWeb Client v5.3.0.1
// [certLocation]
// 	0 : HARD
//	1 : REMOVABLE
//	2 : ICCARD
//	3 : CSP
//	4 : VSC
// [option]
//	0 : ����� Ȯ��â ����
//	1 : ����� Ȯ��â ���

/**
 * �־��� �ø��� ��ȣ�� ��ġ�ϴ� �������� �־��� �����͸� ���� ������ �Ѵ�.<BR>
 * ����� Ȯ��â Diplay �� ������ �� �ִ�.<BR>
 * �� �Լ��� ȣ���ϸ� ���ڼ��? �̷���� �� ���ȼ����� ��������� �ʴ´�.<BR>
 * ���ڼ���� �ĺ���ȣ Ȯ���� ���Ͽ� Web Application���� ������� IDN�� �Է��ϸ�, send_vid_info() �� ���� �ĺ� ��ȣ ������ ���� ��ȣȭ �� ���� ������ �� �ִ�.<BR>
 *
 * @ingroup digitalSignAPI
 * @param certSerial ���? ����� �������� �ø��� ��ȣ<BR>
 * ���� ���� �ø����� ����� ��� ��,���� �����Ѵ�.<BR>
 * Ex) ��008ade93, 008ade94��
 * @param certLocation ���? ����� ������ ��ġ<BR>
 * 0 : �ϵ��ũ, 1 : �̵��ĵ�ũ, 2 : ICī��,3 :CSP 4: pkcs11,5:USBTOKEN_KIUP, 6 :iccard,  7 :NO_SMARTON, 8 : USBTOKEN_KIUP, 9 :YESSIGNM
 * @param option 0 : ����� Ȯ��â No Display<BR>
 * 1 : ����� Ȯ��â Display
 * @param plain �����ϰ��� �ϴ� ���� ��
 * @param svrCert IDN, R ���� ��ȣȭ�ϱ� ���� ������ ( pem type )
 * @param idn �������� �ֹε��(����ڵ��)��ȣ
 *
 * @return Success : ����� ����[���ڼ��?=��+���?+������]<BR>
 * Fail : empty string (����)
 */
function Sign_with_vid_web_serial( certSerial, certLocation, option, plain, svrCert, idn )
{
	var ret;
	var signed_msg;

	option = option + 12;
	
	if(IsNetscape())
	{
		alert("Not supported function");
	}
	else {
		ret = Set_ID_Num(idn);
		if(ret != 0) {
			XecureWebError();
			return signed_msg;
		}
			
		signed_msg = document.XecureWeb.SignDataWithVID_Serial ( xgate_addr, accept_cert, certSerial, certLocation, plain, svrCert, option, sign_desc, pwd_fail );
	}

    if( signed_msg == "" )	XecureWebError();

    return signed_msg;
}

/**
 * ���� ����� �ĺ���ȣ Ȯ���� ����� ����� ���, IDN ���� Web Application �� �Ѱ��� ���, �����ϱ� ���� �� �Լ��� ���Ͽ� idn �� �Ѱ��ش�.<BR>
 * Sign_with_vid_web() ���ο� ���Ǿ� ����.
 *
 * @ingroup digitalSignAPI
 * @param idn �ĺ���ȣ(�ֹε��/����ڵ�Ϲ�ȣ)
 * @return Success : 0<BR>
 * Fail : -1
 */
function Set_ID_Num(idn)
{
	var ret;
	
	if( IsNetscape() )
	{
		alert("Not supported function");
	}
	else
	{
		ret = document.XecureWeb.SetIDNum(idn);
	}
	
	return ret;
}

/**
 * Send_vid_info_user() �Ǵ� Send_vid_info_web() ȣ���� ���Ͽ� �ĺ���ȣ�� ���Ե� �������� ���,<BR>
 * �ĺ���ȣ(VID)�� Ȯ���ϱ� ���� ������ ��ȣȭ �Ͽ� return �Ѵ�.<BR>
 * ����, �ĺ���ȣ�� ���Ե��� ���� �������� ��� null �� return �Ѵ�.
 * 
 * @ingroup digitalSignAPI
 * @return Success : �ĺ� ��ȣ ������ ���� ��ȣȭ�� ����<BR>
 * Fail : empty string (����)
 */
function send_vid_info()
{
	var	vid_info;
	
	if( IsNetscape() )
	{
		alert("Not supported function");
	}
	else
	{
		vid_info = document.XecureWeb.GetVidInfo();
	}
	
	if(vid_info.length == 0)
		return null;
	else
		return vid_info;
}

// only over XecureWeb Client v5.3.0.1
// [certLocation]
// 	0 : HARD
//	1 : REMOVABLE
//	2 : ICCARD
//	3 : CSP
//	4 : VSC
// [option]
//	0 : ����� Ȯ��â ����
//	1 : ����� Ȯ��â ���
/**
 * �־��� �ø��� ��ȣ�� ��ġ�ϴ� �������� �־��� �����͸� ���� ������ �Ѵ�. <BR>
 * ����� Ȯ��â Diplay ������ ������ �� �ִ�.<BR>
 * �� �Լ��� ȣ���ϸ� ���ڼ��? �̷���� �� ���ȼ����� ��������� �ʴ´�.<BR>
 *
 * @ingroup digitalSignAPI
 * @param certSerial : ���? ����� �������� �ø��� ��ȣ<BR>
 * ���� ���� �ø����� ����� ��� ��,���� �����Ѵ�.<BR>
 * Ex) ��008ade93, 008ade94��<BR>
 * @param certLocation ���? ����� ������ ��ġ<BR>
 * 0 : �ϵ��ũ, 1 : �̵��ĵ�ũ, 2 : ICī��,3 :CSP 4: pkcs11,5:USBTOKEN_KIUP, 6 :iccard,  7 :NO_SMARTON, 8 : USBTOKEN_KIUP, 9 :YESSIGNM
 * @param option 0 : ����� Ȯ��â No Display<BR>
 * 1 : ����� Ȯ��â Display
 * @param plain �����ϰ��� �ϴ� ���� ��
 * @return Success : ����� ����[���ڼ��?=��+���?+������]<BR>
 * Fail : empty string (����)
 *
 */
function Sign_with_serial( certSerial, certLocation, plain, option )
{
	var	signed_msg;

	if( IsNetscape() )
	{
		alert("Not supported function");
	}
	else
	{
		signed_msg = document.XecureWeb.SignDataCMSWithSerial(  xgate_addr, 
									XecureEscape(accept_cert), 
									certSerial, 
									certLocation, 
									plain, 
									option, 
									XecureEscape(sign_desc),
									pwd_fail );
	}

	if( signed_msg == "" )	XecureWebError();

	return signed_msg;	
}

//
// only over XecureWeb Client v5.4.x
//
// !!! This function need site/executable license !!!
// 
// [option]
//      0 : only signature verification( NOT perform cert verification )
// 	1 : signature verification + default cert verification
//	2 : + cert chain check
//	3 : + CRL check
//	4 : + LDAP 
// [directoryServer]
//	ex) dirsys.rootca.or.kr:389 or ""
//

/**
 * ���?�� �����ϰ� ���� ���� �����Ѵ�. ���� �ɼǿ� ��� �پ��� ���� �����<BR>
 * ������ �� �ִ�. ���� Verify_SignedData�� �Լ� ����� ���� <B>���̼���</B>�� �ʿ��ϴ�.
 *
 * @ingroup digitalSignAPI
 * @param signedData : ������ �����
 * @param option : ���� ���� �ɼ�<BR>
 * 0 : ���?�� ����(�������� ���� ������ ��)<BR>
 * 1 : 0�� ���Ͽ� ������ ����<BR>
 * 2 : 1�� ���Ͽ� ������ ü�α��� ����<BR>
 * 3 : 2�� ���Ͽ� ������ CRL üũ<BR>
 * 4 : 3�� ���Ͽ� LDAP���� ������ ����<BR>
 * @param directoryServer : CRL�� ������ ���丮 ���� �ּ�<BR>
 * Ex) dirsys.rootca.or.kr:389<BR>
 * ������ �Է��ϸ� �������� ���Ե� CRL �й��� �̿��Ͽ� CRL üũ<BR>
 *
 * @return Success : ���� ��
 * Fail : ����<BR>
 * <B>������ ���? ������ �ϴ� �����ϸ� ������ ������ ������ �߻��ϴ��� ���� ���� �����Ѵ�. ��� ��ü���� ���� �ɼǿ� �� ���� ������ �ùٸ��� �Ǿ������ Ȯ���ϱ� ���ؼ���, ���ϰ� Ȯ�ΰ� �Բ� LastErrCode ������ ���� ���θ� Ȯ���ؾ� �Ѵ�.</B>
 */
function Verify_SignedData( signedData, option, directoryServer )
{
	var	verified_msg;
	var	errCode;
	
	if( IsNetscape() )
	{
		alert("Not supported function");
		return "";
	}
	else
	{
		verified_msg = document.XecureWeb.VerifySignedData( signedData, option, directoryServer );
	}

	// VerifySignedData�� ������ ������ ���� �߻��ϴ��� �� ������ �����ϸ� ���� �����ϱ� ������
	// �ݵ�� LastErrCode�� Ȯ���ؾ� �Ѵ�.
	errCode = document.XecureWeb.LastErrCode();
	if( errCode != 0 )
		XecureWebError();
	
	return verified_msg;	
}

//
// only over XecureWeb Client v5.4.x
//
// applicable cert location : usbtoken_kb, usbtoken_kiup
//
function Set_PinNumber( pin )
{
	var	ret = -1;
	
	if( IsNetscape() )
	{
		alert("Not supported function");
	}
	else
	{
		 ret = document.XecureWeb.SetPinNum( pin );
	}

	return ret;
}

// type 10 : YessignCA
// type 11 : XecureCA
/**
 * �����ڵ�� �ΰ��ڵ带 ������ ����������� �����Ͽ� �������� �߱޹޴´�. ������ �߱� ��ġ�� �ϵ��ũ/ICī�� �̴�.
 * 
 * @ingroup CMPAPI
 * @param type CA TYPE 10: YessignCA, 11: XecureCA
 * @param ref_code �����ڵ�
 * @param auth_code �ΰ��ڵ�
 *
 * @return Success : 0<BR>
 * Fail : -1
 */
function RequestCertificate ( type, ref_code, auth_code )
{
	var r;
	var ca_type;
	var ca_ip;
	var ca_port;
	
	if(type == 10) {
		ca_type = yessign_ca_type;
		ca_ip = yessign_ca_ip;
		ca_port = yessign_ca_port;
	}
	else if(type == 11) {
		ca_type = xecure_ca_type;
		ca_ip = xecure_ca_ip;
		ca_port = xecure_ca_port;
	}
	else if(type == 12) {
		ca_type = xecure_ca_type_1;
		ca_ip = xecure_ca_ip_1;
		ca_port = xecure_ca_port_1;
	}
	else {
		alert("Input type error!");
		return 0;
	}
	
	if(IsNetscape())
	{
		if( IsNetscape60() )	// Netscape 6.0
			r = document.XecureWeb.nsIXecurePluginInstance.RequestCertificate2 ( ca_port, ca_ip, ref_code, auth_code, ca_type );
		else
			r = document.XecureWeb.RequestCertificate2 ( ca_port, ca_ip, ref_code, auth_code, ca_type );
	}
	else 
	{
		r = document.XecureWeb.RequestCertificate ( ca_port, ca_ip, ref_code, auth_code, ca_type);
	}

	if ( r != 0 )	XecureWebError();
	
	return r;
}

// type 00 : YessignCA
// type 11 : XecureCA
/**
 * �� �Լ��� �����Ű�� ������ �������� �������� �� �������� �����Ͽ� ���õ� ��ġ�� �ٽ� �����Ų��. ( �ϵ��ũ/�÷��� ��ũ/ICī��)
 *
 * @ingroup CMPAPI
 * @return Success : 0<BR>
 * Fail : -1
 */
function RenewCertificate ( type )
{
	var r;
	var ca_type;
	var ca_ip;
	var ca_port;
	
	if(type == 10) {
		ca_type = yessign_ca_type;
		ca_ip = yessign_ca_ip;
		ca_port = yessign_ca_port;
	}
	else if(type == 11) {
		ca_type = xecure_ca_type;
		ca_ip = xecure_ca_ip;
		ca_port = xecure_ca_port;
	}
	else if(type == 12) {
		ca_type = xecure_ca_type_1;
		ca_ip = xecure_ca_ip_1;
		ca_port = xecure_ca_port_1;
	}
	else {
		alert("Input type error!");
		return 0;
	}

	if(IsNetscape())
	{
		if( IsNetscape60() )	// Netscape 6.0
			r = document.XecureWeb.nsIXecurePluginInstance.RenewCertificate2( ca_port, ca_ip, ca_type, pwd_fail );
		else
			r = document.XecureWeb.RenewCertificate2( ca_port, ca_ip, ca_type, pwd_fail );
	}
	else{
		r = document.XecureWeb.RenewCertificate ( ca_port, ca_ip, ca_type, pwd_fail );
	}

	if ( r != 0 ) 	XecureWebError();
	
	return r;
}

// type 00 : YessignCA
// type 11 : XecureCA
/**
 * �� �Լ��� �����Ű�� ����� �������� �������� �� �������� ����ϰ� �����<BR>
 * ��ġ���� ������Ų��. ( �ϵ��ũ/�÷��� ��ũ/ICī��)
 *
 * @ingroup CMPAPI
 * @param type  00 : YessignCA, 11 : XecureCA
 * @param jobcode <BR>
 * ������ ��� : 17<BR>
 * ������ ȿ������ : 256
 * @param reason (���/ȿ������ ���� )<BR>
 * 1 : keyCompromise ( default )<BR>
 * 2 : cACompromise<BR>
 * 3 : affiliationChanged<BR>
 * 4 : superseded<BR>
 * 5 : cessationOfOperation<BR>
 * 6 : certificateHold
 *
 * @return Success : 0<BR>
 * Fail : -1
 */
function RevokeCertificate ( type, jobcode, reason )
{
	var r;
	var ca_type;
	var ca_ip;
	var ca_port;
	
	if(type == 10) {
		ca_type = yessign_ca_type;
		ca_ip = yessign_ca_ip;
		ca_port = yessign_ca_port;
	}
	else if(type == 11) {
		ca_type = xecure_ca_type;
		ca_ip = xecure_ca_ip;
		ca_port = xecure_ca_port;
	}
	else if(type == 12) {
		ca_type = xecure_ca_type_1;
		ca_ip = xecure_ca_ip_1;
		ca_port = xecure_ca_port_1;
	}
	else {
		alert("Input type error!");
		return 0;
	}
	
	if(IsNetscape())
	{
		if( IsNetscape60() )	// Netscape 6.0
			r = document.XecureWeb.nsIXecurePluginInstance.RevokeCertificate2( ca_port, ca_ip, jobcode, reason, ca_type, pwd_fail );
		else
			r = document.XecureWeb.RevokeCertificate2( ca_port, ca_ip, jobcode, reason, ca_type,  pwd_fail);
	}
	else {
		r = document.XecureWeb.RevokeCertificate ( ca_port, ca_ip, jobcode, reason, ca_type, pwd_fail );
	}

        if ( r != 0 ) 	XecureWebError();

	return r;
}

/**
 * RSA 1024 bit ��Ű/����Ű���� ������, ����Ű ������ Client ���� �����ϰ�<BR>
 * ��Ű ������ �����Ѵ�. (�缳 ������ �߱�/���Ž� �̿�Ǹ�, ������ �߱޽ÿ�<BR>
 * �Էµ� �ʿ��� ������� �� �Լ����� ���ϵ� ��Ű�� ������ �缳�������<BR>
 * �����Ͽ� �������� �߱�/���� �Ѵ�. )
 *
 * @ingroup SFCA_CMPAPI
 * @return Success : ��� ��Ű ���ڿ�<BR>
 * Fail : ����
 *
 */
function GenCertReq ( )
{
	if( IsNetscape60() )		// Netscape 6.0
		cert_req = document.XecureWeb.nsIXecurePluginInstance.GenerateCertReq( 1024 );
	else
		cert_req = document.XecureWeb.GenerateCertReq( 1024 );

	if ( cert_req == "" )	XecureWebError() ;
	
	return cert_req;
}

/**
 * �߱�/���ŵ� �缳 �������� �����Ų��. (���� ���ɸ�ü : �ϵ��ũ/ICī��)
 *
 * @ingroup SFCA_CMPAPI
 * @param cert_type �߱޵� ������ ����<BR>
 * 1 : ������� ������<BR>
 * 2 : ����� ������<BR>
 * 5 : ��ȣȭ�Ͽ� ������ ����� ������<BR/.
 * @param cert : �߱޵� ������ 
 */
function InstallCertificate (cert_type, cert)
{
	if( IsNetscape60() )		// Netscape 6.0
		document.XecureWeb.nsIXecurePluginInstance.InstallCertificate(cert_type, cert );
	else
		document.XecureWeb.InstallCertificate(cert_type, cert );
}

/**
 * ClientSM�� ������ ���� �޴��� �� �󿡼� ���� ȣ���Ͽ� ����� �� �ִ�.
 * @ingroup etcAPI
 */
function ShowCertManager()
{
	if( IsNetscape60() )		// Netscape 6.0
		document.XecureWeb.nsIXecurePluginInstance.ShowCertManager();
	else
		document.XecureWeb.ShowCertManager();
}

function DeleteCertificate( dn )
{       
	var r; 
	
	if( IsNetscape60() )		// Netscape 6.0
		r = document.XecureWeb.nsIXecurePluginInstance.DeleteCertificate( XecureEscape(dn) );
	else
		r = document.XecureWeb.DeleteCertificate ( XecureEscape(dn) );

	if( r != 0 )	XecureWebError() ;
	else 		alert('�������� �����Ͽ����ϴ�.');
}

/**
 * [ ClinetSM : 2.3.3 / AcitveX 4.1.2.3 ���� Version�� ]<BR>
 * ����â�̳� ������Loginâ�� �̹����� �����Ѵ�. �̹��� BMP ������ �����Ѵ�. (���⼭�� login.bmp(�ػ�:290x64) �� ����)<BR>
 * XecureWeb ver4 server module�� ��ġ�Ǿ� �ִ� ���丮�� <BR>
 * /user/xecureweb_ver4�� �����ϸ�<BR>
 * /user/xecureweb_ver4/object/ �Ʒ��� login.bmp�� �����Ѵ�.<BR>
 * /user/xecureweb_ver4/object/xecureweb.js ������ ���� bannerUrl�� �����Ѵ�.<BR>
 * ��) var bannerUrl=<BR>
 * ��http://�� + window.location.hostname + ��/XecureObject/login.bmp��;<BR>
 * BMP�����..�ٸ��̸����� �����Ͽ��� �ٽ� DownLoad���� �� �ִ�.
 * @ingroup etcAPI
 */
function PutBannerUrl()
{
	if( IsNetscape60() )		// Netscape 6.0
	{
		document.XecureWeb.nsIXecurePluginInstance.PutBigBannerUrl( xgate_addr, bannerUrl);
	}
	else
	{
		document.XecureWeb.PutBigBannerUrl( xgate_addr, bannerUrl);
	}
}

/**
 * �缳 ��������� ���� �缳������� �������� ����ڿ��� �����Ѵ�.<BR>
 *
 * @ingroup etcAPI
 * @return Success : 0<BR>
 * Fail : -1
 */
function PutCACert()
{
	var r ;
	
	if( IsNetscape60() )		// Netscape 6.0
		r = document.XecureWeb.nsIXecurePluginInstance.PutCACert( XecureEscape(pCaCertName), pCaCertUrl);
	else
		r = document.XecureWeb.PutCACert( XecureEscape(pCaCertName), pCaCertUrl);

	if( r != 0 )	XecureWebError() ;
}

function isNewPlugin(desc)
{
	index = desc.indexOf('v.', 0);
	if (index < 0)
		return false;
	desc += ' ';

	versionString = desc.substring(index +2, desc.length);
	arrayOfStrings = versionString.split('.');
	thisMajor = parseInt(arrayOfStrings[0], 10);
	thisMinor = parseInt(arrayOfStrings[1], 10);
	thisBuild = parseInt(arrayOfStrings[2], 10);
	
	if (thisMajor > versionMaj)	return true;
	if (thisMajor < versionMaj)	return false;
	
	if (thisMinor > versionMin)	return true;
	if (thisMinor < versionMin)	return false;
	
	if (thisBuild > versionRel)	return true;
	if (thisBuild < versionRel)	return false;

	return true;
}

function downloadNow () {
	if ( navigator.javaEnabled() ) {
		trigger = netscape.softupdate.Trigger;
		if ( trigger.UpdateEnabled() ) {
			if (navigator.platform == "Win32") {
				trigger.StartSoftwareUpdate( packageURL, trigger.DEFAULT_MODE);
			}
			else alert('�� �÷��� ���� �������� 95/98/NT ȯ�濡���� �۵��մϴ�.')
		}
		else
			alert('�ݽ������� SmartUpdate ��ġ�� �����ϵ��� �ؾ��մϴ�.');
	}
	else
		alert('Java ������ �����ϵ��� �ؾ��մϴ�.');
}

function isOldPlugin(desc,version)	// by Zhang
{
	index = desc.indexOf('v.', 0);
	if (index < 0)	return true;
	
	desc += ' ';
	versionString = desc.substring(index +2, desc.length);
	arrayOfStrings = versionString.split('.');
	thisMaj = parseInt(arrayOfStrings[0], 10);
	thisMin = parseInt(arrayOfStrings[1], 10);
	thisRel = parseInt(arrayOfStrings[2], 10);
	
	arrayOfStrings = version.split('.');
//	verMaj = parseInt(arrayOfStrings[0], 10);
//	verMin = parseInt(arrayOfStrings[1], 10);
//	verRel = parseInt(arrayOfStrings[2], 10);
	s_verMaj = parseInt(arrayOfStrings[0], 10);
	s_verMin = parseInt(arrayOfStrings[1], 10);
	s_verRel = parseInt(arrayOfStrings[2], 10);
	
	if (thisMaj > s_verMaj)	return false;
	if (thisMaj < s_verMaj)	return true;
	
	if (thisMin > s_verMin)	return false;
	if (thisMin < s_verMin)	return true;
	
	if (thisRel > s_verRel)	return false;
	if (thisRel < s_verRel)	return true;

	return false;
}

function DownloadPackage(packageURL) // by Zhang
{
	if ( navigator.javaEnabled() ) {
		trigger = netscape.softupdate.Trigger;
		if ( trigger.UpdateEnabled() ) {
			if (navigator.platform == "Win32") {
				trigger.StartSoftwareUpdate( packageURL, trigger.DEFAULT_MODE);
			}
			else
				alert('�� �÷��� ���� �������� 95/98/NT ȯ�濡���� �۵��մϴ�.');
		}
		else
			alert('�ݽ������� SmartUpdate ��ġ�� �����ϵ��� �ؾ��մϴ�.');
	}
	else
		alert('Java ������ �����ϵ��� �ؾ��մϴ�.');
}

function XecureWebPlugin(version)	// by Zhang
{	
	//if (navigator.appName == 'Netscape' && UserAgent() == "Mozilla/4") 
	if ((navigator.appName == 'Netscape' && UserAgent() == "Mozilla/4") && navigator.userAgent.indexOf("Trident") == -1)  //ie11대응 
	{
  		var XecureMime = navigator.mimeTypes["application/x-SoftForum-XecSSL40"];
		if (XecureMime) {   // Xecure PlugIn �� �̹� ��ġ�Ǿ� �ִ� ���
			if ( isOldPlugin(XecureMime.enabledPlugin.description,version))
				DownloadPackage(packageURL);
		}
		else {     // Xecure PlugIn �� ��ġ�Ǿ� ���� ���� ���
			DownloadPackage(packageURL);
		}
	}
}

/**
 * Netscape�� ����&lt;EMBED&gt; Tag��, Internet Explorer�� ���� &lt;OBJECT&gt; Tag�� document.write�Ѵ�.<BR>
 * <BR>
 * example><BR>
 * &lt;html><BR>
 * &lt;head><BR>
 * &lt;form name='xecure' >&lt;input type=hidden name='p'>&lt;/form><BR>
 * &lt;script language='javascript' src='/XecureObject/xecureweb.js'>&lt;/script><BR>
 * &lt;script language='javascript' src='/XecureObject/xecureweb_file.js'>&lt;/script><BR>
 * &lt;script><BR>
 * PrintObjectTag();<BR>
 * PrintFileObjectTag();<BR>
 * &lt;/script><BR>
 * &lt;/head><BR>
 * &lt;body> &lt;/body>&lt;/html>
 * @ingroup etcAPI
 */
function PrintObjectTag()
{	
	if( IsNetscape60() )	
		alert("Netscape 6.0�� �������� �ʽ��ϴ�") ;
	else
	{	
		//if(navigator.appName == 'Netscape')
		if(navigator.appName == 'Netscape' && navigator.userAgent.indexOf("Trident") == -1) //ie11대응
		{
			document.write("<EMBED type='application/x-SoftForum-XecSSL40' hidden=true name='XecureWeb'></EMBED><NOEMBED>No XecureWeb PlugIn</NOEMBED>");
		}
		else
		{
			// param ����( name : value )
			//
			// [��� ����]
			//    lang : KOREAN / ENGLISH
			//    ex) <PARAM NAME="LANG" VALUE="KOREAN">
			//
			// [���� �ɼ�] only over XecureWeb Client v5.3.0.1
			//    "���� �ɼ�"�� ����� �ݵ�� �������� ���� �ڼ��� ������ Ȯ���� �� ����Ͻñ� �ٶ�ϴ�.
			//    sec_option :
			//	- xgate �ּҷ� ���� ����(����Ʈ�� host name���� ���� ����)		: 0x00000080 = 128
			//	- ������ ��ȣ ����(ICī���� ��� �ɹ�ȣ�� ����)
			//        USBTOKE_KB�� ���, SetPinNum���� �ɹ�ȣ�� preset�ؾ� ��	        : 0x00000040 =  64
			//	- ����� ������ ����â���� ĳ�õ� ������ ���(only for IC card, USBTOKEN_KB)
			//        USBTOKE_KB�� ���� ĳ������ �ʰ� �ڵ����� �ٽ� �о����              : 0x00000020 =  32
			//	- �α��ν� ������ ����â���� ĳ�õ� ������ ���(only for IC card)	: 0x00000010 =  16
			//    sec_context : ���?
			//    sec_desc : ������ ���ڿ�(storage�� iccard�� ������ ��� icī�� �ɹ�ȣ �Է�â�� ��Ÿ���� �ȳ�����. �������� ������ default ������ ��Ÿ��)
			//
			// [������ �����ü ����] only over XecureWeb Client v5.3.0.1
			//    storage : "HARD" / "REMOVABLE" / "ICCARD" / "CSP" / "VSC" / "USBTOKEN","USBTOKEN_KB","USBTOKEN_KIUP"
			//    ex1) <PARAM NAME="STORAGE" VALUE="HARD">
			//    ex2) <PARAM NAME="STORAGE" VALUE="HARD,REMOVABLE,ICCARD"> ==> ���� ���� �����ü�� ������ ������ ù��° �����ü�� �켱 ���õǾ���
			//
			// [Ű��Ʈ��ũ ��ŷ���� �ɼ�] only over XecureWeb Client v5.3.0.1
			//    seckey : KeyStroke ��ŷ������ ��� ����, �ش��ϴ� vendor�� ���� string value �Է�
			//             ����[2003/10/30] ������ string value
			//             - "XW_SKS_SOFTCAMP_KEYPAD" : ����Ʈķ���� Ű�е� ����
			//             - "XW_SKS_SOFTCAMP_DRIVER" : ����Ʈķ���� ����̹� ����
			//             - "XW_SKS_KINGS_DRIVER"    : ŷ����������� ����̹� ����
			//             - "_WITH_SKS_ENCRYPT"      : �� �������� �н����� Ÿ�Կ� ���ؼ� ��ȣȭ => BlockEnc ȣ��� ���ο��� �ٽ� ��ȣȭ��(xwcs_client.dll ���)
			//    ex) <PARAM NAME="SECKEY" VALUE="XW_SKS_SOFTCAMP_KEYPAD"> ==> ����Ʈķ���� Ű�е� ���� ���
			//    ex) <PARAM NAME="SECKEY" VALUE="XW_SKS_KINGS_DRIVER_WITH_SKS_ENCRYPT"> ==> ŷ����������� ����̹� ���� ��� + �н����� Ÿ�� ��ȣȭ
			//    ex) <PARAM NAME="SECKEY" VALUE="_WITH_SKS_ENCRYPT"> ==> �н����� Ÿ�� ��ȣȭ�� ����
			//
			// [���̼���] only over XecureWeb Client v5.4.x
			//    XecureWeb Client�� Ư�� ��ɿ� ���ؼ� ����Ʈ ���̼����� ������ ������ ��� ����
			//    ���� ���̼����� ���� ���
			//      - ���� ����(VerifySignedData)
			//    ex) <PARAM NAME="LICENSE" VALUE="���������� �����ϴ� ���?">
			
			//document.write('<OBJECT ID="XecureWeb" CLASSID="CLSID:7E9FDB80-5316-11D4-B02C-00C04F0CD404" CODEBASE="http://phobos.softforum.co.kr:8188/XecureObject/xw_install.cab#Version=5,4,1,0" width=0 height=0>No XecureWeb PlugIn</OBJECT>');
			
			// test
			//document.write('<OBJECT ID="XecureWeb" CLASSID="CLSID:7E9FDB80-5316-11D4-B02C-00C04F0CD404" CODEBASE="http://phobos.softforum.co.kr:8188/XecureObject/xw_install.cab#Version=5,4,1,0" width=0 height=0>');
			//document.write('<param name="storage" value="usbtoken_kb,hard,removable,csp,vsc"><param name="sec_option" value=96><param name="sec_context" value="30820649020101310b300906052b0e03021a0500302506092a864886f70d010701a018041670686f626f732e736f6674666f72756d2e636f2e6b72a0820467308204633082034ba003020102020103300d06092a864886f70d01010505003077310b3009060355040613024b52311e301c060355040a1315536f6674666f72756d20436f72706f726174696f6e3121301f06035504031318536f6674666f72756d20526f6f7420417574686f726974793125302306092a864886f70d010901161663616d617374657240736f6674666f72756d2e636f6d301e170d3033303132313030303030305a170d3333303131333030303030305a308192310b3009060355040613024b52311e301c060355040a1315536f6674666f72756d20436f72706f726174696f6e311e301c060355040b1315536563757269747920522644204469766973696f6e311c301a06035504031313536f6674666f72756d205075626c69632043413125302306092a864886f70d010901161663616d617374657240736f6674666f72756d2e636f6d30820121300d06092a864886f70d01010105000382010e00308201090282010041a27ed4a985ee6b9a1e8823537a34a4da4cdad762478acfe7d8727ba227f7606a108eacbb991675865e374d7a700e537a1662bb9dcd27b89f99e0c91ac963390a11a0f6d945b97bde543a9f05ffe8bfeeb2cdfbbd939f1242d4ed645daa0e8be02813d5360eb3784b4859928df7d397d55febbaf00a83de11e047121cffc72c2bccd28b3cf8dd74f5dbb22b1b16b9c710f74a9b0243fc7c67000f8c1e343ac094e7b3a459ed7b9fb679019f4ef6ab425644ca895e63c0e67b9ada35034004f9eabf41d30bdcd62a6b3dc115e4c226b810b12e51c2b82414830b1995adc7aa94c3f37434aaa260ce4117f4e9d23f9ed9caa9e6b856815984009958e6271731490203010001a381de3081db301f0603551d2304183016801409b5e27e7d2ac24a8f56bb67accebb93f5318fd3301d0603551d0e0416041418053cf13370b5ae2123a28f9e68f75731330788300e0603551d0f0101ff04040302010630120603551d130101ff040830060101ff02010030750603551d1f046e306c306aa068a06686646c6461703a2f2f6c6461702e736f6674666f72756d2e636f6d3a3338392f434e3d58656375726543524c535256432c4f553d536563757269747920522644204469766973696f6e2c4f3d536f6674666f72756d20436f72706f726174696f6e2c433d4b52300d06092a864886f70d01010505000382010100329b1c2e5bf79586af02652e689f5451332746a7d4d290ff39c061612c93e8225837ee83eff242b50c27466961f4440f9900b202edbbcc1ebde1b63f31e76f6fe671c3afdf9ce8e513ec1e74ffd1b64658cdc3aa5db763b58dd1a9ca9671d50ea84c04fd491696a7dbf545d9058fef506da13ed4cbc292198a493d1a6225ec88cda9a94e79edc655655b223c5ec32ffacee0a8eaa3c87f2848e5085a32249426e66ee83611d1d3357113fc0a68e73f1d797430398d70a9a89b5ee124e3a7e1568582a74bc0b675988ffda2e34437cc0e303b98858c08fec39ad512c3a70f549716e82d6f4a79327cc71a1c20c03365af8b2898afb34b3b287e44b59731708d29318201a33082019f020101307c3077310b3009060355040613024b52311e301c060355040a1315536f6674666f72756d20436f72706f726174696f6e3121301f06035504031318536f6674666f72756d20526f6f7420417574686f726974793125302306092a864886f70d010901161663616d617374657240736f6674666f72756d2e636f6d020103300906052b0e03021a0500300d06092a864886f70d0101010500048201002913691bf3328c68353c827147ed29ebb80e17843131f0ebfdab00e355c52636fb8f13cf98cda2f5623f7449e1206d7f61be5d9f2fbd1cda7bf3d86b2c7ac29091a208177bc722a023d21ba3831264a715bae402aee27b0f401bc25ca72430fcc793a904709b449274cc071f1635a951aa99637c0564ca71ea5a8f10b5c07cfa5032e848e62411dda1bae95ba2ce759b2535b95a35109db6308098e85a8394b7ff180fe237e90cfaf6c6ba7d991edf878ebc7adbe68ea9322371141ddc1ba7560fdcf3ec59ffce70bcbf1029faa5dad1581c9a47d3f347c250c9d01d256243635dae1254d03a27e5bec661672f5a87ba2973c8ddf4ca20d653f7d25dec17e9b8">No XecureWeb PlugIn</OBJECT>');
			
			document.write('<OBJECT ID="XecureWeb" CLASSID="CLSID:7E9FDB80-5316-11D4-B02C-00C04F0CD404" CODEBASE="http://download.softforum.co.kr/Published/XecureWeb/v7.2.6.6/xw_install.cab#Version=7,2,6,6" width=0 height=0><param name="lang" value="korean"><param name="lang" value="korean"><param name="LICENSE" value="3082065c020101310b300906052b0e03021a0500303806092a864886f70d010701a02b0429313a70686f626f732e736f6674666f72756d2e636f2e6b723a5665726966795369676e656444617461a0820467308204633082034ba003020102020103300d06092a864886f70d01010505003077310b3009060355040613024b52311e301c060355040a1315536f6674666f72756d20436f72706f726174696f6e3121301f06035504031318536f6674666f72756d20526f6f7420417574686f726974793125302306092a864886f70d010901161663616d617374657240736f6674666f72756d2e636f6d301e170d3033303132313030303030305a170d3333303131333030303030305a308192310b3009060355040613024b52311e301c060355040a1315536f6674666f72756d20436f72706f726174696f6e311e301c060355040b1315536563757269747920522644204469766973696f6e311c301a06035504031313536f6674666f72756d205075626c69632043413125302306092a864886f70d010901161663616d617374657240736f6674666f72756d2e636f6d30820121300d06092a864886f70d01010105000382010e00308201090282010041a27ed4a985ee6b9a1e8823537a34a4da4cdad762478acfe7d8727ba227f7606a108eacbb991675865e374d7a700e537a1662bb9dcd27b89f99e0c91ac963390a11a0f6d945b97bde543a9f05ffe8bfeeb2cdfbbd939f1242d4ed645daa0e8be02813d5360eb3784b4859928df7d397d55febbaf00a83de11e047121cffc72c2bccd28b3cf8dd74f5dbb22b1b16b9c710f74a9b0243fc7c67000f8c1e343ac094e7b3a459ed7b9fb679019f4ef6ab425644ca895e63c0e67b9ada35034004f9eabf41d30bdcd62a6b3dc115e4c226b810b12e51c2b82414830b1995adc7aa94c3f37434aaa260ce4117f4e9d23f9ed9caa9e6b856815984009958e6271731490203010001a381de3081db301f0603551d2304183016801409b5e27e7d2ac24a8f56bb67accebb93f5318fd3301d0603551d0e0416041418053cf13370b5ae2123a28f9e68f75731330788300e0603551d0f0101ff04040302010630120603551d130101ff040830060101ff02010030750603551d1f046e306c306aa068a06686646c6461703a2f2f6c6461702e736f6674666f72756d2e636f6d3a3338392f434e3d58656375726543524c535256432c4f553d536563757269747920522644204469766973696f6e2c4f3d536f6674666f72756d20436f72706f726174696f6e2c433d4b52300d06092a864886f70d01010505000382010100329b1c2e5bf79586af02652e689f5451332746a7d4d290ff39c061612c93e8225837ee83eff242b50c27466961f4440f9900b202edbbcc1ebde1b63f31e76f6fe671c3afdf9ce8e513ec1e74ffd1b64658cdc3aa5db763b58dd1a9ca9671d50ea84c04fd491696a7dbf545d9058fef506da13ed4cbc292198a493d1a6225ec88cda9a94e79edc655655b223c5ec32ffacee0a8eaa3c87f2848e5085a32249426e66ee83611d1d3357113fc0a68e73f1d797430398d70a9a89b5ee124e3a7e1568582a74bc0b675988ffda2e34437cc0e303b98858c08fec39ad512c3a70f549716e82d6f4a79327cc71a1c20c03365af8b2898afb34b3b287e44b59731708d29318201a33082019f020101307c3077310b3009060355040613024b52311e301c060355040a1315536f6674666f72756d20436f72706f726174696f6e3121301f06035504031318536f6674666f72756d20526f6f7420417574686f726974793125302306092a864886f70d010901161663616d617374657240736f6674666f72756d2e636f6d020103300906052b0e03021a0500300d06092a864886f70d01010105000482010009fb7f805e9c8b7d6a35f6519d3a4a5f5cf2b394e622003b43cdf4f5a80d9b032586f8b18b267a2188e1146a8bdca1d0461cd548c1378dacfbce16a228fe14d35537c86abe3a42fa4e70ebd74774d17ba792aca313f49456d09dd72dadb67767c4a452100b32d5f1595d055aa3f38d992473a3896129f79b99208294170a7aedc553720fc55b80668f3b76f43dfa0ba914697fc9691e271c9be102822cd9968919de6a62b921112e7ee2fba9b7e7a48a1378a7fa61b14d5738ab066f6b816642b37117aec32e18010ad8feae452c5f5a70a10d67973647d24f68169e80a8dc971823235ae51d77186ae98fee1e28455dc930cf2aa51f6d12eb02e452e00957c3">No XecureWeb PlugIn</OBJECT>');
		}
	}
}

function get_sid() 
{
	var sid = document.XecureWeb.BlockEnc ( xgate_addr, "", "", "GET" );
        
	if( sid == "") 	return XecureWebError() ;
        
	return sid;
}

// applet���� servlet���� ���� ���� ��ȣȭ �ϴ� function
function enc(str) {
	var state='';
	var plain='';
	var escaped_state='';
	plain=String(str);

	//if (navigator.appName == 'Netscape')
	if (navigator.appName == 'Netscape' && navigator.userAgent.indexOf("Trident") == -1) //ie11대응
		state=XecureWeb.BlockEnc(xgate_addr, path, escape(plain), "POST");
	else
   		state=XecureWeb.BlockEnc(xgate_addr, path, plain, "POST");
   	//escaped_state=escape_url(state);
   	escaped_state=escape_url_applet(state);
//   	alert("POST:" + escaped_state);
	return escaped_state;
}

// servlet���� applet���� ������ ���� ��ȣȭ �ϴ� function
function dec(str) {
	var result=BlockDec(str);
	return result;
}

function XecureNavigate2iframe( url, target, feature, sid) 
{
	var qs ;
	var path = "/";
	var cipher;
	var xecure_url;

	path = getPath(url);
	
	cipher = document.XecureWeb.BlockEnc(xgate_addr, path, XecureEscape(qs),"POST");
		
	if( cipher.length == 0 ) 	return XecureWebError() ;
	
	xecure_url = path + "?q=" + sid + ";" + escape_url(cipher);
	if (feature=="" || feature==null) open ( xecure_url, target );
	else open(xecure_url, target, feature );
}

function getPath(url)
{
	var path = "/";
	// get path info & query string & hash from url
	qs_begin_index = url.indexOf('?');
	// if action is relative url, get base url from window location
	if ( url.charAt(0) != '/' && url.substring(0,7) != "http://" ) {
		path_end = window.location.href.indexOf('?');
		if(path_end < 0)	path_end_str = window.location.href;
		else				path_end_str = window.location.href.substring(0,path_end); 
		path_relative_base_end = path_end_str.lastIndexOf('/');
		path_relative_base_str = path_end_str.substring(0,path_relative_base_end+1);
		path_begin_index = path_relative_base_str.substring (7,path_relative_base_str.length).indexOf('/');
		if (qs_begin_index < 0){
			path = path_relative_base_str.substring( 7+path_begin_index,path_relative_base_str.length ) + url;
		}
		else {
			path = path_relative_base_str.substring( 7+path_begin_index,path_relative_base_str.length )
				 + url.substring(0, qs_begin_index );
		}
	}
	else if ( url.substring(0,7) == "http://" ) {
		path_begin_index = url.substring (7, url.length).indexOf('/');
		if (qs_begin_index < 0){
			path = url.substring( path_begin_index + 7, url.length);
		}
		else {
			path = url.substring(path_begin_index + 7, qs_begin_index );
		}
	}
	else if (qs_begin_index < 0){
		path = url;
	}
	else {
		path = url.substring(0, qs_begin_index );
	}
	return path;
}

// option bit : _4_ _3_ _2_ _1_
//                       |   |
//                       |   --- 0 : ��� ������ ����Ʈ��, 1 : �α����� ������ ���
//                       ------- 0 : ����ڿ��� idn �Է� �䱸, 1 : idn�� "NULL" setting, �������� idn ����

/**
 * �������� �ĺ���ȣ�� �����Ѵ�.<BR/>
 *
 * @ingroup etcAPI
 * @param Idn <PRE>������ �������� �ĺ���ȣ<BR>
 * Idn�� �����̸� ����ڷκ��� IDN�� �Է¹޴´�.<BR>
 * option bit : _4_ _3_ _2_ _1_<BR>
 *                       |   |<BR>
 *                       |   --- 0 : ��� ������ ����Ʈ��, 1 : �α����� ������ ���<BR>
 *                          ------- 0 : ����ڿ��� idn �Է� �䱸, 1 : idn�� "NULL" setting, �������� idn ����</PRE>
 * @param TimeStamp ������ Ÿ�ӽ���
 * @param ServerCertPem pemŸ���� ����������
 *
 * @return �����ϸ� VID������ envelop�� ��� ����
 * ���н� ���� ����
 */
function VerifyVirtualID(Idn, TimeStamp, ServerCertPem)
{
	var msg;
	
	var option = 0;
	
	option = 0;   // ��� ������ ����Ʈ��, ����ڿ��� idn �Է� �䱸
//	option = 1;   // �α����� ������ ���, ����ڿ��� idn �Է� �䱸
// only over XecureWeb Client v5.3.0.1
//	option = 2;   // ��� ������ ����Ʈ��, idn�� "NULL" ����
//	option = 3;   // �α����� ������ ���, idn�� "NULL" ����
	
	if( IsNetscape() )
	{
		msg = document.XecureWeb.VerifyAndGetVID(xgate_addr, ServerCertPem, TimeStamp, escape(accept_cert), option, escape(Idn));
	}
	else 
	{
		msg = document.XecureWeb.VerifyAndGetVID(xgate_addr, ServerCertPem, TimeStamp, accept_cert, option, Idn);
	}
	
	return msg;

}

// nOption is 0 : (default value) File version, which is checked by 'Internet Explorer'
//            1 : Product version
//            2 : File Description
/**
 * XecureWeb Control �� ��õ� ���� ������ �����Ѵ�.
 *
 * @ingroup etcAPI
 * @param nOption <BR>
 * 0 : (default value) File version, which is checked by 'Internet Explorer'<BR>
 * 1 : Product version<BR>
 * 2 : File Description
 *
 * @return nOption �� �� ���� ����<BR>
 * �׳� GetVersion()�� ȣ���ϸ� Object tag���� �����ϴ� ������ ���� �� �ִ�.<BR>
 * ���ϰ��� ��7, 0, 5, 0�� �� ���� ����̴�.
 *
 */
function GetVersion(nOption)
{
	var ver;
	
	if( IsNetscape() )
	{
		alert("Not supported function");
		ver = "";
	}
	else
	{
		ver = document.XecureWeb.GetVerInfo(nOption);
		if( ver == "" )
			alert("No version information");
	}
	
	return ver;
}

// only over XecureWeb Client v5.3.0.1
/**
 * infoURL�κ��� ������ ����� ������Ʈ ���������� �̿��Ͽ� �ʿ��� ������ �ٿ�ε��Ͽ� ��ġ�Ѵ�.<BR>
 *
 * @ingroup etcAPI
 * @param infoURL : ������Ʈ ���������� �ִ� URL<BR>
 * Ex) infoURL = ��http://download.softforum.co.kr/ XecureWeb/Update/info.ini.sig��
 *
 * @return 0 : ����, 1 : ����� ���, 2 : ������Ʈ�� ������ �ٸ� ���ø����̼ǿ��� �����, 3 : �̹� ������Ʈ�Ǿ���, 4 : ������Ʈ ������ ��� �����, 5 : �ֽ� ������, -1 : ����
 */
function UpdateModules( infoURL )
{
	var	ret;
	
	if( IsNetscape() )
	{
		alert("Not supported function");
		ret = 0;
	}
	else
	{
		// success : 0, cancel : 1, file(s) holded : 2, already updated : 3, invalid user : 4, need not : 5
		// error : -1
		ret = document.XecureWeb.UpdateModules( infoURL );
	}
		
	return	ret;
}

// only over XecureWeb Client v5.3.0.1
/**
 * ����� PC�� ����� ������Ʈ ���������� ������ �����Ѵ�.<BR>
 * <BR>
 * example><BR>
 * SetUpdateInfo( ��PERIOD��, ��Apply��, ��0�� );<BR>
 * => �Ϸ�� �����Ǿ� �ִ� ������Ʈ �ֱ⸦ �Ͻ������� ��ȿȭ��Ŵ<BR>
 *
 * @ingroup etcAPI
 * @param section �ٿ�ε�� ������Ʈ ���������� section name
 * @param key section������ key name
 * @param value1 ������ ���� value
 *
 * @return 0 : ����, -1 : ����
 */
function SetUpdateInfo( section, key, value1 )
{
	var	ret;
	
	if( IsNetscape() )
	{
		alert( "Not supported function" );
		ret = 0;
	}
	else
	{
		ret = document.XecureWeb.SetUpdateInfoString( section, key, value1 );
	}
	
	return ret;			
}

// inserted by knlee 2003/06/10
function SetProviderList()
{
	var	ret;
	
	//var	provName = "TrustedNet Connect 2 Smart Card CSP;Microsoft Base Cryptographic Provider v1.0;Microsoft Enhanced Cryptographic Provider v1.0";
	var	provName = "TrustedNet Connect 2 Smart Card CSP;Keycorp CSP";
	
	if( IsNetscape() )
	{
		alert("Not supported function");
		return -1;
	}
	else
	{
		ret = document.XecureWeb.SetProvider(provName);
		if( ret != 0 )
			alert("Set Provider name is Fail!");
	}
	
	return ret;
}

// applet���� servlet���� ���� ���� ��ȣȭ �ϴ� function
function enc(str) {
	var state='';
	var plain='';
	var escaped_state='';
//	plain=String(str);

	alert("enc : " + str.length);
	if (navigator.appName == 'Netscape')
		state=XecureWeb.BlockEnc(xgate_addr, "/off", escape(str), "POST");
	else
   		state=XecureWeb.BlockEnc(xgate_addr, "/off", str, "POST");
   	//escaped_state=escape_url(state);
//   	escaped_state=escape_url_applet(state);
   	alert("POST:" + state.length);
	alert("enc end");
	return state;
}

// servlet���� applet���� ������ ���� ��ȣȭ �ϴ� function
function dec(str) {
	var result=BlockDec(str);
	return result;
}

function quick_escape(str)
{
	var len, leftlen, cut, i, j, pos, k;
	var out = "", out1 = "", out2 = "";

	len = str.length;
	if(len > 160) {
		leftlen = len/2;
		cut = Math.round(leftlen);
		out1 = quick_escape(str.substring(0, cut));
		out2 = quick_escape(str.substring(cut));
		out = out1 + out2;
	}else {
		pos = 0;
		j = -2;
		k = -2;
		while (pos > -1 && pos < len) 
		{
			if(j == -2)
				j = str.indexOf('+', pos);
			if(k == -2)		
				k = str.indexOf('=', pos);
			if(j < 0 && k < 0) {
				out += str.substring(pos);
				break;
			}
			if ((j < k && j > -1) || (j > -1 && k < 0))
			{
				out += str.substring(pos, j);
				out += '%2B';
				pos = j + 1;
				j = -2;
			}
			else if ((j > k && k > -1) || (k > -1 && j < 0))
			{
				out += str.substring(pos, k);
				out += '%3D';
				pos = k + 1;
				k = -2;
			}
			else{
				out += str.substring(pos);
				pos = -1;
			}
		}
	}
	return out;
}
function escape_url_applet(in_str)
{
	var len, leftlen, cut;
	var out = "", out1 = "", out2 = "";
	
	len = in_str.length;
	
	if(len > 160) {
		leftlen = len/2;
		cut = Math.round(leftlen);
		out1 = quick_escape(in_str.substring(0, cut));
		out2 = quick_escape(in_str.substring(cut));
		out = out1 + out2;
	}else {
		out = quick_escape(in_str);
	}
	alert("escape_url_applet end : " + out.length);
	return out;
} 

/*
	*** valid for only XWebFilCom v5.5.x ***
	
	It is possible to combine following option flags
	[EXCEPTION]
	   - 1,2 cannot be used simultaneously
	   - 4 is valid for only 1
	
	envOption  =   1 : ��������� ���ں���
	           =   2 : �н������� ���ں���
	           =   4 : ���� ���� �������� ���ں���
	           =   8 : CMS Ÿ������ Envelop
	           = 256 : �α����� �������� ���ں���
	           
	return value
	   - success : enveloped message
	   - fail    : ""
*/
function EnvelopData( inMsg, pwd, certPem, envOption )
{
	var envMsg;

		
	envMsg = document.XecureWeb.EnvelopData(
			xgate_addr, 
			XecureEscape(accept_cert), 
			XecureEscape(inMsg), 
			envOption, 
			pwd, 
			certPem, 
			"", 
			0, 
			"", 
			3 );

   	if( envMsg == "" )
   	{
		XecureWebError();
   	}

	return envMsg;
}

// added Park, sohyun
// MultiSignData �߰�
//Multi_Sign�� �ϱ����� ó���� ����.
//���� �ʱ�ȭ, Sign Id ����.
var s_sign_desc = "MultiSign";
var s_bannerPath = "CHB_EFMS";
var cert_serial = "0376b015";

/*
 * Multi_Sign�� �ϱ����� ó���� ����<BR/>
 */
function Multi_Sign_Init()
{
    var multiSignId;

    multiSignId = document.XecureWeb.MultiSignInit();  //MultiSignInit()ȣ��

    if( multiSignId < 0 )
    {
        XecureSignError();
    }
    else
    {
    }
    return multiSignId;
}

/*
 * Multi_Sign �����͸� �����Ѵ�.
 */
function Set_Multi_Sign_Data(multiSignId, plain)
{
    var     originalDataTotalSize = 0;

    if(multiSignId != "")
    {
        originalDataTotalSize = document.XecureWeb.SetMultiSignData(multiSignId, plain);

        if( originalDataTotalSize < 0 )
        {
            XecureSignError();
        }
        else
        {
        }
    }
    else
    {
    alert("MultiSignInit�� ���� ���ֽʽÿ�");
    }

    return originalDataTotalSize;
}

// option :
//              0 : ���� �� ��� ����
//              1 : ���� �� ���
//x2            0 : hex encoding
//x2            1 : BASE64 encoding
// mask : 0 : all certificates
//        1 : only user certificates
//        2 : only coperation certificates

// �ֽ��� MultiSign �Լ� �ּ� ���

function Multi_Sign(multiSignId, Option)
{
    var result = 0;

    if(multiSignId != "")
    {
        result = document.XecureWeb.MultiSignEx(multiSignId, xgate_addr, accept_cert, sign_desc, Option, 2);

        if( result < 0 )
        {
            alert("���? �����߽��ϴ�.");//XecureSignError();
        }
        else
        {
            alert("���� ����");
        }
    }
    else
    {
        alert("MultiSignInit�� ���� ���ֽʽÿ�");
    }
    return result;
}

/**
 * MultiSign ���ο��� ����ϴ� ���.<BR>
 */
function Get_Multi_Signed_Data(multiSignId, index)
{
    var signedData = "";

    if(multiSignId != "")
    {
        signedData = document.XecureWeb.GetMultiSignedData(multiSignId,
index);
        if( signedData == "" )
        {
        XecureSignError();
        }
        else
        {
                //alert("�������� ����");
        }
    }
    else
    {
        alert("MultiSignInit�� ���� ���ֽʽÿ�");
    }
    return signedData;
}

//Multi_Sign�� ���� �������� Call
//����� �޸� �� free
/**
 * MultiSign ���ο��� ���Ǵ� ������� ����� �޸𸮸� �����Ѵ�.<BR>
 */
function Multi_Sign_Final(multiSignId)
{
    var result;

    result = document.XecureWeb.MultiSignFinal(multiSignId);

    if( result < 0)
    {
        XecureSignError();
    }
    else
    {
        multiSignId = 0;
    }

    return result;
}

/**
 * �־��� �����ڷ� ���е� ���� �޾�. ������ token�� ���ؼ� ���ڼ����� �Ѵ�.<BR>
 * �̶�, ���ڼ���� �� ���� �����ڷ� ���еȴ�.<BR>
 * 
 * @param total ������ �������� ����
 * @param sign_msg ������ ������
 * @param delimeter �Է� �޽����� ������
 * @return �����ڷ� �̷���� ���ڼ��� ������
 */
function MultiSign(total,sign_msg,delimeter)
{
    var signed_msg = "";
    var multiSign_id = "";
    var tmp = sign_msg;
    var index= "";
    var length = "";
    var signed_tmp;// = "";
    var ret = "";

    if (total <= 0 || sign_msg == "")
    {
        alert("������ ����Ÿ�� ����ϴ�");
        return;
    }

    //Multi���ڼ��� �ʱ�ȭ
    multiSign_id = Multi_Sign_Init();

    //���? ����
    for(i =0;i < total ;i++)
    {
        length = tmp.length;
        index = tmp.indexOf(delimeter);

        Set_Multi_Sign_Data(multiSign_id,tmp.substring(0,index));
        tmp = tmp.substring(index+1,length);
    }
    //���? ��
    ret = Multi_Sign(multiSign_id,131072);//HEX  encoding

    if(ret != 0)
    {
        return ;
    }

    //���? ����
    for(i = 0; i < total ; i++)
    {
        signed_tmp = Get_Multi_Signed_Data(multiSign_id,i);

        if( signed_tmp == "")
        {
                alert('aaa');
                break;
        }
        signed_msg += signed_tmp + delimeter;
    }

        Multi_Sign_Final(multiSign_id);

    return signed_msg;
}


/**
 * �־��� �����ڷ� ���е� ���� �޾�. ������ token�� ���ؼ� �־��� serial�� ���� �������� ���ڼ����� �Ѵ�.<BR>
 * �̶�, ���ڼ���� �� ���� �����ڷ� ���еȴ�.<BR>
 * 
 * @param total ������ �������� ����
 * @param sign_msg ������ ������
 * @param delimeter �Է� �޽����� ������
 * @param serial ���? ����� �������� �ø��� ��ȣ
 * @param locaton ���? ����� �������� ��ġ ����
 * @return �����ڷ� �̷���� ���ڼ��� ������
 * @see MultiSign
 */
function MultiSignWithSerial(total, sign_msg, delimeter,serial,locaton)
{
    var signed_msg = "";
    var multiSign_id = "";
    var tmp = sign_msg;
    var index= "";
    var length = "";
    var signed_tmp = "";
    var ret = "";

    if (total <= 0 || sign_msg == "")
    {
        alert("������ ����Ÿ�� ����ϴ�");
        return;
    }

    //Multi���ڼ��� �ʱ�ȭ
    multiSign_id = Multi_Sign_Init();

    //���? ����
    for(i =0;i < total ;i++)
    {
        length = tmp.length;
        index = tmp.indexOf(delimeter);

        Set_Multi_Sign_Data(multiSign_id,tmp.substring(0,index));
        tmp = tmp.substring(index+1,length);
    }
    ret = Multi_Sign_with_serial(multiSign_id, 256+65536+131072, serial,locaton); //base64  encoding
    if(ret != 0)
    {
        return ;
    }

    //���? ����
    for(i = 0; i < total ; i++)
    {
        signed_tmp = Get_Multi_Signed_Data(multiSign_id,i);
        signed_msg += signed_tmp + delimeter;
    }
    return signed_msg;
}

function GetUserHWInfo(opOpt, ServerCertPem)
{
	var CertInfo;
	alert(opOpt);
			
	CertInfo = document.XecureWeb.GetUserHWInfo( opOpt, ServerCertPem );
					
	alert(CertInfo);
	return CertInfo;
}

/****************For AJAX****************/

function XecureAjaxGet(url)
{
	//alert(url);
	var qs ;
	var path = "/";
	var cipher;
	var xecure_url;
	var qs_begin_index="";

	// get path info & query string & hash from url
	qs_begin_index = url.indexOf('?');
	path = getPath(url)
	// get query string action url
	if ( qs_begin_index < 0 ) {
		qs = "";
	}
	else {
		qs = url.substring(qs_begin_index + 1, url.length );
	}

	if( gIsContinue == 0 ) {
		gIsContinue = 1;

		if( IsNetscape60() )		// Netscape 6.0
			cipher = document.XecureWeb.nsIXecurePluginInstance.BlockEnc(xgate_addr, "/off", XecureEscape(qs), "GET");
		else
			cipher = document.XecureWeb.BlockEnc(xgate_addr, "/off", XecureEscape(qs),"GET");

		gIsContinue = 0;
	}
	else {
		alert(busy_info);
		return false;
	}

	if( cipher == "" )	return XecureWebError();

	xecure_url = path + "?q=" + escape_url(cipher);
	return xecure_url;
}

function XecureAjaxPost(qs)
{
	var qs ;
	var p_value;
	
	if( gIsContinue == 0 ) {
		gIsContinue = 1;

		if( IsNetscape60() )		// Netscape 6.0
			cipher = document.XecureWeb.nsIXecurePluginInstance.BlockEnc ( xgate_addr, "/off", XecureEscape(qs), "POST" );
		else{
			cipher = document.XecureWeb.BlockEnc ( xgate_addr, "/off", XecureEscape(qs), "POST" );
		}
		gIsContinue = 0;
	}

	else {
		//alert(busy_info);
		return false;
	}

	if( cipher == "" )	return XecureWebError() ;
	
	p_value = "p="+escape_url(cipher);
	return p_value;
}

function XecureMakePlainAjax(form)
{
 var name = new Array(Object.keys(form).length);
 var value = new Array(Object.keys(form).length);
 var flag = false;
 var j = 0;
 var plain_text="";
 var enable=false;//for softcamp

//for softcamp
 if(document.secukey==null || typeof(document.secukey) == "undefined" || document.secukey.object==null) {
  enable=false;
 }
 else {
  enable=secukey.GetSecuKeyEnable();
 }

 value = Object.keys(form).map(function (key) {
     return form[key];
 });

 len = Object.keys(form).length;
 for (i = 0; i < len; i++) {
  name[j] = Object.keys(form)[i];
  j++;
 }

 for (i = 0; i < j; i++) {
  str = value[i];
  value[i] = escape_url(str);
 }

for (i = 0; i < j; i++) {
  if (flag)
   plain_text += "&";
  else
   flag = true;

 plain_text += name[i] ;
  plain_text += "=";
  plain_text += value[i];
 }

//console.log("XecureMakePlainAjax :: [" + plain_text + "]");
 return plain_text;
}

