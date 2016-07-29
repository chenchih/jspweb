<%@ page contentType="text/xml; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<?xml version="1.0" encoding="big5"?>
<mymonth>
<%
   Connection con ;
   PreparedStatement stmt = null;
   ResultSet rs = null;
   Class.forName("com.mysql.jdbc.Driver").newInstance();//載入驅動程式類別
   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/abc?user=root&useUnicode=true&characterEncoding=big5");
   stmt = con.prepareStatement("select * from months");
   rs = stmt.executeQuery();
   while (rs.next()) {
%>
   <ms>
      <id><%=rs.getInt("id")%></id>
	  <month><%=rs.getString("month")%></month>
   </ms>
<%
   }   
%>
</mymonth> 
