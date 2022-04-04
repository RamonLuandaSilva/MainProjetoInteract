<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "UsuarioQualificado.*"%>


<!DOCTYPE html>
<html>

	<head>
	<style><%@include file="/MenuStyle.css"%></style>
	<meta charset="UTF-8">
	<title>MENU</title>
	</head>
	
		<body class ="MyBody">
		
			<%
	
			session.getAttribute("user");
			Object user = session.getAttribute("user");
			
			if (user != null){
				
			%>
			
			Usuário: <%= user.toString() %>
			<h1 id ="Title">Tela de Menu</h1>
			<p><%= user.toString() %> , partir da tela de Menu é possível ir para 4 outras telas, que são:</p>
			<br>
			<a class ="referencia" href="http://localhost:27261/Interact/CRUDLivrosRetirar.jsp">Retirar</a>
			<br>
			<br>
			<a class = "referencia" href="http://localhost:27261/Interact/CRUDLivrosDevolver.jsp">Devolver</a>
			<br>
			<br>			
			<a class = "referencia" href="http://localhost:27261/Interact/CRUDLivrosDeletar.jsp">Deletar</a>
			<br>
			<br>
			<a class = "referencia" >Incluir</a>
			<br>
			<br>
			<% } else 	{
			%>
			<div>
				Não está logado, clique <a href="http://localhost:27261/Interact/login.jsp">aqui</a> para logar.
			</div>
			<% 
			
			}
			
			%>
			
		</body>
		
</html>