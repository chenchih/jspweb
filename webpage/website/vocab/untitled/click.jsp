<script>
function show(str){
var f=document.myform;
var s=str;
alert (str);
f.action="http://www.google.com";
f.submit();



}
</script>

<form name="myform" action="">
<%

String s="test";
int a=123;
out.println("<input type='button' value='test1'  onclick='show(\""+s+"\");'>");
//out.println("<input type='button' value='test1'  onclick='show(\""+a+"\");'>");
out.println("hi");
%>
</form>

