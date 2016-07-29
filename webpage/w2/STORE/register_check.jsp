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
     String[] s = new String[3];
	 
	 s[0] = request.getParameter("uid"); 
	 s[1] = request.getParameter("pwd"); 
	 s[2] = request.getParameter("name");
	
	try 
        {
         Class.forName("com.mysql.jdbc.Driver");//載入驅動程式類別
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/store?user=root&useUnicode=true&characterEncoding=big5");
//建立資料庫連線
		 query_stat = "insert into member (userid, passwd, name) values (?,?,?)";
		 stmt=con.prepareStatement(query_stat);
	     for (int i=1; i<=3; i++)
	     { 
	        stmt.setString(i, s[i-1]);
	     }
//設定執行參數，「PreparedStatement物件.set型別（索引，參數值）」。(第幾個問號的索引要用什麼參數代替)
	     stmt.executeUpdate();
//執行PreparedStatement物件的方法有兩種，執行Insert插入敘述為executeUpdate方法
	     } catch (Exception ex) {
       		ex.printStackTrace();
   		} finally {
       		if (stmt!=null) stmt.close();
   } 
   response.sendRedirect("signin.jsp"); 
%>
</body>
</html>
