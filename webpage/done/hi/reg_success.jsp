<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<link href="css\eWoo.css" rel="stylesheet" type="text/css">
<title>Registration Success</title>
</head>
<body>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<table width="350" align="center" border="1">
  <tr>
    <td width="80%" align="center" bgcolor="#CCCC99">�۰ʦ^���T��</td>
  </tr>
  <tr>
    <td>
      ���U���\�I
      <p><a href="signin.jsp">�����T��</a><br>
      <font color="#999999">�`�N�G���T���N�b5���۰�����</font></p>
    </td>
  </tr>
</table>
<%
    response.setHeader("Refresh","5;URL=signin.jsp");
%>	
</body>
</html>