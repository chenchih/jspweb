<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>會員註冊</title>
</head>

<body>
<%	 
	 String userid = (String)session.getAttribute("uid");
	
	 Connection con ;
     PreparedStatement stmt = null;
     ResultSet rs = null;
%>

<table width="300" align="center">
<tr><td>

<form name="update" method="post" action="update_check.jsp">
<fieldset>
<legend><font color="#0000FF">會員資料修改</font></legend>

<% 
	  try {
   	   Class.forName("com.mysql.jdbc.Driver").newInstance();//載入驅動程式類別
	   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/store?user=root&useUnicode=true&characterEncoding=big5");

       stmt = con.prepareStatement("select * from member where userid=?");
       stmt.setString(1,userid);
       rs = stmt.executeQuery();
	   
	   if(rs.next()) {
%>
帳號：<%= rs.getString("userid")%><br>	   
密碼：<input name="pwd"  type="text" value="<%= rs.getString("passwd")%>"><br>
姓名：<input name="name" type="text" value="<%= rs.getString("name")%>"><br>
</fieldset>
<%   		
	   }
	} catch (Exception ex) {
       	ex.printStackTrace();
   	} finally {
       	if (stmt!=null) stmt.close();
   } 
%>

<center>
<input type="submit" name="submit" value="修改">
</center>
</form> 

</td></tr>
</table>
</body>
</html>
