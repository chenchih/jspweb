<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>

<html>
<head>
<title>登入驗証</title>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
</head>
<body>
<%
   String userid = request.getParameter("uid");
   String password = request.getParameter("pwd");
   
   session.setAttribute("uid",userid);//用於update.jsp更新欄位，下SQL值的索引
   
   Connection con ;
   PreparedStatement stmt = null;
   ResultSet rs = null;
   
   try {
   	   Class.forName("com.mysql.jdbc.Driver");//載入驅動程式類別
	   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/link?user=root&useUnicode=true&characterEncoding=big5");
//建立資料庫連線
       stmt = con.prepareStatement("select * from data where username=?");
//建立查詢寫入會員資料的SQL字串，並以「？」代替欲運用的執行參數
       stmt.setString(1,userid);
       rs = stmt.executeQuery();
//執行PreparedStatement物件的方法有兩種，執行Select查詢敘述為executeQuery方法，

	   if (rs.next()) {
	       if (password.equals(rs.getString("passw"))) {
			   response.sendRedirect("22.jsp");
			   //帳號密碼都正確後，順利登入至更新頁
		   } else {
		       response.sendRedirect("signin.jsp");
		   } 	
	   } else {
	       response.sendRedirect("signin.jsp");
	   }  		       
     } catch (Exception ex) {
	    ex.printStackTrace();
     } finally {
        if (rs!=null) rs.close();
    	if (stmt!=null) stmt.close();
     } 	   
%>
</body>
</html>
