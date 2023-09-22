<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import='java.sql.*'%>
<%@ page import='java.io.FileOutputStream' %>
<%@ page import='java.io.FileInputStream' %>
<%@ page import='java.io.InputStream' %>
<%@page import="java.io.File"%>
<%@page import="java.io.ObjectOutputStream"%>
<%@ page import='jakarta.servlet.http.Cookie' %>
<% 
HttpSession session1 = request.getSession(false);
if(session1 == null) {
    response.sendRedirect("temp.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.salediv{
            display: flex;
            background-image: linear-gradient(rgb(196, 111, 239) , rgb(0, 23, 235));
            align-items: center;
            height: 100vh;
            justify-content: center;
            overflow: hidden;
            flex-direction: column;
        }
.upload{
			padding:25%;
            height: 60px;
            border: none;
            border-radius: 10px;
            width: 200px;
            color: red;
            font-size: large;
            font-family:Arial, Helvetica, sans-serif;
        }
                input[type=submit]:hover{
            background-color: rgb(41, 109, 255);
            color: azure;
        }
        .upload:hover{
            background-color: rgb(255, 99, 99);
            color: azure;
        }
        .images{
			padding:25%;
            height: 60px;
            border: none;
            border-radius: 10px;
            width: 200px;
            color: red;
            font-size: large;
            font-family:Arial, Helvetica, sans-serif;
        }
                input[type=file]:hover{
            background-color: rgb(41, 109, 255);
            color: azure;
        }
        .images:hover{
            background-color: rgb(255, 99, 99);
            color: azure;
        }
        input{
        padding:10px 15px;
        border-radius:5px;
        }
        </style>
</head>
<body>
<div class="salediv">
<form action="#" method="post">
<b></b>
Book Name:<input type="text" id="book_name" name="book_name" required><br><br><br>
Book Price:<input type="number" id="price" name="price" required><br><br><br>
Book Image:<input type="file" id="images" name="images" accept="image/*" onchange="imgbase(this)" required><br><br><br>
<input type="text" name="photodata" id="photodata" style="display:none">
<input id="upload" type="submit" value="Upload">
</form>
<a id="home" href="home.html">home</a>
<script type="text/javascript">
function imgbase(a){
    var file = a.files[0];
    var reader = new FileReader();
      reader.onloadend = function () {
          document.getElementById("photodata").value=reader.result;
}
    reader.readAsDataURL(file);
}
</script>
<%
try{
	String c= (String)session.getAttribute("user");
	//session.setAttribute("d",c);
	String a= request.getParameter("book_name");
	String b= request.getParameter("price");
	String image=request.getParameter("photodata");

	


	
	
	
			
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection( 
"jdbc:mysql://localhost:3306/example?characterEncoding=latin1","root","koushik");


Statement stmt=con.createStatement();
PreparedStatement ps=con.prepareStatement("select * from data");

ResultSet rs=ps.executeQuery();
 
ps.close();

String res=String.format("insert into data values('%s','%s','%s','%s')",c,a,b,image);

String r= String.format("delete from data where book_name='null' and price='null'");
stmt.executeUpdate(res); 
stmt.executeUpdate(r);
System.out.println("<b><i>Your Book has been successfully saved</i></b>");
con.close(); 
}catch(Exception e){ System.out.println(e);}

%>
</div>
</body>
</html>