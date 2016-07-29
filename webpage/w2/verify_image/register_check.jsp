<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*,java.util.*,java.text.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>���UCheck</title>
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
     String[] s = new String[11];
	  String rand = (String)session.getAttribute("rand");
     String input = request.getParameter("rand");
	  if (rand.equals(input)) {


	 s[0] = getRecordID();
	 s[1] = (String) request.getParameter("userid"); 
	 s[2] = (String) request.getParameter("pwd"); 
	 s[3] = (String) request.getParameter("name");
	 s[4] = (String) request.getParameter("gender");
	 s[5] = (String) request.getParameter("year");
	 s[6] = (String) request.getParameter("month");
	 s[7] = (String) request.getParameter("date");
	 s[8] = (String) request.getParameter("address");
	 s[9] = (String) request.getParameter("email").toLowerCase(); 
	 s[10] = (String) request.getParameter("phone");  

	session.setAttribute("userid",s[1]);
		
	try 
        {
         Class.forName("com.mysql.jdbc.Driver").newInstance();//���J�X�ʵ{�����O
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/account?user=root&useUnicode=true&characterEncoding=big5");
//�إ߸�Ʈw�s�u
		 query_stat = "insert into member (id,userid, pwd, name, gender, year, month, date, address, " +
	                     "email, phone) values (?,?,?,?,?,?,?,?,?,?,?)";
//�إ߬d�߼g�J�|����ƪ�SQL�r��A�åH�u�H�v�N�����B�Ϊ�����Ѽ�
		 stmt=con.prepareStatement(query_stat);
//�HSQL�ԭz���d���A�إ�PreparedStatement����
	     for (int i=1; i<=11; i++)
	     { 
	        stmt.setString(i, s[i-1]);
	     }
//�]�w����ѼơA�uPreparedStatement����.set���O�]���ޡA�Ѽƭȡ^�v�C
	     stmt.executeUpdate();
//����PreparedStatement���󪺤�k����ءA�@������Select�d�߱ԭz��executeQuery��k�A
//�t�@�ذ���O���ק�ԭz(Update�BInsert��Delete��executeUpdate��k)
	     } catch (Exception ex) {
       ex.printStackTrace();
   		}finally {
	    	if (stmt!=null) stmt.close();
			
		    response.sendRedirect("reg_success.jsp");
	    }
     } else {
	    response.sendRedirect("reg_error.jsp");
	 }		
%>
</body>
</html>
