<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<link href="css\eWoo.css" rel="stylesheet" type="text/css">
<title>Registration Success</title>
<style type="text/css">
<!--
body {
	background-color: #66FF99;
}
.style1 {color: #FF0000;
	font-weight: bold;
}
.style2 {color: #000000}
-->
</style></head>
<body>
<p>&nbsp;</p>
<table width="350" align="center" border="1">
  <tr>
    <td width="80%" align="center" bgcolor="#CCCC99">�۰ʦ^���T��</td>
  </tr>
  <tr>
    <td> ���U���\�I
      <p>
          <%
   String userid = (String)session.getAttribute("userid");
   out.print(userid + "�z�n�I�I<br>" +"�w��n�J");
%>
          <%
 response.setHeader("Refresh","5;URL=signin.jsp");
%>
      </p>
    <p><span class="style1">(�`�N ���T���N�b5���۰ʨ�n�J) <span class="style2"><a href="bulletin_news.jsp">����</a></span></span>        </p></td>
  </tr>
</table>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</body>
</html>