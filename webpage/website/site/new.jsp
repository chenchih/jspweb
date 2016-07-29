<%

Connection conn = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
   conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/account?user=root&useUnicode=true&characterEncoding=big5");
 	
int per_page=6
int pages_query=(mysql_query("select count ('id') from 'member'");
int pages=cell(mysql_result(pages_query,0) /per_page);
int page=(isset['page']) ? (int)['page']:1;
int start=(page-1)*per_page;

int query=mysq_query("select 'name' from 'name' limit $start, $per_page");
while (query_row=mysql_fetch_assoc(query)){
out.print('<p>', query_row['name'], '</p>');
}

if (pages >=1)&& page <=pages)
{
for(x=1;x<=pages;x++)
{
//echo '<a href=?page='.$x.'">'.$x.'</a>';
out.print(x==page) ? <strong><a href="?page='.$x.'">'.$x.'</a></strong>':'<a href="?page='.$x.'">'.$x.'</a>';
}
}
    

    

%>