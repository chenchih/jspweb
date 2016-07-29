<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*,java.util.*,java.text.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>註冊Check</title>
</head>
<body>
<%


	 request.setCharacterEncoding("big5");
     Connection con ;
     PreparedStatement stmt = null;
     String query_stat;
	 String no=(String)session.getAttribute("no");
	
	try 
        {
         Class.forName("com.mysql.jdbc.Driver");//載入驅動程式類別
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp?user=root&useUnicode=true&characterEncoding=big5");
//建立資料庫連線

		 query_stat = "DELETE FROM note WHERE id = '"+no+"'";
		 stmt=con.prepareStatement(query_stat);

	
		 
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
