package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import model.Posto;
import model.Utente;

public class PostoDAO {
	public synchronized Posto doRetrieveByKey(String numPosto, int codAereo) { // login

		Connection conn = null;
		PreparedStatement ps = null;
		Posto posto=null;
		try {
	
			conn = DriverManagerConnectionPool.getConnection();
			ps = (PreparedStatement) conn.prepareStatement("SELECT * FROM posto WHERE numPosto = ? AND codAereo = ?");
			ps.setString(1, numPosto);
			ps.setInt(2, codAereo);

			ResultSet res = ps.executeQuery();

			if (res.next()) {
				 posto = new Posto();
			/*
				ub.setEmail(res.getString("email"));
				ub.setPassword(res.getString("passw"));
				ub.setNome(res.getString("nome"));
				ub.setCognome(res.getString("cognome"));
				ub.setTipoDocumento(res.getString("tipo_doc"));
				ub.setNumDocumento(res.getString("num_doc"));
			*/
				 posto.setNumPosto(numPosto);
				 posto.setCodAereo(codAereo);
				 posto.setTipologia(res.getString("tipologia"));
			}

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		return posto;
	}
}
