package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import model.Passeggero;
import model.Prenotazione;

import model.Volo;

public class PrenotazioneDAO {
	public synchronized ArrayList<Prenotazione> showAllReservations(String email){
		ArrayList<Prenotazione> pren=new ArrayList<Prenotazione>();
		Connection conn = null;
		PreparedStatement ps = null;
		Prenotazione p=null;
		Passeggero pass=null;
		Volo v=null;
		try {
	
			conn = DriverManagerConnectionPool.getConnection();
			ps = (PreparedStatement) conn.prepareStatement("SELECT prenotazione.codPrenotazione,prenotazione.dat As datP,prenotazione.numBagagliTot, volo.aeroportoPartenza,volo.aeroportoDestinazione,volo.dat AS datV, volo.codVolo,prenotazione.numBiglietti,prenotazione.prezzoTot FROM `volo` join prenotazione on volo.codVolo= prenotazione.codVolo where prenotazione.email=?");
			ps.setString(1, email);

			ResultSet res = ps.executeQuery();

			while (res.next()) {
				 p = new Prenotazione();
			v= new Volo();
			v.setAeroportoPartenza(res.getString("aeroportoPartenza"));
			v.setAeroportoDestinazione(res.getString("aeroportoDestinazione"));
			v.setCodVolo(res.getInt("codVolo"));
			v.setData(res.getString("datV"));
			p.setVolo(v);
			p.setCodPrenotazione(res.getInt("codPrenotazione"));
			p.setData(res.getString("datP"));
			p.setPrezzoTotale(res.getDouble("prezzoTot"));
			p.setNumBiglietti(res.getInt("numBiglietti"));
			p.setNumBagagliTot(res.getInt("numBagagliTot"));
			
	String sql="SELECT codPosto  FROM `passeggero` join postoprenotato on passeggero.codFiscale=postoprenotato.codFiscale WHERE codPrenotazione=?";
			ps = (PreparedStatement) conn.prepareStatement(sql);
			ps.setInt(1, p.getCodPrenotazione());

			ResultSet re = ps.executeQuery();
			
			while (re.next()) {
		
			pass=new Passeggero();
			pass.setPosto(re.getString("codPosto"));
			p.setPasseggeri(pass);
			}
			
			
			pren.add(p);
			
			
			
			
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
	
		
		
		return  pren;
	}
	
}
