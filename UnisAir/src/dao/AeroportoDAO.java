package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import model.Aeroporto;
import model.Volo;

public class AeroportoDAO {


	public synchronized boolean doSave(Aeroporto a1) {
		Connection conn = null;
		PreparedStatement cmd = null;

		try {
			conn = DriverManagerConnectionPool.getConnection();
			String NuovoAeroporto = "INSERT INTO aeroporti(aeroporto) VALUES(?)";
			cmd = (PreparedStatement) conn.prepareStatement(NuovoAeroporto);
			cmd.setString(1, a1.getNome());
			cmd.executeUpdate();
			cmd.close();
			return true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				cmd.close();
				DriverManagerConnectionPool.releaseConnection(conn);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return false;
	}


	
	public synchronized ArrayList<String> getAeroporto() {

		ArrayList<String> s = new ArrayList<>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			Volo v;
			conn = DriverManagerConnectionPool.getConnection();

			String sql = "SELECT * FROM aeroporto";
			ps = (PreparedStatement) conn.prepareStatement(sql);
			rs = ps.executeQuery();
			

			while (rs.next()) {
				s.add(rs.getString("aeroporto"));
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				DriverManagerConnectionPool.releaseConnection(conn);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return s;
	}




}
