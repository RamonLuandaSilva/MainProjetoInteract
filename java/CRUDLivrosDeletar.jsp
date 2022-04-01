<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="livros.Livro"%>
<style><%@include file="/Tabelas.css"%></style>
<!DOCTYPE html>
<html>

<%

	String paramUsername = null;

	if (request.getParameter("username") != null) {
		paramUsername = request.getParameter("username");
	}

%>

<form>
<head>
<meta charset="UTF-8">
<title>Listagem de livros</title>
</head>
<body>

<table border="1">
	<tr>
		<th>Code</th>
		<th>Booked</th>
		<th>Name</th>
	</tr>
	
	<%
	session.getAttribute("user");
	Object user =session.getAttribute("user"); 
	ArrayList<Livro> livros = Livro.listarTodosLivros(0, user.toString());
	
	for (Livro l : livros) {
	%>
	
	<tr>
		<th><%= l.getCode() %></th>
		<th><%= l.getBooked() %></th>
		<th><%= l.getName() %></th>
		<th><input type = "submit" value ="Deletar" name="Deletar"></th>
	</tr>
	<% } %>
</table>


</body>
</form>
</html>