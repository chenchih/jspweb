<html>
  <HEAD>
    <TITLE>HTML Title</TITLE>
  </HEAD>
  <BODY>
    
    <H3 ALIGN="CENTER">
      Ramdom number from 0 to 10 : 
      <FONT COLOR="RED">
        <%= (int) (Math.random() * 10) %>
      </FONT>
    </H3>
    <H4 ALIGN="CENTER">Refresh the page to see if the number changes...</H4>
  </BODY>
</HTML>