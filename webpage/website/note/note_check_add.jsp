<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*,java.util.*,java.text.*" errorPage="" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>vocabCheck</title>
</head>
 <%! 
   public String getRecordID(){
       SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss",Locale.US);
       java.util.Date currentDate = new java.util.Date();
       return formatter.format(currentDate);
   }
%>
<body>
<%
	 request.setCharacterEncoding("big5");
     Connection con ;
     PreparedStatement stmt = null;
     String query_stat;
	
     String[] s = new String[5];
	 s[0] = getRecordID();
	 s[1] = (String) request.getParameter("type"); 
	 s[2] = (String) request.getParameter("subject"); 
	 s[3] = (String) request.getParameter("note");
	 s[4] = getRecordID();
		try 
        {
         Class.forName("com.mysql.jdbc.Driver");//���J�X�ʵ{�����O
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp?user=root&useUnicode=true&characterEncoding=big5");
//�إ߸�Ʈw�s�u
		 query_stat = "insert into note (no, type, subject, note, edit_time) values (?,?,?,?,?)";
//�إ߬d�߼g�J�|����ƪ�SQL�r��A�åH�u�H�v�N�����B�Ϊ�����Ѽ�
		 stmt=con.prepareStatement(query_stat);
//�HSQL�ԭz���d���A�إ�PreparedStatement����
	     for (int i=1; i<=5; i++)
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
  response.sendRedirect("note_display.jsp");
   %>
</body>
</html>
