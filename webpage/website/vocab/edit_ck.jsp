<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*,java.util.*,java.text.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>vocab</title>
</head>
<body>
<%
	 request.setCharacterEncoding("big5");
     Connection con ;
     PreparedStatement stmt = null;
     String query_stat;
     String[] s = new String[6];
	 
   s[0] = (String)session.getAttribute("no");
	// s[0] = request.getParameter("no"); 
	 s[1] = request.getParameter("term_en");
	 s[2] = request.getParameter("term_chi");
	 s[3] = request.getParameter("note");
	  s[4] = request.getParameter("time");
	    s[5] = request.getParameter("type");
	try 
        {
         Class.forName("com.mysql.jdbc.Driver");//載入驅動程式類別
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp?user=root&useUnicode=true&characterEncoding=big5");
//建立資料庫連線

		 query_stat = "update vocab set term_eng=?,term_chi=?,note=?,edt_time=?,type=? where no=?";
		 stmt=con.prepareStatement(query_stat);

	     stmt.setString(1, s[1]);
		 stmt.setString(2, s[2]);
		 stmt.setString(3, s[3]);
		 stmt.setString(4, s[4]);
		 stmt.setString(5, s[5]);
		  stmt.setString(6, s[0]);
		
		 
	     stmt.executeUpdate();

	     } catch (Exception ex) {
       		ex.printStackTrace();
   		} finally {
       		if (stmt!=null) stmt.close();
   } 
    response.sendRedirect("vocab_display.jsp"); 
	
%>

</body>
</html>
