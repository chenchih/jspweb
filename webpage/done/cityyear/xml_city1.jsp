<%@ page contentType="text/xml; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<?xml version="1.0" encoding="big5"?>

<mycities>
<%
   Connection con;
   PreparedStatement stmt = null;
   ResultSet rs = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();//載入驅動程式類別
	  
   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/abc?user=root&useUnicode=true&characterEncoding=big5");
   String sid = request.getParameter("sid");
   stmt = con.prepareStatement("select * from city where sid=?");
   
   
   stmt.setString(1,sid);
   rs = stmt.executeQuery();
   while (rs.next()) {
%>
   <cities>
      <id><%=rs.getInt("id")%></id>
	  <city><%=rs.getString("name")%></city>
   </cities>
<%
   }   
%>
</mycities> 
