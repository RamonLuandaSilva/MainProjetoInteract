package livros;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import livros.*;

public class setRetirarLivro {
	
	public static void setRetirarLivro (String code, String username) throws SQLException {
		
		String sql = " UPDATE livros SET booked = 1, usuario_que_retirou = '" + username + "' "
				+ " WHERE code = '" + code + "' ";
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/site?useTimezone=true&serverTimezone=UTC","root","imortal4681pBNs17%");
		Statement st = con.createStatement();
		st.execute(sql);
		con.close();

	}
}