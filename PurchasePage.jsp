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
<title>Purchase Page</title>
</head>
<link rel="StyleSheet" href="StyleSheet.css" >

<body>
<div class="main">
	<h1>Shopping Cart for Book Store</h1>
	<h2>Selected Book Details are Displyed</h2>
	<form action="./CustomerServlet">
	<table class="tblform">
	
	<%
	try{
		
	ResultSet rs=(ResultSet)session.getAttribute("rs2");
	while(rs.next())
	{
	%>
	
	<% System.out.println("Book details in Purchase Page");%>
	

	<tr><td>Book Name:</td><td><%= rs.getString("Books_Name")%></td></tr>
	<tr><td>Author:</td><td><%= rs.getString("Author")%></td></tr>
	<tr><td>Price:</td><td><%= rs.getString("Price")%> </td></tr>
	<% 
	}
	%>
	<tr><td>Quantity:</td><td><input type="number" name="QTY" ></td></tr>
				<tr><td></td><td><input type="submit" class=btn value="Purchase">
				<input type="button" class=btn onclick="window.location.replace('index.jsp')"value="Cancel"></td></tr>
				</table>
				</form>
	<!-- 			
	<form action="index.jsp">
	<input type="submit" value="cancel">
	</form>
	 -->		
	<% }
	catch (Exception e) 
	{

		e.printStackTrace();
	}
	%>
</div>
</body>
</html>