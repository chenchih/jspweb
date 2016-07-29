<%@ page import="java.sql.*" %>
/* dql connection sample*/
<%
//http://www.planet-source-code.com/vb/scripts/ShowCode.asp?txtCodeId=2162&lngWId=2
String connectionURL = "jdbc:mysql://localhost:3306/mydatabase?user=;password=";
Connection connection = null;
Statement statement = null;
ResultSet rs = null;
%>


<html><body>


<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection = DriverManager.getConnection(connectionURL, "", "");
statement = connection.createStatement();
rs = statement.executeQuery("SELECT * FROM mytable");

while (rs.next()) {
out.println(rs.getString("myfield")+"<br>");
}

rs.close();
%>


</body></html>