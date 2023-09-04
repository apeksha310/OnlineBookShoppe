<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome Page</title>
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
<h2>All Book Details</h2>
<table border=1 class=tbl>
<tr class=thead>
	<th>Book ID</th>
	<th>Book Name</th>
	<th>Author</th>
	<th>Price</th>
	<th>Status</th>
</tr>
<%
try {
	
	ResultSet rs=(ResultSet)session.getAttribute("rs1");
	System.out.println("Book details in Add Book Data Page");

	while(rs.next())
	{
%>
	<tr>
	<% //System.out.println(rs.getString("Books_ID"));%>
	<td><%= rs.getString("Books_ID") %></td>
	<td><%= rs.getString("Books_Name")%></td>
	<td><%= rs.getString("Author") %></td>
	<td><%= rs.getInt("Price") %></td>
	<td><%= rs.getString("Status") %></td>
</tr>
<%
	}
} 
catch (Exception e) 
{

	e.printStackTrace();
}
%>
</table>

<input type="button" class=btn onclick="window.location.replace('AdminActivity.jsp')"value="Cancel"><br><br>

</div>
</body>
</html>