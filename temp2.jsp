<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import='java.sql.*'%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registered</title>
</head>
<body>
<% 
try{
	String a= request.getParameter("fname");
	String b= request.getParameter("lname");
	String c= request.getParameter("gender");
	String d= request.getParameter("dob");
	String e= request.getParameter("email");
	String f= request.getParameter("phone");
	String g= request.getParameter("username");
	String h= request.getParameter("pass");
	String i= request.getParameter("inputstate");
	String j= request.getParameter("address");
	String k= request.getParameter("pincode");
			
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection( 
"jdbc:mysql://localhost:3306/example?characterEncoding=latin1","root","koushik");
Statement stmt=con.createStatement();
String res=String.format("insert into user values('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')",a,b,c,d,e,f,g,h,i,j,k);
stmt.executeUpdate(res); 
out.println("<b><i>Registered successfully</i></b><br><br>");
con.close(); 
}catch(Exception e){ System.out.println(e);}

%>
<a href="login.html">click here to login</a>
</body>
</html>