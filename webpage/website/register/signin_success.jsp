<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>

<html>
<head>
<title>�n�J���\</title>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
</head>
<body>

<table width="350" align="center" border="1">
  <tr>
    <td width="80%" align="center" bgcolor="#CCCC99">�۰ʦ^���T��</td>
  </tr>
  <tr>
    <td>
      �b���αK�X�n�J���\�I
	  <br>
	  <%
   String userid = (String)session.getAttribute("userid");
   out.print(userid + "�z�n�I�I<br>" +"�w��n�J");
%>

      <p><a href="signin.jsp">�����T��</a><br>
      <font color="#999999">�`�N�G���T���N�b5���۰�����</font></p>
    </td>
  </tr>
</table>
<%
  response.setHeader("Refresh","20;URL=signin.jsp"); 
%>

</body>
</html>
