package ControllerServlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import livros.*;

@WebServlet
public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try	{
			String code = request.getParameter("code");
			String username = request.getParameter("user");
			System.out.println(code);
			System.out.println(username);
			Livro.setRetirarLivro(code, username);
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try	{
			String code = request.getParameter("code");
			String username = request.getParameter("user");
			System.out.println(code);
			System.out.println(username);
			Livro.setRetirarLivro(code, username);
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
	}
		
}

