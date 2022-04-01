package livros;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Livro {
	
	String code;
	int booked;
	String name;
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getBooked() {
		return booked;
	}
	public void setBooked(int booked) {
		this.booked = booked;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public static ArrayList listarTodosLivros(int disponivel, String username) throws SQLException {
		
		// 0 apenas os disponíveis, 1 apenas os booked
		
		String sql = " select * from livros where 1 = 1 ";
		
		if (disponivel == 0 || disponivel == 1) {
			sql = sql + " and booked = " + disponivel;
			if(disponivel == 1) {
				sql = sql + " and usuario_que_retirou = '" + username + "' ";
			}
		} 
		
		System.out.println(sql);
		
		ArrayList<Livro> list = new ArrayList();
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/site?useTimezone=true&serverTimezone=UTC","root","imortal4681pBNs17%");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		
		while (rs.next()) {
			Livro l = new Livro();
			l.code = rs.getString("code");
			l.booked = rs.getInt("booked");
			l.name = rs.getString("name");
			
			list.add(l);
		}
		
		con.close();
		
		return list;
	}
	
	public static void setRetirarLivro (String code, String username) throws SQLException {
		
		String sql = " UPDATE livros SET booked = 1, usuario_que_retirou = '" + username + "' "
				+ " WHERE code = '" + code + "' ";
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/site?useTimezone=true&serverTimezone=UTC","root","imortal4681pBNs17%");
		Statement st = con.createStatement();
		st.execute(sql);
		con.close();
		
	}
	
	public static void setDevolverLivro (String code, String username) throws SQLException {
		
		String sql = " UPDATE livros SET booked = 0, usuario_que_retirou = null "
				+ " WHERE code = '" + code + "' AND usuario_que_retirou = '" + username + "' ";
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/site?useTimezone=true&serverTimezone=UTC","root","imortal4681pBNs17%");
		Statement st = con.createStatement();
		st.execute(sql);
		con.close();
		
	}
	
	public static void deleteLivro (String code, String username) throws SQLException 	{
		
		String sql = " delete from livros where code = '" + code + "' ";
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/site?useTimezone=true&serverTimezone=UTC","root","imortal4681pBNs17%");
		Statement st = con.createStatement();
		st.execute(sql);
		con.close();
		
	}
	
	public static void insertLivro (String code, String username) throws SQLException 	{
		
		
		
		/*String sql = " insert into livros values (" + code + ", 0, " + name + ", null)";
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/site?useTimezone=true&serverTimezone=UTC","root","imortal4681pBNs17%");
		Statement st = con.createStatement();
		st.execute(sql);
		con.close();
		*/
	}	
	
}
