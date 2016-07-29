<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>VOCAB</title>
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
.style9 {font-size: 24px; font-weight: bold; }
.style20 {color: #000000;
	font-size: 14px;
	font-weight: bold;
}
-->
</style>
<script >
function check()
{
if ((form1.vocabE.value == "" )||(form1.vocabC.value == "" ))
		{ alert("請輸入單字英或中");	}
		//else if  (form1.vocabC.value == "" )
		//{ alert("請輸入單字中");	}
			//else if (form1.description.value == "" )
				//{ alert("請輸入解釋");	}
				else if (form1.type.value == "NA" )
				{ alert("請選類型");	}
						else 
								{			
								form1.action= "vocab_check_add.jsp";					
								form1.submit();
								}
											}
</script>
</head>

<body>

	<!-- end #header -->
	<table width="623" border="0" align="center">
      <tr>
        <td width="613"><div align="center"><span class="style18"><a href="add_term.jsp" class="style5">add vocab </a>|| <a href="all_entry.jsp" class="style5">使用者資料</a> </span></div></td>
      </tr>
    </table>
	<p align="center"><a href="../all.jsp"><img src="../images/images.jpg" width="50" height="35" border="0"></a></p>
    <table width="392" height="21" border="1" align="center">
      <tr>
        <td width="135" bgcolor="#FFFF00"><div align="center"><span class="style9">VOCAB</span></div></td>
        <td width="117"><div align="center" class="style9"><a href="../note/add_note.jsp">NOTE</a></div></td>
        <td width="118"><div align="center"><span class="style9"><a href="../link/add_link.jsp" class="style5">LINK</a><a href="add_delete.jsp"></a></span></div></td>
      </tr>
      <tr bgcolor="#FF0000">
        <td><div align="center"><span class="style9">unvaliable </span></div></td>
        <td><div align="center"><span class="style9">unvaliable</span></div></td>
        <td><div align="center"><span class="style9">unvaliable</span></div></td>
      </tr>
    </table>
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
      <td colspan="2"><div align="center" class="style1 style3">新增單字(vocabulary)</div></td>
    </tr>
    <tr>
      <td width="150"><span class="style19">英文(eng vocab)</span></td>
      <td width="314"><input name="vocabE" type="text" id="vocabE"></td>
    </tr>
    <tr>
      <td><span class="style19">中文 </span></td>
      <td><input name="vocabC" type="text" id="vocabC"></td>
    </tr>
	  <tr>
	     <td><span class="style19">type </span></td>
		 <td>
    <label>
              <select name="type" id="type">
                <option value="NA" selected>選擇</option>
                <option value="busienss">business</option>
                <option value="poltical">poltical</option>
                <option value="daily">daily</option>
              </select>
</label>
	    </td>
    </tr>
    <tr>
      <td><span class="style19">note</span></td>
      <td><textarea name="note" cols="35" rows="10" id="note">reference: 
	  </textarea></td>
    </tr>
    <tr>
      <td colspan="2"><div align="center">
          <input type="button" name="button2" value="送出" onClick="check()">      
          <input type="reset" name="Submit" value="重設">
          <a href="vocab_display.jsp" class="style5">所有名詞</a>		<a href="../search.jsp">  </a>
          <a href="term.jsp"><img src="../images/search.png" width="15" height="20" border="0"></a> </div></td>
		  
    </tr>
  </table>
  <p>&nbsp;</p>
  </div>
  <hr>
  <p align="center"><%= new java.util.Date() %></p>
  <p align="center" class="style20">&copy; ChenChih _2014 </p>
</form>

    <p>&nbsp;</p>
</body>
</html>
