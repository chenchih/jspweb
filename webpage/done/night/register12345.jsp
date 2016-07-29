<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>會員註冊11</title>
</head>
<script language="JavaScript" type="text/JavaScript">


</script>

<body>
<%
   Connection con ;
   PreparedStatement stmt = null;
   ResultSet rs = null;	
   Class.forName("com.mysql.jdbc.Driver").newInstance();//載入驅動程式類別
   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/abc?user=root&useUnicode=true&characterEncoding=big5");
%>
<table width="80%" align="center" border="1">
<form name="register" method="post" action="register_check.jsp">
<tr>
  <td align="center"><font size="7">會員註冊(進階)</font></td>
</tr>

<tr><td>帳號：<input name="userid" id="userid" type="text" onChange="val_id()"></td></tr>
<tr><td>密碼：<input name="pwd" id="pwd" type="password"></td></tr>
<tr>
  <td>出生：年:
    <select name="year" id="year"  onChange="doSearchMonth()">
            <option value=0 selected>請選擇</option>
<%
       stmt = con.prepareStatement("select * from years");
       rs = stmt.executeQuery();
	   while (rs.next()) {
%>
              <option value="<%=rs.getInt("id")%>"><%=rs.getInt("year")%></option>
                  <%	   
	   }
%>
              </select>
    月:
    <select name="month" id="month">
              </select>    </td>
</tr>
<tr>
  <td>&nbsp;</td>
</tr>

<tr><td>電子郵件：<input name="email" id="email" type="text" onChange="val_e
mail()"></td></tr>
<tr><td><input type="button" name="button" value="註冊" onClick="check()">
<input name="reset" type="reset" id="reset" value="重新填寫"></td></tr>
</form> 
</table>

</body>
</html>
