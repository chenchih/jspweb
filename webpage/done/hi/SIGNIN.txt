<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>會員登入</title>
</head>
<body>
<form name="signin" method="post" action="signin_check.jsp">
<fieldset>
<legend>會員登入</legend>
帳號：<input name="userid" maxlength="10" size="20">
<br>
密碼：<input type="password" name="pwd" maxlength="10" size="21">
<br>
</fieldset>
<input type="submit" name="Submit" value="登入">
<input type="reset" name="reset" value="重新填寫">(<a href="register.jsp">立即註冊</a>)
</form>
</body>
</html>
