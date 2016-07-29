<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*,java.util.*,java.text.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>note</title>
</head>
<body>
<%
	 request.setCharacterEncoding("big5");
     Connection con ;
     PreparedStatement stmt = null;
     String query_stat;
     String[] s = new String[4];
	 
   s[0] = (String)session.getAttribute("no");
	// s[0] = request.getParameter("id"); 
	 s[1] = request.getParameter("subject");
	 s[2] = request.getParameter("note");
	// s[3] = request.getParameter("type");
	 s[3] = request.getParameter("edit_hidden");
//out.print (s[0]+" "+s[1] + " " + s[2]+" " +s[3]+ "" );
//out.print("<br>");

	try 
        {
         Class.forName("com.mysql.jdbc.Driver");//載入驅動程式類別
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp?user=root&useUnicode=true&characterEncoding=big5");
//建立資料庫連線

		 query_stat = "update note set subject=?,note=?,edit_time=? where id=?";
		 stmt=con.prepareStatement(query_stat);
 
	     stmt.setString(1, s[1]);
		 stmt.setString(2, s[2]);
		 stmt.setString(3, s[3]);
		 stmt.setString(4, s[0]);
		// stmt.setString(5, s[0]);
		// stmt.setString(6, s[0]);//第三個「？」的值，我要用s[2]的值代替
		 out.print(stmt+ "");
	     stmt.executeUpdate();

	     } catch (Exception ex) {
       		ex.printStackTrace();
   		} finally {
       		if (stmt!=null) stmt.close();
   } 
 response.sendRedirect("note_display.jsp"); 
	
%>

</body>
</html>
