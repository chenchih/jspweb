<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>

<html>
<head>
<title>登入成功</title>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
</head>
<body>

<table width="350" align="center" border="1">
  <tr>
    <td width="80%" align="center" bgcolor="#CCCC99">自動回應訊息</td>
  </tr>
  <tr>
    <td>
      帳號或密碼登入成功！
	  <br>
	  <%
   String userid = (String)session.getAttribute("userid");
   out.print(userid + "您好！！<br>" +"歡迎登入");
%>

      <p><a href="signin.jsp">關閉訊息</a><br>
      <font color="#999999">注意：此訊息將在5秒後自動關閉</font></p>
    </td>
  </tr>
</table>
<%
  response.setHeader("Refresh","20;URL=signin.jsp"); 
%>

</body>
</html>
