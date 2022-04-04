<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "UsuarioQualificado.*"%>

<!DOCTYPE html>
<html>

<% 

	String paramUsername = null;
	String paramPassword = null;
	Boolean podeLogar = false;
	
	if (request.getParameter("username") != null) {
		paramUsername = request.getParameter("username");
	}
	
	if (request.getParameter("password") != null) {
		paramPassword = request.getParameter("password");
	}
	
	if (paramUsername != null && paramPassword != null) {
		podeLogar = Qualifica.validaUsuario(paramUsername, paramPassword);
	
		if (podeLogar) {
			session.setAttribute("user", paramUsername);
			System.out.println("LOGOU");
			response.sendRedirect("/Interact/Menu.jsp");
		} else {
			System.out.println("NÃO LOGOU");
			response.sendRedirect("/Interact/ErroLogin.jsp");
		}
	}
	
%>

<head>
<style><%@include file="/WEB-INF/CSS.css"%></style>
<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<title>Biblioteca Virtual</title>
	</head>
	<form method="post">
		<div>
			<body class= "body">
				<div class ="div">
					<font color = "white">	
						<h1 id = "h1">Biblioteca Virtual</h1>
					</font>
					<h2 id = "login">Login</h2>
					<label id = "logAct">Nome</label>
					<input name = "username" id = "logAct" type = "text">
					<br>
					<br>
					<label id = "logAct">Senha</label>
					<input name = "password" id = "logAct" type = "password">
					<br>
					<br>
					<input type = "submit" value ="Logar" id = "enviar">
				</div>
			</body>
		</div>
	</form>
</html>