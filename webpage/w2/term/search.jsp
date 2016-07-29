<HTML>
<HEAD>
<meta http-equiv="content-type" content="text/html;charset=big5">
<TITLE>Ajax Examples -- Search List (MySQL)</TITLE>
<script type = "text/javascript">
<!--
var strUrl = "search_sql.jsp?term=";
var xmlhttp;
var selectedRow = -1; //===== ���� divResults��table�ثe�O���@��
var term; //===== ���� search���̫��J���e
var tblTable; //===== ���� divResults��table����

function showDiv(divId) {
  if (document.layers)
		document.layers[divId].visibility = "show";
  else
    document.getElementById(divId).style.visibility = "visible";
}
function hideDiv(divId) {
  if (document.layers)
		document.layers[divId].visibility = "hide";
  else
  	document.getElementById(divId).style.visibility = "hidden";
}
function loadBody() {
	hideDiv("divResults");
	document.aForm.search.focus();
}
function clearResults() { //===================================
	selectedRow = -1; //===== �M������
	delete tblTable; //===== �M������
	tblTable = null; //===== �M������
	var findDiv = document.getElementById("divResults");
	var counter = findDiv.childNodes.length;
	for (var i = counter - 1; i >= 0; i--) {
		findDiv.removeChild(findDiv.childNodes[i]);
	}
}
function getNames(event) { //==================================== �ǤJ event
	event = (event) ? event: window.event; //===== ���o���TBrowser����
	input = (event.target) ? event.target : event.srcElement; //===== ���o���TBrowser����
	if (tblTable != null) { //===== tblTable �s�b�~�B�z����
		if (event.keyCode == 38) { //===== �B�z�V�W��
			if (selectedRow >= 0) {
				tblTable.rows[selectedRow].cells[0].className = "mouseOut";
				selectedRow--;
				if (selectedRow >= 0) {
					tblTable.rows[selectedRow].cells[0].className = "mouseOver";
					input.value = tblTable.rows[selectedRow].cells[0].firstChild.nodeValue;
				} else { //===== �W�XtblTable
					input.value = term; //===== �^�_��ӿ�J��
				}
			} else {
				term = input.value;
				selectedRow = tblTable.rows.length - 1;
				tblTable.rows[selectedRow].cells[0].className = "mouseOver";
				input.value = tblTable.rows[selectedRow].cells[0].firstChild.nodeValue;
			}
			return;
		} else if (event.keyCode == 40) { //===== �B�z�V�U��
			if (selectedRow < 0) {
				term = input.value; //===== �^�_��ӿ�J��
				selectedRow++;
				tblTable.rows[selectedRow].cells[0].className = "mouseOver";
				input.value = tblTable.rows[selectedRow].cells[0].firstChild.nodeValue;		
			} else {
				tblTable.rows[selectedRow].cells[0].className = "mouseOut";
				selectedRow++;
				if (selectedRow < tblTable.rows.length) {
					tblTable.rows[selectedRow].cells[0].className = "mouseOver";
					input.value = tblTable.rows[selectedRow].cells[0].firstChild.nodeValue;
				} else { //===== �W�XtblTable
					selectedRow = -1;
					input.value = term;
				}
			}
			return;
		}
	}
	if (event.keyCode < 41 && event.keyCode != 8 && event.keyCode != 46) { //===== ���FBackspace��Delete,���B�z������
		return;
	}
	term = input.value;
  if (term.length > 0) {
		var url = strUrl + term;
  	xmlhttp = createXMLHttp();
	  if (xmlhttp) {
	    xmlhttp.onreadystatechange = showResult;
	    xmlhttp.open("GET", url, true);
	    xmlhttp.send("");
	  }
	} else {
		// clear div if empty
		clearResults();
		hideDiv("divResults");
	}
}
function createXMLHttp() {
/* ===== �o�Ӽg�k�b IE �M Firefox(Mozila) ���i, �z���b�����|�X��
	if (window.XMLHttpRequest) {
		return new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		return new ActiveXObject("Microsoft.XMLHTTP");
	} else {
		return null;
	}
*/
  try {
    return new ActiveXObject("Microsoft.XMLHTTP");
  } catch (e) {
    try {
      return new XMLHttpRequest();
    } catch (e) {
      return null;
    }
  } 
  return null;
}
function replaceInput(tblCell) {
  var inputName = document.getElementById("search");
  inputName.value = tblCell.firstChild.nodeValue;
	clearResults();
	hideDiv("divResults");
}

