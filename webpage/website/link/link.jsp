sss
<%

String getUrl= request.getParameter("link");
response.setStatus(response.SC_MOVED_TEMPORARILY);
// response.setHeader("Location", getUrl); 
response.setHeader("Location", getUrl.startsWith("http://")? getUrl : "http://" + getUrl);
  
   
%>

