package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import model.Passeggero;
import model.Prenotazione;
import model.Volo;

public class PasseggeroDAO {
	
	
	public synchronized ArrayList<Passeggero> doRertivePasseggeriByCodPrenotazione(int cod){
		ArrayList<Passeggero> passeggeri = new ArrayList<Passeggero>();
		
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			Passeggero p;
			conn = DriverManagerConnectionPool.getConnection();

			String sql = "SELECT * FROM `passeggero` WHERE 	codPrenotazione=?";
			ps = (PreparedStatement) conn.prepareStatement(sql);
			ps.setInt(1,cod);
			
			rs = ps.executeQuery();
			

			while (rs.next()) {
				p= new Passeggero();
						p.setCodFiscale(rs.getString("codFiscale"));
						p.setTariffaBagaglio(rs.getDouble("tariffaBagaglio"));
						p.setNumBagaglio(rs.getInt("numBagaglio"));
						p.setNome(rs.getString("nome"));
						p.setCognome(rs.getString("cognome"));
						p.setEta(rs.getInt("eta"));
						p.setIndirizzo(rs.getString("indirizzo"));
						p.setCap(rs.getInt("CAP"));
						p.setCitta(rs.getString("citta"));
						p.setPaese(rs.getString("paese"));
						p.setTipoDocumento(rs.getString("tipoDoc"));
						p.setNumeroDocumento(rs.getString("numDoc"));
						p.setCheckIsDone(rs.getBoolean("checkIsDone"));
						
					
				passeggeri.add(p);
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
		return passeggeri;
	}
	
}
