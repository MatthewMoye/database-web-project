import java.sql.*;

public class SQLConnection {
	static final String CONNECTION = "connection";
	static final String DB_USER = "root";
	static final String DB_PASS = "password";

	public Connection connect() throws ClassNotFoundException {
		Connection c = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			c = DriverManager.getConnection(CONNECTION, DB_USER, DB_PASS);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return c;
	}

	public ResultSet result(String q) throws ClassNotFoundException {
		Connection c = connect();
		ResultSet rs = null;
		try {
			Statement st = c.createStatement();
			rs = st.executeQuery(q);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public boolean UpdateOrDelete(String sql) throws ClassNotFoundException, SQLException {
		Connection c = connect();
		try {
		Statement s = c.createStatement();
		System.out.println(sql);
		s.executeUpdate(sql);
		System.out.println("SuccessFunction");
		return true;
		} catch(SQLException e) {
			e.printStackTrace();
			System.out.println("Fail");
			return false;
		}
	}
}
