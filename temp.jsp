<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import='java.sql.*' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logged In Successfully</title>
<link rel="stylesheet" type="text/css" href="gohome.css">
</head>
<body>
<%
	try{
		String username = request.getParameter("uname");
		String password = request.getParameter("password");
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con=DriverManager.getConnection(
				
		"jdbc:mysql://localhost:3306/example?characterEncoding=latin1", "root", "koushik");
		
		PreparedStatement pst = con.prepareStatement("Select username,password from user where username=? and password=?");
		pst.setString(1,username);
		pst.setString(2,password);
		ResultSet rs = pst.executeQuery();
		
		
		
		
		
		
		
		if(rs.next()){%>
			
			<div class="home">
			<h1>Successfully Logged IN</h1>
			<form id="buy" method="post" action="home.html">
		<input type="submit" value="gohome"><br>
		
		</form>
		
		</div>
		<%}else{%>
	INVALID CREDENTIALS
	<a href="login.html">LOGIN</a>
			<%}
		
		
		session.setAttribute("user", username);
		
		
		con.close();	
	} catch (Exception e){
		System.out.println(e);
	}%>
</body>
</html>