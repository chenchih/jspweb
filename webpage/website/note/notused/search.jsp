<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�L���D���</title>
<script type = "text/javascript">
<!--
function sendRequest() {
  var url, qs;
  var search_ty, search;
  xmlhttp = createXMLHttp();
  if (xmlhttp) {
    search_ty = form2.searchtype.value;
    search = form2.search.value;
    url = "fcheck.jsp";
    qs = "searchtype=" + search_ty + "&search=" + search;
    //alert("url = " + url);
    xmlhttp.onreadystatechange = showMsg;
    xmlhttp.open("POST", url, true);  // �D�P�B�ǿ� + POST
    xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xmlhttp.send(qs);  //�d�ߦr��
  }
}
function sendRequest1() {
  var url, qs;
  var data;
 re1=/^[1-9]{1,}$/;
 var dd = document.getElementById("total").value;
  xmlhttp = createXMLHttp();
  if(!re1.test(dd))
  {alert("���~ �п�J�Ʀr(1-9)"); }
  
  else if (xmlhttp) {
    data = form2.total.value;
    
    url = "search_check.jsp";
    qs = "total=" + data;
    //alert("url = " + url);
    xmlhttp.onreadystatechange = showMsg1;
    xmlhttp.open("POST", url, true);  // �D�P�B�ǿ� + POST
    xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xmlhttp.send(qs);  //�d�ߦr��
  }
  
}
function createXMLHttp() {
  var xhr;
  try {
    xhr = new ActiveXObject("Msxml2.XMLHTTP");
  } catch (e) {
    try {
      xhr = new ActiveXObject("Microsoft.XMLHTTP");
    } catch (e1) {
      try {
        xhr = new XMLHttpRequest();
      } catch (e2) {
        xhr = null;
      }
    }
  }
  return xhr;
}
function showMsg() {
  var strMsg;
  if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
    strMsg = "<hr><p align=center> <font color=blue> �j�d���|����C�G</p> </font> <p>" +
        xmlhttp.responseText;
    document.getElementById("disp").innerHTML = strMsg;
  }
}
function showMsg1() {
  var strMsg;
  if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
    strMsg = "<hr> <p align=center> <font color=blue> �s���U�|����C�G</p> </font> <p>" +
        xmlhttp.responseText;
    document.getElementById("disp").innerHTML = strMsg;
  }
}
// -->
</script>
<style type="text/css">
<!--
.style1 {
	font-size: 18px;
	font-weight: bold;
	color: #FF0000;
}
.style2 {font-size: 14px}
-->
</style>
<style type="text/css">
<!--
.style1 {color: #333399}
.style18 {font-size: 16px}
a:hover {
	color: #FF0000;
}

-->
</style>
</head>

<body>

	<!-- end #header -->
    <table width="623" border="0" align="center">
      <tr>
        <td width="613"><div align="center"><span class="style18"><a href="signout.jsp">�n�X</a> || <a href="all_entry.jsp">�ϥΪ̸��</a> || <a href="search.jsp">�j��</a> || <a href="add_term.jsp">�s�W�W��</a> || <a href="news/news.jsp">��������</a> || <a href="suggestion.jsp">�N��</a> || <a href="forum/forum.jsp">�Q�װ�</a> || <a href="message/message.jsp">�d��</a></span></div></td>
      </tr>
    </table>
<p align="center" class="style1">&nbsp;</p>
<p align="center" class="style1">�j�M�ϥΪ̸��</p>
<hr>
<form id="form2">

  <table width="550" border="1" align="center">
    <tr>
      <th colspan="2" scope="row"><span class="style2">�|���j�M</span></th>
    </tr>
    <tr>
      <td scope="row"><div align="left"><span class="style2">�j�M</span>
              <label>
              <select name="searchtype" id="searchtype">
                <option value="0" selected>���</option>
                <option value="1">userid</option>
                <option value="2">name</option>
                <option value="3">email</option>
              </select>
              </label>
              <input name="search" type="text" id="search" />
      </div></td>
      <td><div align="center">
          <input name="button" type="button" onClick="sendRequest()" value="�d��">
      </div></td>
    </tr>
    <tr>
      <td scope="row"><div align="left"><span class="style2">�̪�</span>
              <label>
              <input name="total" type="text" id="total" size="10">
              </label>
              <span class="style2"> ���s���U�|��</span></div>
          <label></label>
      </td>
      <td><div align="center">
          <input name="button2" type="button" onClick="sendRequest1()" value="�d��">
      </div></td>
    </tr>
  </table>
  <p class="style2"><span class="style2"><label>    </label></span></p>
<div id="disp"> </div>


</form>
</body> </html>
