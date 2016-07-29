
<%@page import="java.sql.*"%>

<%
String ide=request.getParameter("id");
int num=Integer.parseInt(ide);
String name=request.getParameter("name");
String address=request.getParameter("address");
int contact=Integer.parseInt(request.getParameter("contact"));
String email=request.getParameter("email");
try{
Connection conn = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root", "");
Statement st=null;
st=conn.createStatement();
st.executeUpdate("update employee set name='"+name+"',address='"+address+"',contactNo="+contact+",email='"+email+"' where id='"+num+"'");
response.sendRedirect("application.jsp");
}
catch(Exception e){
System.out.println(e);
    }
%>
