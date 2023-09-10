<%@ page import="java.util.*" %>

===============================================<br>
System Properties<br>
===============================================<br>
<%
	Properties properties = System.getProperties();
	Enumeration en = properties.propertyNames();
	String enKey=null;
	while(en.hasMoreElements()){
		enKey = (String)en.nextElement();
		out.println(enKey + " [" + properties.getProperty(enKey) +"] <br>");
	}
%>
<br>
===============================================<br>
Supported Character sets<br>
===============================================<br>
<%
	SortedMap map = java.nio.charset.Charset.availableCharsets();
	Iterator keys = map.keySet().iterator();
	String chKey = null;
	while (keys.hasNext()) {
		chKey = (String)keys.next();
		out.println(map.get(chKey)+"<br>");
		Iterator aliases = ((java.nio.charset.Charset)map.get(chKey)).aliases().iterator();
		while(aliases.hasNext()){
        	out.print("&nbsp; &nbsp;" + aliases.next() + "<br>");
      	}
	}
%>
