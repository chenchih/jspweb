<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�L���D���</title>
<style type="text/css">
<!--
.style9 {font-size: 24px; font-weight: bold; }
-->
</style>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
<!--
body,td,th {
	color: #000000;
}
a:link {
	color: #0000FF;
}
.style5 {color: #0000FF}
.style18 {font-size: 16px}
a:hover {
	color: #FF0000;
}
body {
	background-color: #FFFFFF;
}
-->
</style>
</head>

<body>


    <table width="623" border="0" align="center">
      <tr>
        <td width="613"><div align="center"><span class="style18"><a href="signout.jsp" class="style5">�n�X </a>|| <a href="all_entry.jsp" class="style5">�ϥΪ̸��</a> || <a href="search.jsp" class="style5">�j�� </a>|| <a href="add_term.jsp" class="style5">�s�W�W��</a> || <a href="news/news.jsp" class="style5">��������</a> ||<a href="suggestion.jsp" class="style5"> �N��</a> || <a href="forum/forum.jsp" class="style5">�Q�װ�</a> ||<a href="message/message.jsp" class="style5"> �d��</a></span></div></td>
      </tr>
    </table>
    <p><a href="part_entry.jsp"></a></p>
    <table width="392" height="21" border="1" align="center">
      <tr>
        <td width="135" bgcolor="#CC0000"><div align="center"><span class="style9">�Ҧ����</span></div></td>
        <td width="117"><div align="center"><span class="style9"><a href="part_entry.jsp" class="style5">��Ƥ���</a></span></div></td>
        <td width="118"><div align="center"><span class="style9"><a href="add_delete.jsp" class="style5">�R��/��s</a><a href="add_delete.jsp"></a></span></div></td>
      </tr>
    </table>
    <hr>
<form name="form1" method="post" action="">

  <table width="966" border="1" align="center">
    <tr>
      <td width="804"><p>
	   <%/*
	  String name=((String)session.getAttribute("uid")==null)?"":(String)session.getAttribute("uid");  
	  if(name.equals(""))
	  {
		{response.sendRedirect("admin.jsp");}
 	 }*/
	 


	  %>
          <%
	 request.setCharacterEncoding("big5");
     Connection con ;
     PreparedStatement stmt = null;
	 ResultSet rs = null;
%>
        </p>
          <table width="964" border="1">
            <tr>
              <td width="78" bgcolor="#99FF00">���U�ɶ�</td>
              <td width="91" bgcolor="#99FF00">�ϥΪ̱b��</td>
              <td width="53" bgcolor="#99FF00">�K�X</td>
              <td width="74" bgcolor="#99FF00">�m�W</td>
              <td width="51" bgcolor="#99FF00">�ʧO</td>
              <td width="33" bgcolor="#99FF00">�~</td>
              <td width="45" bgcolor="#99FF00">��</td>
              <td width="52" bgcolor="#99FF00">��</td>
              <td width="72" bgcolor="#99FF00">�a�}</td>
              <td width="128" bgcolor="#99FF00">�q�l�H�c</td>
              <td width="99" bgcolor="#99FF00">�q��</td>
              <td width="228" bgcolor="#99FF00">��s�ɶ�</td>
            </tr>
            <%
	try 
        {		
        Class.forName("com.mysql.jdbc.Driver").newInstance();//���J�X�ʵ{�����O
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/account?user=root&useUnicode=true&characterEncoding=big5");
		 stmt=con.prepareStatement("select id, userid, pwd, name, gender, year, month, date, address, email, phone, edit_id from member");
 		 rs = stmt.executeQuery();
	     while(rs.next()) {
		 	out.print("<tr><td>");
			out.print(rs.getString("id"));
				out.print("</td><td>");
			out.print(rs.getString("userid"));
			out.print("</td><td>");
			out.print(rs.getString("pwd"));
		out.print("</td><td>");
			out.print(rs.getString("name"));
		out.print("</td><td>");
			out.print(rs.getString("gender"));
		out.print("</td><td>");
		out.print(rs.getString("year"));
		out.print("</td><td>");
		out.print(rs.getString("month"));
		out.print("</td><td>");
		out.print(rs.getString("date"));
		out.print("</td><td>");
			out.print(rs.getString("address"));
		out.print("</td><td>");
			out.print(rs.getString("email"));
		out.print("</td><td>");
		out.print(rs.getString("phone"));
		out.print("</td><td>");
			out.print(rs.getString("edit_id"));
	out.print("</td></tr>");

		}
		%>
		
		
        </table>
       
	   <% out.print("<br>");	   %>

		<%
	  } catch (Exception ex) {
       ex.printStackTrace();
   	  } finally {
       		if (stmt!=null) stmt.close();
			if (rs!=null) rs.close();
   } 
%></td>
    </tr>
  </table>
  <p>&nbsp;</p>
</form>
</div>
</body>
</html>
