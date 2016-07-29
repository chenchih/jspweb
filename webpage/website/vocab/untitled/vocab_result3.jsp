

<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.sql.PreparedStatement"  %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

<%!

public int nullIntconv(String str)
{   
    int conv=0;
    if(str==null)
    {
        str="0";
    }
    else if((str.trim()).equals("null"))
    {
        str="0";
    }
    else if(str.equals(""))
    {
        str="0";
    }
    try{
        conv=Integer.parseInt(str);
    }
    catch(Exception e)
    {
    }
    return conv;
}
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>無標題文件</title>
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
.style20 {font-size: 36px}
-->
</style>

   <p align="center">&nbsp;</p>


<table width="623" border="0" align="center">
  <tr>
    <td width="613"><div align="center"><span class="style18"><a href="add_term.jsp" class="style5">add vocab </a>|| <a href="all_entry.jsp" class="style5">使用者資料</a> </span></div></td>
  </tr>
</table>
<p align="center"><a href="../all.jsp"><img src="../images.jpg" width="50" height="35" border="0"></a></p>
<table width="392" height="21" border="1" align="center">
  <tr>
    <td width="135"><div align="center"><span class="style9">VOCAB</span></div></td>
    <td width="117"><div align="center" class="style9">NOTE</div></td>
    <td width="118" bgcolor="#FFFF00"><div align="center"><span class="style9"><a href="link/add_link.jsp" class="style5">LINK</a><a href="add_delete.jsp"></a></span></div></td>
  </tr>
  <tr bgcolor="#FF0000">
    <td><div align="center"><span class="style9">unvaliable </span></div></td>
    <td><div align="center"><span class="style9">unvaliable</span></div></td>
    <td><div align="center"><span class="style9">unvaliable</span></div></td>
  </tr>
</table>
<p>&nbsp;</p>
<p align="center" class="style20">VOCAB RESULT

<hr>
<form name="form1" method="post" action="">
  <table width="744" border="1" align="center">
    <tr>
      <td width="734"><p>
<%
 request.setCharacterEncoding("big5");
    Connection conn = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
   conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp?user=root&useUnicode=true&characterEncoding=big5");
    ResultSet rsPagination = null;
    ResultSet rsRowCnt = null;
    
    PreparedStatement psPagination=null;
    PreparedStatement psRowCnt=null;
    
    int iShowRows=5;  // Number of records show on per page
    int iTotalSearchRecords=10;  // Number of pages index shown
    
    int iTotalRows=nullIntconv(request.getParameter("iTotalRows"));
    int iTotalPages=nullIntconv(request.getParameter("iTotalPages"));
    int iPageNo=nullIntconv(request.getParameter("iPageNo"));
    int cPageNo=nullIntconv(request.getParameter("cPageNo"));
    
    int iStartResultNo=0;
    int iEndResultNo=0;
    
    if(iPageNo==0)
    {
        iPageNo=0;
    }
    else{
        iPageNo=Math.abs((iPageNo-1)*iShowRows);
    }
    

    
  //String sqlPagination="SELECT SQL_CALC_FOUND_ROWS * FROM tableName limit "+iPageNo+","+iShowRows+"";
String sqlPagination="SELECT SQL_CALC_FOUND_ROWS * FROM vocab limit "+iPageNo+","+iShowRows+"";
    psPagination=conn.prepareStatement(sqlPagination);
    rsPagination=psPagination.executeQuery();
    
    //// this will count total number of rows
     String sqlRowCnt="SELECT FOUND_ROWS() as cnt";
     psRowCnt=conn.prepareStatement(sqlRowCnt);
     rsRowCnt=psRowCnt.executeQuery();
     
     if(rsRowCnt.next())
      {
         iTotalRows=rsRowCnt.getInt("cnt");
      }
%>
<html>
<head>
<title>Pagination of JSP page</title>

</head>
<body>
 </p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<form name="frm">
