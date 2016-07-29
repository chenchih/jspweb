<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>無標題文件</title>
</head>

<body>
<%
	 request.setCharacterEncoding("big5");
     Connection con ;
     PreparedStatement stmt = null;
	 ResultSet rs = null;
	
%>
<table width="400" border="1">
  <tr>
    <td width="200">no</td>
    <td width="200">使用者帳號</td>
    <td width="200">密碼</td>
    <td width="200">名字</td>
  </tr>
  <%
	try 
        {		
        Class.forName("com.mysql.jdbc.Driver").newInstance();//載入驅動程式類別
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/link?user=root&useUnicode=true&characterEncoding=big5");
		stmt=con.prepareStatement("select no,username, passw, name from data");
		
 		 rs = stmt.executeQuery();
	     while(rs.next()) {
		 	out.print("<tr><td>");
			out.print(rs.getString("no"));
			out.print("</td><td>");
			out.print(rs.getString("username"));
			out.print("</td><td>");
  			out.print(rs.getString("passw"));
			out.print("</td><td>");
			out.print(rs.getString("name"));
			out.print("</td></tr>");
		}
		%>
</table>
<p>
  <%
	  } catch (Exception ex) {
       ex.printStackTrace();
   	  } finally {
       		if (stmt!=null) stmt.close();
			if (rs!=null) rs.close();
   } 
%>
</p>
<br>


</body>
</html>
