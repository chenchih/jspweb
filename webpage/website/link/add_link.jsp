<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>LINK</title>
<style type="text/css">
<!--
.style1 {font-size: 24px}
-->
</style>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
<!--
body,td,th {
	color: #000000;
}

.style18 {font-size: 16px}
.style19 {color: #000000}
.style5 {color: #0000FF}
body {
	background-color: #00CC33;
}
.style20 {	color: #000000;
	font-size: 14px;
	font-weight: bold;
}
.style9 {font-size: 24px; font-weight: bold; }
-->
</style>
<script >
function check()
{
if (form1.vocabE.value == "" )
		{ alert("�п�J��r�^�Τ�");	}
			//else if (form1.description.value == "" )
				//{ alert("�п�J����");	}
						else 
								{			
								form1.action= "link_check_add.jsp";					
								form1.submit();
								}
											}
</script>
</head>

<body>

	<!-- end #header     " NOTE 20160728 remove temporary"
	
	<table width="623" border="0" align="center">
      <tr>
        <td width="613"><div align="center"><span class="style18"><a href="signout.jsp" class="style5">�n�X </a>|| <a href="all_entry.jsp" class="style5">�ϥΪ̸��</a> || <a href="search.jsp" class="style5">�j�� </a>|| <a href="add_term.jsp" class="style5">�s�W�W��</a> || <a href="news/news.jsp" class="style5">��������</a> ||<a href="suggestion.jsp" class="style5"> �N��</a> || <a href="forum/forum.jsp" class="style5">�Q�װ�</a> ||<a href="message/message.jsp" class="style5"> �d��</a></span></div></td>
      </tr>
    </table>
	
	-->
	<p align="center"><a href="../all.jsp"><img src="../images/images.jpg" width="50" height="35" border="0"></a></p>
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
    <p>&nbsp;</p>
	<form name="form1" method="post" action="">
	
	
	
	
  <% 
  /*String name=((String)session.getAttribute("uid")==null)?"":(String)session.getAttribute("uid");  if(name.equals("")){

{response.sendRedirect("admin.jsp");}
  }
*/
 %>
  <table width="500" border="1" align="center">
    <tr>
      <td colspan="2"><div align="center" class="style1 style3">�s�Wlinkpage</div></td>
    </tr>
    <tr>
      <td width="150"><span class="style19">Link</span></td>
      <td width="314"><input name="vocabE" type="text" id="vocabE"></td>

    
    <tr>
      <td colspan="2"><div align="center">
          <input type="button" name="button2" value="�e�X" onClick="check()">      
          <input type="reset" name="Submit" value="���]">
          <a href="link_result.jsp" class="style5">�Ҧ�link</a> 
&nbsp;&nbsp;&nbsp;      </div></td>
    </tr>
  </table>
  <p>&nbsp;</p>
  </div>
</form>
<hr>
<p align="center"><%= new java.util.Date() %></p>
<p align="center" class="style20">&copy; ChenChih _2014 </p>
</body>
</html>
