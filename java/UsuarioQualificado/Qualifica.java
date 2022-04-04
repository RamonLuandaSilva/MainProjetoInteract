package UsuarioQualificado;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Qualifica {
	
	public static boolean validaUsuario (String username, String password) {
		System.out.println("CHEGOU QUALIFICA");
		String sql = " select count(*) as qtd from login where 1=1 ";
	
		if (username != null)
			sql = sql + " and username = '" + username + "' ";
	
		if (password != null)
			sql = sql + " and password = '" + password + "' ";
		
		System.out.println(sql);
	
		try {	
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/site?useTimezone=true&serverTimezone=UTC","root","root");  
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
		
			rs.next();
			
			if (rs.getInt("qtd") > 0) {
				con.close();
				return true;
			} else {
				con.close();
				return false;
			}
			
		} catch (SQLException e) {
			System.out.println("DEU RUIM");
			System.out.println(e);
		}
		
		return false;
	}
}
