<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�|�����U</title>
</head>
<script language="JavaScript" type="text/JavaScript">
function check() {
    if (register.userid.value=="" || register.pwd.value=="" || register.rpwd.value=="") {
	alert("�|����ƪ���쳣�n��g�I");
	}
	else if (register.pwd.value!=register.rpwd.value ) {
	alert("�Э��s��J�u�T�{�K�X�v�I");
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
<tr><td align="center"><font size="7">�|�����U</font></td></tr>
<tr bgcolor="#999966">
  <td>�|�����</td>
</tr>
<tr><td>�b���G<input name="userid" type="text"></td></tr>
<tr><td>�K�X�G<input name="pwd" type="password"></td></tr>
<tr><td>�T�{�K�X�G<input name="rpwd" type="password"></td></tr>
<tr bgcolor="#999966"><td>�ӤH���</td></tr>
<tr><td>�m�W�G<input name="name" type="text"></td></tr>
<tr><td>�ʧO�G<input name="gender" type="radio" value="1" checked>�k
              <input name="gender" type="radio" value="0">�k</td></tr>
<tr><td>��}�G<input name="address" type="text" size="40"></td></tr>
<tr><td>�q�l�l��G<input name="email" type="text"></td></tr>
<tr><td>�p���q�ܡG<input name="phone" type="text"></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td><input type="button" name="button" value="���U" onClick="check()">
<input name="reset" type="reset" id="reset" value="���s��g"></td></tr>
</form> 
</table>

</body>
</html>