<input type="hidden" name="iPageNo" value="<%=iPageNo%>">
<input type="hidden" name="cPageNo" value="<%=cPageNo%>">
<input type="hidden" name="iShowRows" value="<%=iShowRows%>">


<table width="100%" cellpadding="0" cellspacing="0" border="0" >

<table width="475" border="1" align="center">
            <tr>
              <td width="51" bgcolor="#99FF00">&nbsp;</td>
              <td width="64" bgcolor="#99FF00">vocab_英文</td>
              <td width="75" bgcolor="#99FF00">vocab_中文</td>
              <td width="257" bgcolor="#99FF00">類型/type</td>
			  <td width="257" bgcolor="#99FF00">note</td>
            </tr>
			
<%
int couter=0;
  while(rsPagination.next())
 {

		 	out.print("<tr><td>");
			out.print(rsPagination.getString("no"));
			out.print("</td><td>");
			out.print(rsPagination.getString("term_eng"));
			if ((rsPagination.getString("term_chi")).equals(""))
			{out.print("</td><td bgcolor='red'>"); couter++;
			if (couter >0){
%>
<script> alert("nl"); </script>
<%
}
			}
			else
			out.print("</td><td>");
			out.print(rsPagination.getString("term_chi"));
			out.print("</td><td>");
		    out.print(rsPagination.getString("type"));
		    out.print("</td><td>");
			out.print(rsPagination.getString("note"));
		    out.print("</td></tr>");
	
		}
		
 %>
 
 
<%
  //// calculate next record start record  and end record 
        try{
            if(iTotalRows<(iPageNo+iShowRows))
            {
                iEndResultNo=iTotalRows;
            }
            else
            {
                iEndResultNo=(iPageNo+iShowRows);
            }
           
            iStartResultNo=(iPageNo+1);
            iTotalPages=((int)(Math.ceil((double)iTotalRows/iShowRows)));
        
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

%>
<tr>

<td colspan="3">

<div>

</div>

</td>

</tr>

</table>
<br> </br>
<p align="center">
<%
        //// index of pages 
        
        int i=0;
        int cPage=0;
        if(iTotalRows!=0)
        {
        cPage=((int)(Math.ceil((double)iEndResultNo/(iTotalSearchRecords*iShowRows))));
        
        int prePageNo=(cPage*iTotalSearchRecords)-((iTotalSearchRecords-1)+iTotalSearchRecords);
        if((cPage*iTotalSearchRecords)-(iTotalSearchRecords)>0)
        {
         %>
     
		 a href="vocab_result.jsp?iPageNo=<%=prePageNo%>&cPageNo=<%=prePageNo%>"> << Previous</a>
         <%
        }
        
        for(i=((cPage*iTotalSearchRecords)-(iTotalSearchRecords-1));i<=(cPage*iTotalSearchRecords);i++)
        {
          if(i==((iPageNo/iShowRows)+1))
          {
          %>
           <a href="vocab_result.jsp?iPageNo=<%=i%>" style="cursor:pointer;color: red"><b><%=i%></b></a>
          <%
          }
          else if(i<=iTotalPages)
          {
          %>
           <a href="vocab_result.jsp?iPageNo=<%=i%>"><%=i%></a>
          <% 
          }
        }
        if(iTotalPages>iTotalSearchRecords && i<iTotalPages)
        {
         %>
         <a href="vocab_result.jsp?iPageNo=<%=i%>&cPageNo=<%=i%>"> >> Next</a> 
         <%
        }
        }
      %>
<b>  Rows <%=iStartResultNo%> - <%=iEndResultNo%>   Total Result  <%=iTotalRows%> </p> </b>
</form>
</body>
</html>
<%
    try{
         if(psPagination!=null){
             psPagination.close();
         }
         if(rsPagination!=null){
             rsPagination.close();
         }
         
         if(psRowCnt!=null){
             psRowCnt.close();
         }
         if(rsRowCnt!=null){
             rsRowCnt.close();
         }
         
         if(conn!=null){
          conn.close();
         }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%>

