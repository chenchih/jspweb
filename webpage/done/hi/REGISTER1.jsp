<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>會員註冊</title>
</head>
<script language="JavaScript" type="text/JavaScript">
function check() {
    if (register.userid.value=="" || register.pwd.value=="" || register.rpwd.value=="") {
	alert("會員資料的欄位都要填寫！");
	}
	else if (register.pwd.value!=register.rpwd.value ) {
	alert("請重新輸入「確認密碼」！");
	}
	else {
		register.action = "register_check.jsp";
        register.submit();
	}
}
</script>

<body>
<table width="80%" align="center" border="1">
<form name="register" method="post" action="register_check.jsp">
<tr><td align="center"><font size="7">會員註冊</font></td></tr>
<tr bgcolor="#999966">
  <td>會員資料</td>
</tr>
<tr><td>帳號：<input name="userid" type="text"></td></tr>
<tr><td>密碼：<input name="pwd" type="password"></td></tr>
<tr><td>確認密碼：<input name="rpwd" type="password"></td></tr>
<tr bgcolor="#999966"><td>個人資料</td></tr>
<tr><td>姓名：<input name="name" type="text"></td></tr>
<tr><td>性別：<input name="gender" type="radio" value="1" checked>男
              <input name="gender" type="radio" value="0">女</td></tr>
<tr><td>住址：<input name="address" type="text" size="40"></td></tr>
<tr><td>電子郵件：<input name="email" type="text"></td></tr>
<tr><td>聯絡電話：<input name="phone" type="text"></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td><input type="button" name="button" value="註冊" onClick="check()">
<input name="reset" type="reset" id="reset" value="重新填寫"></td></tr>
</form> 
</table>

</body>
</html>
