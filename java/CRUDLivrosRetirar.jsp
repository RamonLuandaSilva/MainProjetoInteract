<%@page import="com.mysql.cj.x.protobuf.MysqlxPrepare.Execute"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="livros.*"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import ="java.sql.Statement"%>
<%@ page import = "ControllerServlet.*" %>

<style><%@include file="/Tabelas.css"%></style>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listagem de livros</title>
</head>
<script>
	function myFunction(code, user)
	{
	    var xhr = new XMLHttpRequest();
	    
	    xhr.open( "POST", "/ControllerServlet?code=" + code + "&user" + user , true );
	    xhr.send(user,code);
	}
	</script>
	<%
		session.getAttribute("user");
		Object user  = session.getAttribute("user");
		
		if ( user != null )
		{
	%>
<body>
Usuário: <%= user.toString() %>
<table border="1">
	<tr>
		<th>Code</th>
		<th>Booked</th>
		<th>Name</th>
	</tr>
	
	<%
		ArrayList<Livro> livros = Livro.listarTodosLivros(0, user.toString());
		for (Livro l : livros) {
	%>
	
	<tr>
		<th><%= l.getCode() %></th>
		<th><%= l.getBooked() %></th>
		<th><%= l.getName() %></th>
		<th><button onclick="myFunction('1', 'Ramon')">Click me</button>
		</th>
	</tr>

	<%  
	}
	String code = livros.get(0).getCode();
	%> 
	
</table>

<%
	}
	else 
	{
%>
		<div>
			Você não está logado. Clique <a href="login.jsp">aqui</a> para logar
		</div>
<%
	}
%>
</body>
</html>