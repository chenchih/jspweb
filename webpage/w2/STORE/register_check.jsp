<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*,java.util.*,java.text.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>���UCheck</title>
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
         Class.forName("com.mysql.jdbc.Driver");//���J�X�ʵ{�����O
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/store?user=root&useUnicode=true&characterEncoding=big5");
//�إ߸�Ʈw�s�u
		 query_stat = "insert into member (userid, passwd, name) values (?,?,?)";
		 stmt=con.prepareStatement(query_stat);
	     for (int i=1; i<=3; i++)
	     { 
	        stmt.setString(i, s[i-1]);
	     }
//�]�w����ѼơA�uPreparedStatement����.set���O�]���ޡA�Ѽƭȡ^�v�C(�ĴX�Ӱݸ������ޭn�Τ���ѼƥN��)
	     stmt.executeUpdate();
//����PreparedStatement���󪺤�k����ءA����Insert���J�ԭz��executeUpdate��k
	     } catch (Exception ex) {
       		ex.printStackTrace();
   		} finally {
       		if (stmt!=null) stmt.close();
   } 
   response.sendRedirect("signin.jsp"); 
%>
</body>
</html>
