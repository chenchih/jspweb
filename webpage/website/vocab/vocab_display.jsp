<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language="javascript">
function editRecord(no){
    var f=document.form1;
	//alert (no);
	f.action='edit_delete.jsp?id='+no;
    f.submit();
}
function deleteRecord(id){
    var f=document.form;
    f.action='delete.jsp?id='+id;
    f.submit();
}
function show(str){
var f=document.form1;
var s=str;
alert (str);
f.action="http://www.google.com";
f.submit();



}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>vocab</title>
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
.style20 {font-size: 36px}
.style19 {	color: #000000;
	font-size: 36px;
}
body {
	background-color: #00CC33;
}
.style21 {color: #000000;
	font-size: 14px;
	font-weight: bold;
}
-->
</style>
</head>

<body>


    <table width="623" border="0" align="center">
      <tr>
        <td width="613"><div align="center"><span class="style18"><a href="signout.jsp">登出</a> || <a href="all_entry.jsp">使用者資料</a> || <a href="search.jsp">搜索</a> || <a href="add_term.jsp">新增名詞</a> || <a href="news/news.jsp">相關消息</a> || <a href="suggestion.jsp">意見</a> || <a href="forum/forum.jsp">討論區</a> || <a href="message/message.jsp">留言</a></span></div></td>
      </tr>
    </table>
    <p align="center">&nbsp;</p>
<p align="center"><a href="../all.jsp"><img src="../images/images.jpg" width="50" height="35" border="0"></a><span class="style20"><a href="add_term.jsp"><img src="../images/go-back-icon.png" width="50" height="35" border="0"></a></span></p>
<table width="392" height="21" border="1" align="center">
  <tr>
    <td width="135" bgcolor="#FFFF00"><div align="center"><span class="style9">VOCAB</span></div></td>
    <td width="117"><div align="center" class="style9"><a href="../note/add_note.jsp">NOTE</a></div></td>
    <td width="118"><div align="center"><span class="style9"><a href="../link/add_link.jsp">LINK</a></span></div></td>
  </tr>
  <tr bgcolor="#FF0000">
    <td><div align="center"><span class="style9">unvaliable </span></div></td>
    <td><div align="center"><span class="style9">unvaliable</span></div></td>
    <td><div align="center"><span class="style9">unvaliable</span></div></td>
  </tr>
</table>
<p>&nbsp;</p>
<hr>
<p align="center"><span class="style19">VOCAB RESULT</span></p>
<form name="form1" method="post" action="">
  <table width="744" border="1" align="center">
    <tr>
      <td width="734"><p>
          <%
	 request.setCharacterEncoding("big5");
     Connection con ;
     PreparedStatement stmt = null;
	 ResultSet rs = null;
%>
        </p>
          <table width="606" height="29" border="1" align="center">
            <tr>
              <td width="115" bgcolor="#99FF00">id</td>
              <td width="37" bgcolor="#99FF00">no</td>
              <td width="93" bgcolor="#99FF00">english</td>
              <td width="54" bgcolor="#99FF00">chinese</td>
			    <td width="53" bgcolor="#99FF00">type</td>
				   <td width="53" bgcolor="#99FF00">note</td>
              <td width="85" bgcolor="#99FF00">edi_timet</td>
              <td width="85" bgcolor="#99FF00">edit</td>
            </tr>

            <%
	try 
        {		
        Class.forName("com.mysql.jdbc.Driver").newInstance();//載入驅動程式類別
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp?user=root&useUnicode=true&characterEncoding=big5");
		 stmt=con.prepareStatement("select id, no, term_eng, term_chi, type, note, edt_time from vocab");
		 rs = stmt.executeQuery();
	     while(rs.next()) {
				  int test = rs.getInt("no");
		 	out.print("<tr><td>");
			out.print(rs.getString("id"));
			out.print("</td><td>");
			out.print(rs.getString("no"));
				out.print("</td><td>");
			out.print(rs.getString("term_eng"));
			out.print("</td><td>");
			out.print(rs.getString("term_chi"));
		out.print("</td><td>");
			out.print(rs.getString("type"));
		out.print("</td><td>");
		out.print(rs.getString("note"));
		out.print("</td><td>");
			out.print(rs.getString("edt_time"));
			out.print("</td><td>");
			//out.println("<input type='button' name='edit' value='Edit' onclick='editRecord(rs.getString('no'))'>");
					
			//out.println("<input type='button' name='edit' value='Edit' onclick='editRecord(\""+test+"\");'>");				
			//out.println("<input type='button' name='edit' value='Edit' onclick='editRecord(\""+rs.getInt("1")+"\");'>");												
			out.println("<input type='button' value='edit'  onclick='editRecord(\""+rs.getString("no")+"\");'>"); 
			//out.print(test);
			
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
    <%
	 /* String name=((String)session.getAttribute("uid")==null)?"":(String)session.getAttribute("uid");  if(name.equals(""))
	  {
		{response.sendRedirect("admin.jsp");}
 	 }
*/

	  %>
  </p>
</form>
</div>
<hr>
<FONT COLOR="red">
<p align="center"><%= new java.util.Date() %></p>
</FONT>
</body>
</html>
