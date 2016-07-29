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
    <td width="80%" align="center" bgcolor="#CCCC99">自動回應訊息</td>
  </tr>
  <tr>
    <td>
      註冊成功！
      <p><a href="signin.jsp">關閉訊息</a><br>
      <font color="#999999">注意：此訊息將在5秒後自動關閉</font></p>
    </td>
  </tr>
</table>
<%
    response.setHeader("Refresh","5;URL=signin.jsp");
%>	
</body>
</html>