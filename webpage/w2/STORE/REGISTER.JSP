<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>會員註冊</title>
</head>
<script language="JavaScript" type="text/JavaScript">
function check() {
	var uid = document.getElementById("uid").value;
	var pwd = document.getElementById("pwd").value;
	var rpwd = document.getElementById("rpwd").value;
    if (uid=="" || pwd =="" || rpwd =="") {
		alert("會員資料的欄位都要填寫！");
	}
	else if (pwd!=rpwd ) {
		alert("請重新輸入「確認密碼」！");
	}
	else {
		register.action = "register_check.jsp";
        register.submit();
	}
}
</script>

<body>
<table width="300" align="center">
<tr><td>

<form name="register" method="post" action="register_check.jsp">
<fieldset>
<legend><font color="#0000FF">會員註冊</font></legend>
<b>會員資料</b><br>
帳號：<input name="uid" id="uid" type="text"><br>
密碼：<input name="pwd" id="pwd" type="password"><br>
確認密碼：<input name="rpwd" id="rpwd" type="password"><br>
<b>個人資料</b><br>
姓名：<input name="name" type="text"><br>
</fieldset>

<center>
<input type="button" name="button" value="註冊" onClick="check()">
<input name="reset" type="reset" id="reset" value="重新填寫">
</center>
</form> 

</td></tr>
</table>
</body>
</html>
