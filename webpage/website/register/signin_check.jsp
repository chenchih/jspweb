<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>

<html>
<head>
<title>�n�J���</title>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
</head>
<body>
<%
   String userid = request.getParameter("userid");
   String password = request.getParameter("pwd");
   Connection con ;
   PreparedStatement stmt = null;
   ResultSet rs = null;
   
   session.setAttribute("userid",userid);//�n�J�᪺�۩I
   
   try {
   	   Class.forName("com.mysql.jdbc.Driver").newInstance();//���J�X�ʵ{�����O
	   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp?user=root&useUnicode=true&characterEncoding=big5");
//�إ߸�Ʈw�s�u
       stmt = con.prepareStatement("select * from member where userid=?");
//�إ߬d�߼g�J�|����ƪ�SQL�r��A�åH�u�H�v�N�����B�Ϊ�����Ѽ�
       stmt.setString(1,userid);
       rs = stmt.executeQuery();
//����PreparedStatement���󪺤�k����ءA�@������Select�d�߱ԭz��executeQuery��k�A
//�t�@�ذ���O���ק�ԭz(Update�BInsert��Delete��executeUpdate��k)
	   if (rs.next()) {
	       if (password.equals(rs.getString("pwd"))) {
			   response.sendRedirect("signin_success.jsp");
			   //�b���K�X�����T��A���Q�n�J�ܩ_����
		   } else {
		       response.sendRedirect("signin_error.jsp");
		   } 	
	   } else {
	       response.sendRedirect("signin_error.jsp");
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