function showResult() {
  if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
  	var msg1 = xmlhttp.responseText;

  	//alert(msg1.length + ": " + msg1);

  	//--- length = 8 even empty --- //
  	if (msg1.length > 8) {
			showDiv("divResults");
			clearResults();
			//--- create table ---
			var findDiv = document.getElementById("divResults");
			tblTable = document.createElement("table"); //===== �stable��������bglobal�ܼ�
			var tblBody = document.createElement("tbody");
			var tblRow, tblCell, tblNode;
			//---
			  		
	  	eval("var objResults = " + msg1);
	  	//var msg = "";
		//----------------------------------------------------------
	  	for (var i = 0; i < objResults.Results.books.length; i++) {
	  		var currentItem = objResults.Results.books[i].term_eng;
	  		tblRow = document.createElement("tr");
	  		tblCell = document.createElement("td");
	  		//tblCell.onmouseover = function() {this.className = 'mouseOver';};
	  		//tblCell.onmouseout = function() {this.className = 'mouseOut';};
	  		tblCell.onmouseover = function() {setCellOver(this);}; //===== �B�z onmouseover
	  		tblCell.setAttribute("border", "0");
	  		tblCell.onclick = function() {replaceInput(this); sendRequest();};
	  		
	  		tblNode = document.createTextNode(currentItem);
	  		tblCell.appendChild(tblNode);
	  		tblRow.appendChild(tblCell);
	  		tblBody.appendChild(tblRow);
	  	}
	  	//alert(msg);
	
	  	tblTable.appendChild(tblBody);
	    findDiv.appendChild(tblTable);
		} else {
			clearResults();
			hideDiv("divResults");
		}
	}
	//http://www.pt.ntu.edu.tw/hmchai/PTcomputer03_2/hCSS/CSSadvanced.htm
}

function setCellOver(tblCell) { //===== �B�z onmouseover
	if (selectedRow >= 0) {
		tblTable.rows[selectedRow].cells[0].className = "mouseOut";
	}
	tblCell.className = "mouseOver";
	selectedRow = tblCell.parentNode.rowIndex;
}
function processOnSubmit() { //===== �B�z FORM submit (���U Return���)
	clearResults();
	hideDiv("divResults");
	sendRequest();
	return false;
}
// -->
//--------------------asychronization--------------------------
</script> 
<script>
<!--
function sendRequest() { 
  var url, qs;
  var search;
  xmlhttp = createXMLHttp();
  if (xmlhttp) {
    search = aForm.search.value;

    url = "term_check.jsp";
    qs = "search=" + search;
    //alert("url = " + url);
    xmlhttp.onreadystatechange = showMsg;
    xmlhttp.open("POST", url, true);  // �D�P�B�ǿ� + POST
    xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xmlhttp.send(qs);  //�d�ߦr��
  }
}
/*
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
} */
function showMsg() {
  var strMsg;
  if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
    strMsg = "<hr><p align=center> <font color=blue> �j�d����ơG</p> </font> <p>" +
        xmlhttp.responseText;
    document.getElementById("disp").innerHTML = strMsg;
  }
}





// -->
</script>
<style type="text/css">
	.mouseOut {
		background: #ccccff; color: #000000;
		width:500px; cursor:default;
	}
	.mouseOver {
		background: #fffafa; color: #000000;
		width:500px; cursor:hand;
	}
	.hide {
		display:none;
	}
	.show {
		display:block;
		width:170px;
	}
#divResults {		background-color:#ccccff;
}
</style>
</HEAD>
<BODY onLoad="loadBody();">
<P>

<form name="aForm" onsubmit="return processOnSubmit()"><div><!-- �B�z FORM submit -->
  <table width="200" border="1" align="center">
    <tr>
      <td><div align="center">�W���j�M</div></td>
    </tr>
    <tr>
      <td><div id="div">
        <input name="search" type="text" id="search" onkeyup="getNames(event)" autocomplete="off"><!-- getNames��e�X�Ѽ� -->
        <div id="divResults"></div>
      </div></td>
    </tr>
    <tr>
      <td><div align="center">
        <input name="button2" type="submit" onClick="sendRequest()" value="Submit">
        <label>
        <input type="reset" name="Submit" value="Reset">
        </label>
      </div></td>
    </tr>
  </table>
<div id="disp"> </div>
</form>

<form method=get action="http://www.google.com/search"  target="_blank">
</form>
<hr>

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<!-- Search Google -->
<center>
</center>
<!-- Search Google -->

</BODY>
</HTML>
