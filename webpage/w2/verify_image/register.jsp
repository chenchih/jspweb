<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�|�����U</title>
</head>
<script language="JavaScript" type="text/JavaScript">

 var xmlHttp;

function val_id() {
	var messageArea = document.getElementById("divAccount");
	messageArea.innerHTML = "<font color=red></font>";
    var queryString = createIdQueryString();

//	if(register.userid.value.length<6)  { 
	var uid = document.register.userid.value;
	re1=/^[a-zA-Z0-9]{4,}$/
	if (!re1.test(uid)){
      alert("�z��J���b�����o�֩�6~9�Ӧr��");
    } else {
      createXMLHttpRequest();
      xmlHttp.onreadystatechange = callback;
      xmlHttp.open("GET", queryString, true);
      xmlHttp.send(null);
	}  
}
function createXMLHttpRequest() {
  if (window.ActiveXObject) {
      xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
  } else if (window.XMLHttpRequest) {
      xmlHttp = new XMLHttpRequest();
  }
}

function createIdQueryString() {
    var id=document.register.userid.value; 
	var queryString="xml_validate.jsp?" + "info=" + id + "&type=1" ;
	return queryString;    
}
function callback() {
var messageArea = document.getElementById("divAccount");
   if (xmlHttp.readyState == 4) {
       if (xmlHttp.status == 200) {
	      var source = xmlHttp.responseXML.getElementsByTagName("source")[0].firstChild.nodeValue;
		  var res = xmlHttp.responseXML.getElementsByTagName("res")[0].firstChild.nodeValue;
		  if (source == "1" && res=="f") {
		      //alert("�ϥΪ̱b���w�Q��L�|�����U");
messageArea.innerHTML = "<font color=red>�ϥΪ̱b���w�Q��L�|�����U</font>";
			  document.register.userid.value=""; 
		  }	
		  else  
		 { messageArea.innerHTML = "<font color=green>ok,�b���i�H��</font>"; }
	      if (source == "2" && res=="f") {
		       alert("e-mail�b���w�s�b");
			   document.register.email.value="" ;
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
function check()
 {
  var email = document.getElementById("email").value;
   re = /^.+@.+\..{2,3}$/;

		
	if (register.userid.value == "" )
		{ alert("�п�J�z���ϥΪ̱b��");	}
			else if (register.pwd.value == "" ) 
			{alert("�п�J�z���K�X");}
				else if (register.pwd.value != register.rpwd.value ) 
				{alert("�z��J���T�{�K�X�P�K�X����");}
					else if(register.name.value == "" ) 
					{alert("�п�J�z���W�l");}
						else if(register.gender.value == "" ) 
						{alert("�п�J�z���ʧO");}
							else if (register.year.value=="0" ) 
							{alert("�п�ܦ~");	}
								else if (register.month.value=="0" ) 
								{alert("�п�ܤ�");	}
									else if (register.date.value=="" ) 
									{alert("�п�J��");}
										else if (register.email.value == "" ) 
										{alert("�п�J�z���q�l�l��")}
												else 
													{
												register.action = "register_check.jsp";
 												register.submit();
												}
}   
function show(o){
 var timenow = new Date().getTime();
 o.src="varify_image.jsp?d="+timenow;

}

</script>

<body>
<p>&nbsp;</p>
<table width="950" align="center" border="1">
  <form name="register" method="post" action="register_check.jsp">
    <tr>
      <td align="center"><font size="7">�|�����U</font></td>
    </tr>
    <tr bgcolor="#999966">
      <td>�|�����</td>
    </tr>
    <tr>
      <td>�b���G
          <input name="userid" id="userid3" type="text" onChange="val_id()">
 <div id="divAccount">Applying an account...</div>
      </td>
    </tr>
    <tr>
      <td>�K�X�G
          <input name="pwd" type="password" id="pwd">
      </td>
    </tr>
    <tr>
      <td>�T�{�K�X�G
          <input name="rpwd" type="password"></td>
    </tr>
    <tr bgcolor="#999966">
      <td>�ӤH���</td>
    </tr>
    <tr>
      <td>�m�W�G
          <input name="name" type="text">
          <font color="#FF0000">�]����^</font></td>
    </tr>
    <tr>
      <td>�ʧO�G
          <input name="gender" type="radio" value="1" checked>
        �k
        <input name="gender" type="radio" value="0">
        �k �]����^</td>
    </tr>
    <tr>
      <td>��}�G
          <input name="address" type="text" size="40"></td>
    </tr>
    <tr>
      <td>�X�͡G
        
        �~:
          
        <select name="year" id="year">
          <%
	for(int i=1950;i<=1998;i++) {
%>
          <option value="<%= i%>"><%= i%>�~</option>
          <%
	}
%>
        </select>
        ��:
        <select name="month" id="month">
          <%
	for(int j=1;j<=12;j++) {
%>
          <option value="<%= j%>"><%= j%>��</option>
          <%
	}
%>
        </select>
        ��:
        <input name="date" type="text" id="date" size="3">
      <font color="#FF0000">�]����^ </font></td>
    </tr>
    <tr>
      <td>�q�l�l��G
          <input name="email" id="email3" type="text" onChange="val_email()">
        <font color="#FF0000">�]����^</font></td>
    </tr>
    <tr>
      <td>�p���q�ܡG
          <input name="phone" type="text"></td>
    </tr>
    <tr>
      <td><strong>�п�J���ҽX�G</strong><a href="javascript:show(document.getElementById('random'))"><img src="varify_image.jsp" border=0 align="absmiddle"id="random"></a>
        <input type="text" name="rand" maxlength=4 value="">
          <label><font color="#FF0000">�]����^�ݤ��M�����ҽX���I�@�U��</font></label></td>
    </tr>
    <tr>
      <td><input type="button" name="button2" value="���U" onClick="check()">
          <input name="reset2" type="reset" id="reset2" value="���s��g"></td>
    </tr>
  </form>
</table>
<p>&nbsp;</p>
</body>
</html>
