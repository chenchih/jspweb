<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*,java.util.*,java.text.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�L���D���</title>
</head>

<body>
<%! 
   public String getRecordID(){
       SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss",Locale.US);
       java.util.Date currentDate = new java.util.Date();
       return formatter.format(currentDate);
   }
%>
<%
	 request.setCharacterEncoding("big5");
     Connection con ;
     PreparedStatement stmt = null;
     String query_stat;
     String[] s = new String[6];
	
	 s[0] = request.getParameter("name"); 
	 s[1] = request.getParameter("username"); 
	 s[2] = request.getParameter("email");
	 s[3] = request.getParameter("subject");
	 s[4] = request.getParameter("comment");
	 s[5] = request.getParameter("date_id");

	try 
        {
         Class.forName("com.mysql.jdbc.Driver");//���J�X�ʵ{�����O
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/account?user=root&useUnicode=true&characterEncoding=big5");
//�إ߸�Ʈw�s�u
		 query_stat = "insert into message (name, username, email,subject, comment,date_id) values (?,?,?,?,?,?)";
//�إ߬d�߼g�J�|����ƪ�SQL�r��A�åH�u�H�v�N�����B�Ϊ�����Ѽ�
		 stmt=con.prepareStatement(query_stat);
//�HSQL�ԭz���d���A�إ�PreparedStatement����
	     for (int i=1; i<=6; i++)
	     { 
	        stmt.setString(i, s[i-1]);
	     }
//�]�w����ѼơA�uPreparedStatement����.set���O�]���ޡA�Ѽƭȡ^�v�C
	     stmt.executeUpdate();
//����PreparedStatement���󪺤�k����ءA�@������Select�d�߱ԭz��executeQuery��k�A
//�t�@�ذ���O���ק�ԭz(Update�BInsert��Delete��executeUpdate��k)
	     } catch (Exception ex) {
       ex.printStackTrace();
   		} finally {
       		if (stmt!=null) stmt.close();
   } 
   response.sendRedirect("signin.jsp"); 
%>
</body>
</html>
