<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>

<html>
<head>
<title>�n�J���</title>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
</head>
<body>
<%
   String userid = request.getParameter("uid");
   String password = request.getParameter("pwd");
   
   session.setAttribute("uid",userid);//�Ω�update.jsp��s���A�USQL�Ȫ�����
   
   Connection con ;
   PreparedStatement stmt = null;
   ResultSet rs = null;
   
   try {
   	   Class.forName("com.mysql.jdbc.Driver");//���J�X�ʵ{�����O
	   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/link?user=root&useUnicode=true&characterEncoding=big5");
//�إ߸�Ʈw�s�u
       stmt = con.prepareStatement("select * from data where username=?");
//�إ߬d�߼g�J�|����ƪ�SQL�r��A�åH�u�H�v�N�����B�Ϊ�����Ѽ�
       stmt.setString(1,userid);
       rs = stmt.executeQuery();
//����PreparedStatement���󪺤�k����ءA����Select�d�߱ԭz��executeQuery��k�A

	   if (rs.next()) {
	       if (password.equals(rs.getString("passw"))) {
			   response.sendRedirect("22.jsp");
			   //�b���K�X�����T��A���Q�n�J�ܧ�s��
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
