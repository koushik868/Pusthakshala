<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection( 
	"jdbc:mysql://localhost:3306/koushik?characterEncoding=latin1","root","koushik");


	Statement stmt=con.createStatement();
	PreparedStatement ps=con.prepareStatement("select * from data");

	ResultSet rs=ps.executeQuery();
	 
	ps.close();
	String a=request.getParameter("uname");
	String b=request.getParameter("pwd");
	String c=request.getParameter("gen");
	String d=request.getParameter("state");
	String res=String.format("insert into data values('%s','%s','%s','%s')",a,b,c,d);
	stmt.executeUpdate(res);
	out.println("Data saved successfully");
	con.close(); 
}catch(Exception e){
	System.out.println(e);
}
%>
</body>
</html>