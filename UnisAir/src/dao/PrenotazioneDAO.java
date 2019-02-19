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
	public synchronized boolean doSave(Prenotazione p){
		
		Connection conn = null;
		PreparedStatement cmd = null;
		try {
	
			conn = DriverManagerConnectionPool.getConnection();
			

		
				String sql = "INSERT INTO prenotazione(dat,ora,prezzoTot,numBagagliTot,numBiglietti,email,codVolo) VALUES(?,?,?,?,?,?,?)";
				cmd = (PreparedStatement) conn.prepareStatement(sql);
				cmd.setString(1,p.getData());
				cmd.setString(2,p.getOra());
				cmd.setDouble(3, p.getPrezzoTotale());
				cmd.setInt(4, p.getNumBagagliTot());
				cmd.setInt(5, p.getNumBiglietti());
				cmd.setString(6,p.getEmail());
				cmd.setInt(7,p.getVolo().getCodVolo());
			
				cmd.executeUpdate();
				
				getMaxCod(p);
				
				for(int i=0;i< p.getPasseggeri().size();i++){
				String sql2="INSERT INTO passeggero(codFiscale,tariffaBagaglio,numBagaglio,nome,cognome,eta,indirizzo,CAP,citta,paese,tipoDoc,numDoc,codPrenotazione) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
				cmd = (PreparedStatement) conn.prepareStatement(sql2);
				cmd.setString(1,p.getPasseggeri().get(i).getCodFiscale());
				cmd.setDouble(2,p.getPasseggeri().get(i).getTariffaBagaglio());
				cmd.setInt(3, p.getPasseggeri().get(i).getNumBagaglio());
				cmd.setString(4,p.getPasseggeri().get(i).getNome());
				cmd.setString(5, p.getPasseggeri().get(i).getCognome());
				cmd.setInt(6, p.getPasseggeri().get(i).getEta());
				cmd.setString(7,p.getPasseggeri().get(i).getIndirizzo());
				cmd.setInt(8, p.getPasseggeri().get(i).getCap());
				cmd.setString(9,p.getPasseggeri().get(i).getCitta());
				cmd.setString(10,p.getPasseggeri().get(i).getPaese());
				cmd.setString(11, p.getPasseggeri().get(i).getTipoDocumento());
				cmd.setString(12,p.getPasseggeri().get(i).getNumeroDocumento());
				cmd.setInt(13, p.getCodPrenotazione());
				cmd.executeUpdate();
				
				String sql1="UPDATE postoprenotato set isPrenotato='1',codFiscale=? WHERE codVolo=? and codPosto=?";
	            cmd = (PreparedStatement) conn.prepareStatement(sql1);
	            cmd.setString(1,p.getPasseggeri().get(i).getCodFiscale());
	        	cmd.setInt(2,p.getVolo().getCodVolo());
	        	 cmd.setString(3,p.getPasseggeri().get(i).getPosto());
	            cmd.executeUpdate();
				
				
				
				}
				cmd.close();
				return true;
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
	
	private synchronized void getMaxCod(Prenotazione p){
		Connection conn = null;
		PreparedStatement cmd = null;
		
		try {
			conn = DriverManagerConnectionPool.getConnection();
		String sql4 ="select MAX(codPrenotazione) as maxCod from prenotazione";
		cmd = (PreparedStatement) conn.prepareStatement(sql4);
		ResultSet res = cmd.executeQuery();
		if(res.next()){
		p.setCodPrenotazione(res.getInt("maxCod"));
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
		
	}
	
	public synchronized void setCheckInIsDone(int codPrenotazione){
		Connection conn = null;
		PreparedStatement cmd = null;
		try {
			conn = DriverManagerConnectionPool.getConnection();
			String sql1="UPDATE prenotazione set checkInIsDone='1' WHERE codPrenotazione=?";
            cmd = (PreparedStatement) conn.prepareStatement(sql1);
            cmd.setInt(1,codPrenotazione);
            cmd.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
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
	public synchronized Boolean getCheckInIsDone(int codPrenotazione){
		Connection conn = null;
		PreparedStatement ps = null;
		Boolean result = false;
		try {
	
			conn = DriverManagerConnectionPool.getConnection();
			ps = (PreparedStatement) conn.prepareStatement("SELECT checkInIsDone FROM prenotazione WHERE codPrenotazione= ?");
			ps.setInt(1, codPrenotazione);

			ResultSet res = ps.executeQuery();

			if (res.next()) {
				result = res.getBoolean("checkInIsDone");
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
		return result;
	}
}
