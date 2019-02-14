package dao;


import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import com.mysql.jdbc.Connection;

public class DriverManagerConnectionPool {
	private static List<Connection> freeDbConnections;
	
	static {
		freeDbConnections = new LinkedList<Connection>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
			System.out.println("DB driver not found:"+ e.getMessage());
		} 
	}
	
	private static synchronized Connection createDBConnection() throws SQLException {
		Connection conn = null;
		conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/unisair", "root", "");
		
	//	conn.setAutoCommit(false); non fa funzionare le cose?????????
		return conn;
	}


	public static synchronized Connection getConnection() throws SQLException {
		Connection connection;
		
		
		if (!freeDbConnections.isEmpty()) {
			connection = (Connection) freeDbConnections.get(0);
			freeDbConnections.remove(0);
			try {
				if (connection.isClosed())
					connection = getConnection();
			} catch (SQLException e) {
				connection.close();
				connection = getConnection();
			}
		} else {
			connection = createDBConnection();		
		}

		return connection;
	}

	public static synchronized void releaseConnection(Connection connection) throws SQLException {
		if(connection != null) freeDbConnections.add(connection);
	}
}

