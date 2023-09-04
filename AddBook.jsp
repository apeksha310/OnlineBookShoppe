<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<link rel="StyleSheet" href="StyleSheet.css" >
<body>

	<header class="headercss">
	<nav>
	<a class="header1" href="HomePage.jsp">Home</a>
	<a class="header1" href="About.jsp">About</a>
	<a class="header1" href="Contact.jsp">Contact</a>
	<a class="header1" href="Help.jsp">Help</a>
	<a class="header1" href="HomePage.jsp">Logout</a>
	</nav>
	</header>

<div class="main">

	<h1>Add Book</h1>
	<form action="./AddBookServlet" method="post">
	<table class="tblform">
	
	 <tr><td>Enter New Book Id:</td><td><input type="text" name="bid"></td></tr>
	 <tr><td>Enter New Book Name:</td><td><input type="text" name="bname"></td></tr>
	 <tr><td>Enter Book Author:</td><td><input type="text" name="author"></td></tr>
	 <tr><td>Enter Book Price:</td><td><input type="number" name="price"></td></tr>
	  <tr><td>Status:</td><td><input type="radio" name="available" value="Available">Available
	  				<input type="radio" name="available" value="Not-Available">Not-Available</td></tr>
	  				
	  				<tr><td> </td><td> <input type="submit" class=btn value="AddBook">
		<input type="button" class=btn onclick="window.location.replace('AdminActivity.jsp')"value="Cancel">
		</td></tr>
		
		</table>
	</form>	
	</div>
</body>
</html>