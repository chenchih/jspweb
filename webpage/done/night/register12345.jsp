<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�|�����U11</title>
</head>
<script language="JavaScript" type="text/JavaScript">


</script>

<body>
<%
   Connection con ;
   PreparedStatement stmt = null;
   ResultSet rs = null;	
   Class.forName("com.mysql.jdbc.Driver").newInstance();//���J�X�ʵ{�����O
   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/abc?user=root&useUnicode=true&characterEncoding=big5");
%>
<table width="80%" align="center" border="1">
<form name="register" method="post" action="register_check.jsp">
<tr>
  <td align="center"><font size="7">�|�����U(�i��)</font></td>
</tr>

<tr><td>�b���G<input name="userid" id="userid" type="text" onChange="val_id()"></td></tr>
<tr><td>�K�X�G<input name="pwd" id="pwd" type="password"></td></tr>
<tr>
  <td>�X�͡G�~:
    <select name="year" id="year"  onChange="doSearchMonth()">
            <option value=0 selected>�п��</option>
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
    ��:
    <select name="month" id="month">
              </select>    </td>
</tr>
<tr>
  <td>&nbsp;</td>
</tr>

<tr><td>�q�l�l��G<input name="email" id="email" type="text" onChange="val_e
mail()"></td></tr>
<tr><td><input type="button" name="button" value="���U" onClick="check()">
<input name="reset" type="reset" id="reset" value="���s��g"></td></tr>
</form> 
</table>

</body>
</html>
