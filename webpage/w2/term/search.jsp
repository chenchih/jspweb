<HTML>
<HEAD>
<meta http-equiv="content-type" content="text/html;charset=big5">
<TITLE>Ajax Examples -- Search List (MySQL)</TITLE>
<script type = "text/javascript">
<!--
var strUrl = "search_sql.jsp?term=";
var xmlhttp;
var selectedRow = -1; //===== 紀錄 divResults的table目前是哪一筆
var term; //===== 紀錄 search的最後輸入內容
var tblTable; //===== 紀錄 divResults的table物件

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
	selectedRow = -1; //===== 清除紀錄
	delete tblTable; //===== 清除紀錄
	tblTable = null; //===== 清除紀錄
	var findDiv = document.getElementById("divResults");
	var counter = findDiv.childNodes.length;
	for (var i = counter - 1; i >= 0; i--) {
		findDiv.removeChild(findDiv.childNodes[i]);
	}
}
function getNames(event) { //==================================== 傳入 event
	event = (event) ? event: window.event; //===== 取得正確Browser物件
	input = (event.target) ? event.target : event.srcElement; //===== 取得正確Browser物件
	if (tblTable != null) { //===== tblTable 存在才處理按鍵
		if (event.keyCode == 38) { //===== 處理向上鍵
			if (selectedRow >= 0) {
				tblTable.rows[selectedRow].cells[0].className = "mouseOut";
				selectedRow--;
				if (selectedRow >= 0) {
					tblTable.rows[selectedRow].cells[0].className = "mouseOver";
					input.value = tblTable.rows[selectedRow].cells[0].firstChild.nodeValue;
				} else { //===== 超出tblTable
					input.value = term; //===== 回復原來輸入值
				}
			} else {
				term = input.value;
				selectedRow = tblTable.rows.length - 1;
				tblTable.rows[selectedRow].cells[0].className = "mouseOver";
				input.value = tblTable.rows[selectedRow].cells[0].firstChild.nodeValue;
			}
			return;
		} else if (event.keyCode == 40) { //===== 處理向下鍵
			if (selectedRow < 0) {
				term = input.value; //===== 回復原來輸入值
				selectedRow++;
				tblTable.rows[selectedRow].cells[0].className = "mouseOver";
				input.value = tblTable.rows[selectedRow].cells[0].firstChild.nodeValue;		
			} else {
				tblTable.rows[selectedRow].cells[0].className = "mouseOut";
				selectedRow++;
				if (selectedRow < tblTable.rows.length) {
					tblTable.rows[selectedRow].cells[0].className = "mouseOver";
					input.value = tblTable.rows[selectedRow].cells[0].firstChild.nodeValue;
				} else { //===== 超出tblTable
					selectedRow = -1;
					input.value = term;
				}
			}
			return;
		}
	}
	if (event.keyCode < 41 && event.keyCode != 8 && event.keyCode != 46) { //===== 除了Backspace及Delete,不處理控制鍵
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
/* ===== 這個寫法在 IE 和 Firefox(Mozila) 都可, 您的在火狐會出錯
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
			tblTable = document.createElement("table"); //===== 新table物件紀錄在global變數
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
	  		tblCell.onmouseover = function() {setCellOver(this);}; //===== 處理 onmouseover
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

function setCellOver(tblCell) { //===== 處理 onmouseover
	if (selectedRow >= 0) {
		tblTable.rows[selectedRow].cells[0].className = "mouseOut";
	}
	tblCell.className = "mouseOver";
	selectedRow = tblCell.parentNode.rowIndex;
}
function processOnSubmit() { //===== 處理 FORM submit (按下 Return鍵時)
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
    xmlhttp.open("POST", url, true);  // 非同步傳輸 + POST
    xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xmlhttp.send(qs);  //查詢字串
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
    strMsg = "<hr><p align=center> <font color=blue> 搜查的資料：</p> </font> <p>" +
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

<form name="aForm" onsubmit="return processOnSubmit()"><div><!-- 處理 FORM submit -->
  <table width="200" border="1" align="center">
    <tr>
      <td><div align="center">名詞搜尋</div></td>
    </tr>
    <tr>
      <td><div id="div">
        <input name="search" type="text" id="search" onkeyup="getNames(event)" autocomplete="off"><!-- getNames改送出參數 -->
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
