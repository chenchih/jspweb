<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*,java.util.*,java.text.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=big5">

<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
<!--
.style2 {color: #0000FF}
.style3 {color: #0000FF; font-weight: bold; }
.style17 {font-family: "細明體";
	font-size: 16px;
}
body,td,th {
	color: #000000;
}
a:hover {
	color: #FF0000;
}
body {
	background-color: #00CC33;
}
.style20 {font-size: 36px}
.style9 {font-size: 24px; font-weight: bold; }
.style21 {color: #000000;
	font-size: 14px;
	font-weight: bold;
}

-->
</style>
</head>
 <script>

function delete1 () {
	
			form1.action="delete_ck.jsp";
			form1.submit();
		}
		
function edit() {
	
			form1.action="edit_ck.jsp";
			form1.submit();
		}
</script>
<%! 
   public String getRecordID(){
       SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss",Locale.US);
       java.util.Date currentDate = new java.util.Date();
       return formatter.format(currentDate);
   }
%>
<body>
<div id="wrapper">
	<div id="header">
	  <p>
	    <!-- end #search -->
</p>
	  <p>&nbsp;      </p>
  </div>
	<!-- end #header -->
	<table width="683" height="28" border="0" align="center">
      <tr>
        <td width="437"><div align="right">
      
          <span class="style17">||</span> <span class="style17"><a href="bulletin_news.jsp" class="style2">相關消息</a> || <a href="lesson.jsp" class="style2">課程</a> || <a href="forum.jsp" class="style2">討論區</a> ||<a href="message.jsp" class="style2">留言</a> || <a href="linkpage.jsp" class="style2">連結</a></span></div></td>
      </tr>
    </table>
	</p>
<p>
	  <%	 
	  	String no= request.getParameter("id");
	//String no = (String)session.setAttribute("no");
	 session.setAttribute("no",no);

	 Connection con ;
     PreparedStatement stmt = null;
     ResultSet rs = null;
%>
</p>
  <p align="center"><a href="../all.jsp"><img src="../images/images.jpg" width="50" height="35" border="0"></a><span class="style20"><a href="add_note.jsp"><img src="../images/go-back-icon.png" width="50" height="35" border="0"></a></span></p>
  <table width="392" height="21" border="1" align="center">
    <tr>
      <td width="135"><div align="center"><span class="style9"><a href="../vocab/add_term.jsp">VOCAB</a></span></div></td>
      <td width="117" bgcolor="#FFFF00"><div align="center" class="style9">NOTE</div></td>
      <td width="118"><div align="center"><span class="style9"><a href="link/add_link.jsp" class="style2">LINK</a><a href="add_delete.jsp"></a></span></div></td>
    </tr>
    <tr bgcolor="#FF0000">
      <td><div align="center"><span class="style9">unvaliable </span></div></td>
      <td><div align="center"><span class="style9">unvaliable</span></div></td>
      <td><div align="center"><span class="style9">unvaliable</span></div></td>
    </tr>
  </table>
  <hr>
  <p>&nbsp;  </p>
  </p>
	<table width="300" align="center">
      <tr>
        <td>
		
		<form name="form1" method="post" action="">
		 <fieldset>
            <legend><font color="#0000FF">會員資料修改</font></legend>
              <p>
                <% 
	  try {
   	   Class.forName("com.mysql.jdbc.Driver").newInstance();//載入驅動程式類別
	   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp?user=root&useUnicode=true&characterEncoding=big5");

       stmt = con.prepareStatement("select * from note where id=?");
       stmt.setString(1,no);
       rs = stmt.executeQuery();
	   
	  
	    if (rs.next()) {
%>
			  Time add：<font color="red"> <%= rs.getString("no")%></font><br>
              no：<font color="#800000"> <%= rs.getString("id")%></font><br>
			  type：
              <%= rs.getString("type")%><br>
              subject：
              <input name="subject" type="text" id="subject" value="<%= rs.getString("subject")%>">
          </p>
              <p>              note： 
                <textarea name="note" id="note"><%= rs.getString("note")%></textarea>              
                <br>
                <input name="edit_hidden" type="hidden" id="edit_hidden" value="<%=getRecordID()%>">	            
                <input name="type"  type="hidden" value="<%= rs.getString("type")%>">
          </p>
              <p> </p>
	            <center>		   <input type="button" name="submit2" value="修改" onClick="edit()" >
  <input type="button" name="submit2" value="刪除" onClick="delete1()" >
			
			   </font><font size="3">
          </fieldset>
			 
 	
         <%   		
	   }
	} catch (Exception ex) {
       	ex.printStackTrace();
   	} finally {
       	if (stmt!=null) stmt.close();
   } 
%>

             
	

            </center>
        </form></td>
      </tr>
    </table>
    <p>&nbsp;</p>
    <hr>
    <p align="center"><FONT COLOR="red"><%= new java.util.Date() %></FONT></p>
    <p align="center"><span class="style21">&copy; ChenChih _2014 </span></p>
    <p>&nbsp;</p>
</div>
</body>
</body>
</html>
