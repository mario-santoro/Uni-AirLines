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
			ps = (PreparedStatement) conn.prepareStatement("SELECT volo.isDelete, prenotazione.isChangeVolo, prenotazione.codPrenotazione,prenotazione.dat As datP,prenotazione.numBagagliTot, volo.aeroportoPartenza,volo.aeroportoDestinazione,volo.dat AS datV, volo.codVolo,prenotazione.numBiglietti,prenotazione.prezzoTot FROM `volo` join prenotazione on volo.codVolo= prenotazione.codVolo where prenotazione.email=?");
			ps.setString(1, email);

			ResultSet res = ps.executeQuery();

			while (res.next()) {
				 p = new Prenotazione();
			v= new Volo();
			v.setAeroportoPartenza(res.getString("aeroportoPartenza"));
			v.setAeroportoDestinazione(res.getString("aeroportoDestinazione"));
			v.setCodVolo(res.getInt("codVolo"));
			if(res.getInt("isDelete")==1) {
			v.setDelete(true);
			}
			v.setData(res.getString("datV"));
			p.setVolo(v);
			p.setCodPrenotazione(res.getInt("codPrenotazione"));
			p.setData(res.getString("datP"));
			p.setPrezzoTotale(res.getDouble("prezzoTot"));
			p.setNumBiglietti(res.getInt("numBiglietti"));
			p.setNumBagagliTot(res.getInt("numBagagliTot"));
			
			if(res.getInt("isChangeVolo")==1) {
			p.setChangeVolo(true);}
			
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
	
	public synchronized Prenotazione doRetrivePrenotazioneById(int codPrenotazione){
		Connection conn = null;
		PreparedStatement ps = null;
		Prenotazione p = null;
		Passeggero pass=null;
		try {
	
			conn = DriverManagerConnectionPool.getConnection();
			ps = (PreparedStatement) conn.prepareStatement("SELECT * FROM prenotazione WHERE codPrenotazione = ?");
			ps.setInt(1, codPrenotazione);

			ResultSet res = ps.executeQuery();

			if (res.next()) {
				p = new Prenotazione(); 
				Volo v = new Volo();
				VoloDAO d = new VoloDAO();
				
				p.setCodPrenotazione(codPrenotazione);
				p.setData(res.getString("dat"));
				p.setOra(res.getString("ora"));
				p.setPrezzoTotale(res.getDouble("prezzoTot"));
				p.setNumBagagliTot(res.getInt("numBagagliTot"));
				p.setNumBiglietti(res.getInt("numBiglietti"));
				p.setEmail(res.getString("email"));
				p.setChangeVolo(res.getBoolean("isChangeVolo"));
				v = d.doRetriveByCod(res.getInt("codVolo"));
				p.setVolo(v);
			}
			String sql="SELECT codPosto  FROM `passeggero` join postoprenotato on passeggero.codFiscale=postoprenotato.codFiscale WHERE codPrenotazione=?";
			ps = (PreparedStatement) conn.prepareStatement(sql);
			ps.setInt(1, p.getCodPrenotazione());

			ResultSet re = ps.executeQuery();
			
			while (re.next()) {
		
			pass=new Passeggero();
			pass.setPosto(re.getString("codPosto"));
			p.setPasseggeri(pass);
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
		return p;
	}
	
}
