<%@ page contentType="text/html; charset=utf-8" import="java.sql.*" %>
<%!
private String adjust_Msg(String adj_str) {
   //--- �ഫ�d����Ƥ���Carriage Return[chr(13)]��
   //--- Line Feed�r��[chr(10)]���Ŧr��P�ť�
   String final_str = ""; 
   int i;
   String charA;
   //
   adj_str = adj_str.trim();
   if (adj_str.length() > 0 ) {
      for (i = 0; i < adj_str.length(); i++) {
          //--- �C�����@�Ӧr���X�� ---
          if (i == (adj_str.length() - 1))
             charA = adj_str.substring(i);
          else
             charA = adj_str.substring(i, i+1);
          if (charA.equals("\n")) {
             final_str += " ";
          } else if (charA.equals("'")) {  //�Y����޸��A�h�אּ��ӳ�޸�
             final_str += "''";
          } else {  //�Y����L�r��
             final_str += charA;
          }
      }
   }
   return final_str;
}
%>
<%
  int i = 0, rec_no = 10, intNo;
  String sql;
//  String strUrl1 = "jdbc:mysql://localhost:3306/account?user=root&characterEncoding=big5";
 String strUrl1 = "jdbc:mysql://localhost:3306/test?user=root&characterEncoding=big5";
  String JDBCDriver1 = "com.mysql.jdbc.Driver";
  // 1.���JJDBC�X�ʵ{��
  Class.forName(JDBCDriver1);
  // 2.�z�LDriverManager���O�إ�Connection����
  Connection con = DriverManager.getConnection(strUrl1);
  // 3.�z�LConnection����إ�Statement����
  Statement stmt = con.createStatement();

  //--- get field content ---
  String term, sb1; 
  term = new String(request.getParameter("term").getBytes("ISO-8859-1"));
  //term = request.getParameter("term").trim();
  term = adjust_Msg(term.trim());

  sql = "select term1 from terms where term1 like '" 
  			+ term  + "%' order by term1;";

  StringBuffer sb = new StringBuffer();
  sb.append("{\"Results\": { \"books\": [");

  ResultSet rs = stmt.executeQuery(sql);
  while ( (rs.next()) && (i < rec_no) ) {
  sb.append("{\"term1\":\"" + rs.getString("term1")+"\"}");
   // sb.append("{\"bookno\":\"" + rs.getString("bookno") + " " + rs.getString("bookname") + "\"}");
     //sb.append("{\"entity\":\"" + rs.getString("entity") + "\"}");
     sb.append(",");
     i++;
	}
	if (i > 0) {
		intNo = sb.toString().length() - 1;
	  sb1 = sb.toString().substring(0, intNo);
	  sb1 += "]}}";
	} else {
		sb1 = "";
	}

  // 7.����Statement����
  if (stmt != null) stmt.close();
  // 8.����Connection����
  if (con != null) con.close();

  out.println(sb1);
%>
