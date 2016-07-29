<%@ page contentType="text/xml; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<?xml version="1.0" encoding="big5"?>
<jsp:useBean id="ConBean" scope="session" class="com.db.DBCon" />
<mycities>
<%
   Connection con = ConBean.getConnection();
   PreparedStatement stmt = null;
   ResultSet rs = null;
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
