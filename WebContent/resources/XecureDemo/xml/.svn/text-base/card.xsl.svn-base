<?xml version="1.0" encoding="euc-kr"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl">
<xsl:template match="/">
<html>

<head>
<link rel="stylesheet" type="text/css" href="style.css"></link>
</head>
  
<body>
<div align='center'>

  <table border="0" cellspacing="3" cellpadding="3">
 	 <tr>
		<td colspan='3' width='270' ><img src="http://phobos.softforum.co.kr:80/XecureDemo/xml/com_icon2.gif" border='0' width='15' height='14'></img>
		<font color='000000'>1일 이상 => 수시입출금식 예금(MMDA)</font></td>
		<td colspan='2' width='280' align='right'><font color='1005b4'>(2000년 11월 08일 ,연 %)</font> </td>
	 </tr>
	 <tr bgcolor='ffdae6' height='18' style='height:13.5pt'>
	    <td height='18'  width='80' style='height:13.5pt;width:60pt'> 은 행</td>
	    <td width='80' style='width:60pt'>상 품 명</td>
	    <td  width='80' style='width:60pt'>금 리</td>
	    <td  width='80' style='width:60pt'>최저가입금액</td>
	    <td  width='80' style='width:60pt'>이자지급방식</td>
	 </tr>
     <xsl:for-each select="Interest/*">

	      <tr bgcolor="fff6f9">
	        <td height='30' width='80' style='width:60pt' align='right'><xsl:value-of select="BankName"/></td>
	        <td  width='80' style='width:60pt'><xsl:value-of select="AccountName"/></td>
	        <td  width='80' style='width:60pt'><xsl:value-of select="Interest"/></td>
	        <td  width='80' style='width:60pt'><xsl:value-of select="LeastInflow"/></td>
	        <td  width='80' style='width:60pt'><xsl:value-of select="InterestOutflow"/></td>
	      </tr>

     </xsl:for-each>
   </table>
	<table>
	<tr>
		<td  width='460' bgcolor='fff4f3'>
		<font color='ba0250'> - 상기 금리는 해당금융기관의 사정으로 변동될 수 있으니 유의 하시길 바랍니다.</font>
		</td>
		<td  width='90'><font color='ba0250'></font></td>
	</tr>
	</table>
	<table>
	<tr>
		<td  width='100' bgcolor='fff4f3'>
		<font color='ba0250'> - ROI 제공 정보</font>
		</td>
		<td  width='450'><font color='ba0250'> </font></td>
	</tr>
	</table>

</div>
</body>

</html>
</xsl:template>
</xsl:stylesheet>
