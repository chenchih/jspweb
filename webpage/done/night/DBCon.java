package com.db;

import java.io.*;
import javax.servlet.http.*;
import java.sql.*;

public class DBCon implements HttpSessionBindingListener
{
    private Connection con = null;

    public DBCon()
    {
          BuildConnection();
    }

    private void BuildConnection()
   {
        try 
        {
//            Class.forName("org.gjt.mm.mysql.Driver").newInstance();
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/abc?user=root&useUnicode=true&characterEncoding=big5");
        }
        catch(Exception ex)
        {
           System.out.println(ex.toString());
        }
   }

   public Connection getConnection()
   {
        if (con==null)   BuildConnection();
       return this.con; 
   }

   public void close()
   {
        try
        {
             con.close();
             con=null;
        }
        catch(SQLException sex)
        {
             System.out.println(sex.toString());
        }
   }
   
   public void valueBound(HttpSessionBindingEvent event) {}

   public void valueUnbound(HttpSessionBindingEvent event)
   {
       if(con != null) close();
   }

} 

