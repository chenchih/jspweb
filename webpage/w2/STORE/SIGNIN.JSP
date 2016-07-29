<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>會員登入</title>
</head>
<body>
<table width="300" align="center">
<tr><td>

<form name="signin" method="post" action="signin_check.jsp">
<fieldset>
<legend><font color="#0000FF">會員登入</font></legend>
帳號：<input type="text" name="uid">
<br>
密碼：<input type="password" name="pwd">
<br>
</fieldset>

<center>
<input type="submit" name="Submit" value="登入">
<input type="reset" name="reset" value="重新填寫">(<a href="register.jsp">立即註冊</a>)
</center>
</form>

</td></tr>
</table>
</body>
</html>
