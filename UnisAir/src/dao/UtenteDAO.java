package dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import model.Utente;

public class UtenteDAO {
	
	public synchronized Utente doRetrieveByKey(String email, String password) { // login

		Connection conn = null;
		PreparedStatement ps = null;
		Utente ub=null;
		try {
	
			conn = DriverManagerConnectionPool.getConnection();
			ps = (PreparedStatement) conn.prepareStatement("SELECT * FROM utente WHERE email = ? AND passw = ?");
			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet res = ps.executeQuery();

			if (res.next()) {
				 ub = new Utente();
			
				ub.setEmail(res.getString("email"));
				ub.setPassword(res.getString("passw"));
				ub.setNome(res.getString("nome"));
				ub.setCognome(res.getString("cognome"));
				ub.setTipoDocumento(res.getString("tipo_doc"));
				ub.setNumDocumento(res.getString("num_doc"));

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
		return ub;
	}

	public synchronized boolean doSave(Utente u1) {
		Connection conn = null;
		PreparedStatement cmd = null;

		try {
			conn = DriverManagerConnectionPool.getConnection();
			cmd = (PreparedStatement) conn.prepareStatement("select * from utente where email=?");
			cmd.setString(1, u1.getEmail());
			ResultSet res = cmd.executeQuery();

			if (res.next() == false) {
				String registrazione = "INSERT INTO utente(email,passw,nome,cognome,tipo_doc,num_doc) VALUES(?,?,?,?,?,?)";
				cmd = (PreparedStatement) conn.prepareStatement(registrazione);
				cmd.setString(1, u1.getEmail());
				cmd.setString(2, u1.getPassword());
				cmd.setString(3, u1.getNome());
				cmd.setString(4, u1.getCognome());
				cmd.setString(5, u1.getTipoDocumento());
				cmd.setString(6, u1.getNumDocumento());
				cmd.executeUpdate();
				cmd.close();
				return true;
			}

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


	public synchronized void doUpdate(Utente u1) {

		Connection conn = null;
		PreparedStatement cmd = null;

		try {
			conn = DriverManagerConnectionPool.getConnection();

			String sql = " UPDATE utente SET nome=?,cognome=?,passw=?,num_doc=?,tipo_doc=? where email=?";
			cmd = (PreparedStatement) conn.prepareStatement(sql);
			cmd.setString(1, u1.getEmail());
			cmd.setString(2, u1.getPassword());
			cmd.setString(3, u1.getNome());
			cmd.setString(4, u1.getCognome());
			cmd.setString(5, u1.getTipoDocumento());
			cmd.setString(6, u1.getNumDocumento());
			cmd.executeUpdate();
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
	}

	

	

}
