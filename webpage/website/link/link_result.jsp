<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>LINK</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
<!--
body,td,th {
	color: #000000;
}
.style19 {font-size: 36px}
body {
	background-color: #00CC33;
}
.style20 {color: #000000;
	font-size: 14px;
	font-weight: bold;
}
.style18 {font-size: 16px}
.style5 {color: #0000FF}
.style9 {font-size: 24px; font-weight: bold; }

-->
</style>
</head>

<body>


  <!--
<table width="623" border="0" align="center">
  <tr>
    <td width="613"><div align="center"><span class="style18"><a href="signout.jsp" class="style5">登出 </a>|| <a href="all_entry.jsp" class="style5">使用者資料</a> || <a href="search.jsp" class="style5">搜索 </a>|| <a href="add_term.jsp" class="style5">新增名詞</a> || <a href="news/news.jsp" class="style5">相關消息</a> ||<a href="suggestion.jsp" class="style5"> 意見</a> || <a href="forum/forum.jsp" class="style5">討論區</a> ||<a href="message/message.jsp" class="style5"> 留言</a></span></div></td>
  </tr>
 -->
  
</table>
<p align="center"><a href="../all.jsp"><img src="../images/images.jpg" width="50" height="35" border="0"></a><span class="style19"><a href="add_link.jsp"><img src="go-back-icon.png" width="50" height="35" border="0"></a></span></p>
<table width="392" height="21" border="1" align="center">
  <tr>
    <td width="135"><div align="center"><span class="style9"><a href="../vocab/add_term.jsp">VOCAB</a></span></div></td>
    <td width="117"><div align="center" class="style9"><a href="../note/add_note.jsp">NOTE</a></div></td>
    <td width="118" bgcolor="#FFFF00"><div align="center"><span class="style9">LINK</span></div></td>
  </tr>
  <tr bgcolor="#FF0000">
    <td><div align="center"><span class="style9">unvaliable </span></div></td>
    <td><div align="center"><span class="style9">unvaliable</span></div></td>
    <td><div align="center"><span class="style9">unvaliable</span></div></td>
  </tr>
</table>
<hr>
<p align="center" class="style19">LINK RESULT </p>
<form name="form1" method="post" action="">
  <table width="744" border="1" align="center">
    <tr>
      <td width="734"><p>&nbsp;
          </p>
        <p>
          <%
	 request.setCharacterEncoding("big5");
     Connection con ;
     PreparedStatement stmt = null;
	 ResultSet rs = null;
%>
        </p>
        <table width="475" border="1" align="center">
            <tr>
              <td width="51" bgcolor="#99FF00">no</td>
              <td width="64" bgcolor="#99FF00">link</td>
             
            </tr>
            <%	 
			
	try 
        {		
        Class.forName("com.mysql.jdbc.Driver").newInstance();//載入驅動程式類別
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp?user=root&useUnicode=true&characterEncoding=big5");
		 stmt=con.prepareStatement("select id, link from link");
		 rs = stmt.executeQuery();
	
	     while(rs.next()) {
		 	out.print("<tr><td>");
			out.print(rs.getString("id"));
			out.print("</td><td>");
		//	out.print(rs.getString("link"));
		//	out.print("<a href = rs.getString("link")> rs.getString("link") </a>");
		String s=rs.getString("link");
		
		//out.println( "<a href =" + rs.getString("link.jsp") +"> " + rs.getString("link") + "</a>");
//	out.println( "<a href ='s' > s </a>");
// 	
	%>
<a href=link.jsp?link=<%=rs.getString("link")%>><%= rs.getString("link") %></a> 
  
<!--<%= rs.getString("link") %> -->
<%
	out.print("</td></tr>");
}

%>

        </table>
          <p>
              <%
			  
	  } catch (Exception ex) {
       ex.printStackTrace();
   	  } finally {
       		if (stmt!=null) stmt.close();
			if (rs!=null) rs.close();
   } 
%>
          </p>
          <p>&nbsp;          </p></td>
    </tr>
  </table>
  <p>
    <% /* 
	String name=((String)session.getAttribute("uid")==null)?"":(String)session.getAttribute("uid"); 
	if(name.equals("")){
{response.sendRedirect("admin.jsp");}
  } */

 %>
</p>
</form>
</div>
<hr>
<p align="center"><%= new java.util.Date() %></p>
<p align="center" class="style20">&copy; ChenChih _2014 </p>
</body>
</html>
