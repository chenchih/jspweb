<%@ page contentType="text/xml; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<?xml version="1.0" encoding="big5"?>
<jsp:useBean id="ConBean" scope="session" class="com.db.DBCon" />
<validate>
<%
   Connection con = ConBean.getConnection();
   PreparedStatement stmt = null;
   ResultSet rs = null;
   String info = request.getParameter("info");
   String type = request.getParameter("type");
   out.println("<source>" + type + "</source>"); 
   if (type.equals("1")) {  
       stmt = con.prepareStatement("select * from member where userid=?");
   } else {
       stmt = con.prepareStatement("select * from member where email=?");   
   }	   
   stmt.setString(1,info);
   rs = stmt.executeQuery();
   if (rs.next()) {
       out.println("<res>f</res>");
   } else {
       out.println("<res>p</res>");
   } 	   
%>   
</validate> 
