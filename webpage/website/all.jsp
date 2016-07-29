<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>無標題文件</title>
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
	background-color: #00CC33;
}
.style19 {color: #FF0000}
.style20 {
	color: #000000;
	font-size: 14px;
	font-weight: bold;
}
.style22 {font-size: 14px}
-->
</style>
</head>
<body>


    <table width="623" border="0" align="center">
      <tr>
        <td width="613"><div align="center"><span class="style18"><a href="signout.jsp" class="style5">登出 </a>|| <a href="all_entry.jsp" class="style5">使用者資料</a> || <a href="search.jsp" class="style5">搜索 </a>|| <a href="add_term.jsp" class="style5">新增名詞</a> || <a href="news/news.jsp" class="style5">相關消息</a> ||<a href="suggestion.jsp" class="style5"> 意見</a> || <a href="forum/forum.jsp" class="style5">討論區</a> ||<a href="message/message.jsp" class="style5"> 留言</a></span></div></td>
      </tr>
    </table>
    <p><a href="part_entry.jsp"></a></p>
    <table width="392" height="21" border="1" align="center">
      <tr>
        <td width="135"><div align="center"><span class="style9"><a href="vocab/add_term.jsp">VOCAB</a></span></div></td>
        <td width="117"><div align="center" class="style9"><a href="note/add_note.jsp">NOTE</a></div></td>
        <td width="118"><div align="center"><span class="style9"><a href="link/add_link.jsp" class="style5">LINK</a><a href="add_delete.jsp"></a></span></div></td>
      </tr>
      <tr bgcolor="#FF0000">
        <td><div align="center"><span class="style9">unvaliable </span></div></td>
        <td><div align="center"><span class="style9">unvaliable</span></div></td>
        <td><div align="center"><span class="style9">unvaliable</span></div></td>
      </tr>
    </table>
    <hr>
<form name="form1" method="post" action="">
      <p align="center">
        <textarea name="textfield" cols="50" rows="10" wrap="PHYSICAL" class="style9">              UPDATE NEWS:
THIS SITE IS STILL UNDER CONSTRUCTION 
-----------------------------------------------
Will update new function as below:

UPDATE: lINK PAGE+FUNCTION        
UPDATE: VOCAB PAGE+FUNCTION
UPDATE: NOTE PAGE+FUNCTION</textarea>
</p>
</form>
</div>
<hr>
<div align="center" class="style19">
  <p><%= new java.util.Date() %></p>
  <p class="style20">&copy; ChenChih _2014
    </p>
</div>
</body>
</html>
