<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�|�����U</title>
</head>
<script language="JavaScript" type="text/JavaScript">

 var xmlHttp;
 
function doSearchMonth() {
    createXMLHttpRequest();
    xmlHttp.onreadystatechange = handleYearChange;
    xmlHttp.open("GET", "xml_month.jsp", true);
    xmlHttp.send(null);
}
function doSearchCity() {
    var queryString = createCityQueryString();
    createXMLHttpRequest();
    xmlHttp.onreadystatechange = handleStateChange;
    xmlHttp.open("GET", queryString, true);
    xmlHttp.send(null);
}
function handleStateChange() {
   if (xmlHttp.readyState == 4) {
       if (xmlHttp.status == 200) {
	      updateCity();
	   }
   }	   	   
}
function createXMLHttpRequest() {
  if (window.ActiveXObject) {
	  xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
  } else if (window.XMLHttpRequest) {
      xmlHttp = new XMLHttpRequest();
	  
  }
}
function createCityQueryString() {
    var id=document.getElementById("state").value; 
	var queryString="xml_city1.jsp?" + "sid=" + id;
	return queryString;    
}

function handleYearChange() {
   if (xmlHttp.readyState == 4) {
       if (xmlHttp.status == 200) {
	      updateMonth();
	   }
   }	   	   
}
function updateMonth() {
	clearMonthList();
   var c = document.getElementById("month");
   var results = xmlHttp.responseXML.getElementsByTagName("ms");
   var option = null;
   var id;
   var month;
   option = document.createElement("option");
   option.setAttribute("value","0");
   option.appendChild(document.createTextNode("�п��"));
   c.appendChild(option); 
   for (var i=0;i<results.length;i++)
   {
      id = results[i].getElementsByTagName("id")[0].childNodes[0].nodeValue;
	  month = results[i].getElementsByTagName("month")[0].childNodes[0].nodeValue;
      option = document.createElement("option");
	  option.setAttribute("value",id);
	  option.appendChild(document.createTextNode(month));
	  c.appendChild(option);
   }
}
function updateCity() {
   clearCityList();
   var c = document.getElementById("city");
   var results = xmlHttp.responseXML.getElementsByTagName("cities");
   var option = null;
   var id;
   var city;
   option = document.createElement("option");
   option.setAttribute("value","0");
   option.appendChild(document.createTextNode("�п��"));
   c.appendChild(option); 
   for (var i=0;i<results.length;i++)
   {
      id = results[i].getElementsByTagName("id")[0].childNodes[0].nodeValue;
	  city = results[i].getElementsByTagName("city")[0].childNodes[0].nodeValue;
      option = document.createElement("option");
	  option.setAttribute("value",id);
	  option.appendChild(document.createTextNode(city));
	  c.appendChild(option);
   }
}
function clearMonthList() {
   var c = document.getElementById("month");
   while (c.childNodes.length > 0) {
       c.removeChild(c.childNodes[0]);
   }  
}

function clearCityList() {
   var c = document.getElementById("city");
   while (c.childNodes.length > 0) {
       c.removeChild(c.childNodes[0]);
   }  
}
function val_id() {
    var queryString = createIdQueryString();
	if(register.userid.value.length<6)  { 
      alert("�z��J���b�����o�֩�6�Ӧr��");
    } else {
      createXMLHttpRequest();
      xmlHttp.onreadystatechange = callback;
      xmlHttp.open("GET", queryString, true);
      xmlHttp.send(null);
	}  
}
function createIdQueryString() {
    var id=document.getElementById("userid").value; 
	var queryString="xml_validate.jsp?" + "info=" + id + "&type=1" ;
	return queryString;    
}
function callback() {
   if (xmlHttp.readyState == 4) {
       if (xmlHttp.status == 200) {
	      var source = xmlHttp.responseXML.getElementsByTagName("source")[0].firstChild.nodeValue;
		  var res = xmlHttp.responseXML.getElementsByTagName("res")[0].firstChild.nodeValue;
		  if (source == "1" && res=="f") {
		      alert("�ϥΪ̱b���w�Q��L�|�����U");
			  document.getElementById("userid").value="";
		  }	  
	      if (source == "2" && res=="f") {
		       alert("e-mail�b���w�s�b");
			   document.getElementById("email").value="";
		  }
	   }
   }	   	   
}
function val_email() {
   var email = document.getElementById("email").value;
   re = /^.+@.+\..{2,3}$/;
   if (!re.test(email)) {
   		alert("�п�J���T��e-mail");
	}else {
   		var queryString = createEmailQueryString(); 
   		createXMLHttpRequest();
   		xmlHttp.onreadystatechange = callback;
   		xmlHttp.open("GET", queryString, true);
   		xmlHttp.send(null);
	}
}
function createEmailQueryString() {
    var email=document.getElementById("email").value; 
	var queryString="xml_validate.jsp?" + "info=" + email + "&type=2";
	return queryString;    
}
function check() {
	register.action = "register_check.jsp";
    register.submit();
}

</script>

<body>
<%
   Connection con ;
   PreparedStatement stmt = null;
   ResultSet rs = null;	
   Class.forName("com.mysql.jdbc.Driver").newInstance();//���J�X�ʵ{�����O
   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/abc?user=root&useUnicode=true&characterEncoding=big5");
%>
<table width="80%" align="center" border="1">
<form name="register" method="post" action="register_check.jsp">
<tr>
  <td align="center"><font size="7">�|�����U(�i��)</font></td>
</tr>

<tr><td>�b���G<input name="userid" id="userid" type="text" onChange="val_id()"></td></tr>
<tr><td>�K�X�G<input name="pwd" id="pwd" type="password"></td></tr>
<tr>
  <td>�X�͡G�~:
    <select name="year" id="year"  onChange="doSearchMonth()">
            <option value=0 selected>�п��</option>
<%
       stmt = con.prepareStatement("select * from years");
       rs = stmt.executeQuery();
	   while (rs.next()) {
%>
              <option value="<%=rs.getInt("id")%>"><%=rs.getInt("year")%></option>
                  <%	   
	   }
%>
              </select>
    ��:
    <select name="month" id="month">
              </select>    </td>
</tr>
<tr>
  <td>�����G
    <select name="state" id="state"  onChange="doSearchCity()">
            <option value=0 selected>�п��</option>
<%
       stmt = con.prepareStatement("select * from state");
       rs = stmt.executeQuery();
	   while (rs.next()) {
%>
              <option value="<%=rs.getInt("id")%>"><%=rs.getString("name")%></option>
                  <%	   
	   }
%>
              </select>
&nbsp;&nbsp;&nbsp;�m��ϡG
<select name="city" id="city">
</select></td>
</tr>

<tr><td>�q�l�l��G<input name="email" id="email" type="text" onChange="val_e
mail()"></td></tr>
<tr><td><input type="button" name="button" value="���U" onClick="check()">
<input name="reset" type="reset" id="reset" value="���s��g"></td></tr>
</form> 
</table>

</body>
</html>
