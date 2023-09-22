<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import='java.sql.*'%>
<%@ page import='java.io.FileOutputStream' %>
<%@ page import='java.io.File' %>
<%@ page import='java.io.ObjectOutputStream' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Buy Here</title>
<style type="text/css">
.buydiv{
            display: flex;
            background-image: linear-gradient(hsl(56, 62%, 85%) , hsl(182, 100%, 49%));
            align-items: center;
            justify-content: center;
            flex-direction: column;
        }
</style>
</head>
<body>
<div class="buydiv">
<h1>Select a book you want</h1>
<%
try{
	
	
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection(

	"jdbc:mysql://localhost:3306/example?characterEncoding=latin1", "root", "koushik");
	
	

	
	
	
    PreparedStatement P=con.prepareStatement("select * from data");
  
    ResultSet rs = P.executeQuery();
   
    %><table border=1 align=center style="text-align:center">
    <thead>
        <tr>
           <th>BOOK Name</th>
           <th>PRICE</th>
           <th>IMAGE</th>
        </tr>
    </thead>
    <tbody>
      <%while(rs.next())
      {
          %>
          <tr>
              <td><%=rs.getString("book_name") %></td>
              <td><%=rs.getString("price") %></td>
              <td><img src="<%=rs.getString("image")%>" height=20% width=20%></td>
          </tr><br><br>
         
          
          <%}%>
          <a href="home.html">GO Back to HOME</a>
         </tbody>
      </table><br>
  <%}
  catch(Exception e){
      out.print(e.getMessage());%><br><%
  }
 
  %>
  </div>
</body>
</html>