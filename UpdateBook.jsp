<%@page import="java.sql.ResultSet"%>
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
<h2>Update Book</h2><br>
<table border=1  class=tbl>
<tr class=thead>
	<th>Book Name</th>
	<th>Author</th>
	<th>Price</th>
	<th>Status</th>
</tr>
<%
try {
	
	ResultSet rs=(ResultSet)session.getAttribute("rs4");
	System.out.println("Book details in Welcome Page");

	while(rs.next())
	{
%>
	<tr>
	<% //System.out.println(rs.getString("Books_ID"));%>

	<td><a href="Book1.jsp?BKID=<%= rs.getString("Books_ID")%>"><%= rs.getString("Books_Name")%></a></td>
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

<form action="./UpdateBookStep2Servlet">
		<%
		try {
		ResultSet rs1=(ResultSet)session.getAttribute("rs5");
		
		
				while(rs1.next())
				{
		%>
			<table class="tblform">
			<tr>
			<th>Enter New Books_Name:</th><td><input type="text" name="bname" value="<%=rs1.getString("Books_Name")%>"></td></tr>
			<tr><th> Enter New Author:</th><td><input type="text" name="author" value="<%=rs1.getString("Author")%>"></td></tr>
			<tr><th>Enter New Price:</th><td><input type="text" name="price" value="<%=rs1.getString("Price")%>"></td></tr>
			<tr><th> Status: </th><td>
			<%
			
			if(rs1.getString("Status").equals("Available")){ %>
			<input id=isavi type="radio" name="Available"  value="Available" checked>Available
			<input id=isNoavi type="radio" name="Available" value="Not-Available">Not-Available
			<%} else { %> 
			<input id=isavi type="radio" name="Available"  value="Available">Available
			<input id=isNoavi type="radio" name="Available" value="Not-Available" checked>Not-Available
			<% } %>						
			</table>
			
			
			<%
				}
				
				
		} 
		catch (Exception e) 
		{

			e.printStackTrace();
		}
			%>
			<input type="submit" class="btn" value="Update">
			<input type="button" class=btn onclick="window.location.replace('AdminActivity.jsp')"value="Cancel">
			

</form>
</div>
</body>
</html>