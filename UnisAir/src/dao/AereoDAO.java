package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import model.Aereo;
import model.Posto;



public class AereoDAO {


	public synchronized boolean doSave(Aereo a1) {
		Connection conn = null;
		PreparedStatement cmd = null;

		try {
			conn = DriverManagerConnectionPool.getConnection();
			String NuovoAereo = "INSERT INTO aereo(nomeAereo) VALUES(?)";
			cmd = (PreparedStatement) conn.prepareStatement(NuovoAereo);

	
			cmd.setString(1, a1.getNome());
			cmd.executeUpdate();

		
			
			String sql4 ="select MAX(cod_aereo) as maxCod from aereo";
			cmd = (PreparedStatement) conn.prepareStatement(sql4);
			ResultSet res = cmd.executeQuery();
			if(res.next()){
			a1.setCodAereo(res.getInt("maxCod"));
			}
			
			for(int i=0; i<a1.getPosti().size() ; i++){

				String PostoAereo = "INSERT INTO posto(numPosto,codAereo,tipologia) VALUES(?,?,?)";
				cmd = (PreparedStatement) conn.prepareStatement(PostoAereo);
				cmd.setString(1, a1.getPosti().get(i).getNumPosto());
				cmd.setInt(2, a1.getCodAereo());
				cmd.setString(3, a1.getPosti().get(i).getTipologia());
				cmd.executeUpdate();


			}

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

	public synchronized ArrayList<String> getCodPosti(int codAereo){
	ArrayList<String> posti= new ArrayList<String>();
				Connection conn = null;
		PreparedStatement cmd = null;

		try {
			conn = DriverManagerConnectionPool.getConnection();

			String sql ="SELECT numPosto FROM posto WHERE codAereo=?";
			cmd = (PreparedStatement) conn.prepareStatement(sql);
			cmd.setInt(1, codAereo);
			ResultSet res = cmd.executeQuery();
			while(res.next()){
			posti.add(res.getString("numPosto"));
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
		
		
		
		return posti;
	}
	public synchronized int maxAereo(){
		int maxcod=0;
		
		Connection conn = null;
		PreparedStatement cmd = null;

		try {
			conn = DriverManagerConnectionPool.getConnection();
			

		
			
			String sql4 ="select MAX(cod_aereo) as maxCod from aereo";
			cmd = (PreparedStatement) conn.prepareStatement(sql4);
			ResultSet res = cmd.executeQuery();
			if(res.next()){
			maxcod=res.getInt("maxCod")+1;
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
		
		
		
		return maxcod;
	}
	
	
public synchronized ArrayList<Integer> availableAir(String data,String oraPartenza, String oraArrivo){
	ArrayList<Integer> codici =new ArrayList<Integer>();
	Connection conn = null;
	PreparedStatement ps = null;
	try {
		conn = DriverManagerConnectionPool.getConnection();
		ps = (PreparedStatement) conn
				.prepareStatement("SELECT cod_aereo FROM aereo WHERE cod_aereo not in "
						+ "(SELECT aereo.cod_aereo FROM aereo join  volo on aereo.cod_aereo=volo.cod_aereo "
						+ " WHERE dat=? and (oraArrivo>=? and oraPartenza<=?));");
		ps.setString(1, data);
		ps.setString(2, oraPartenza);
		ps.setString(3, oraArrivo);
		ResultSet res = ps.executeQuery();
		
		while (res.next()) {
			codici.add(res.getInt("cod_aereo"));
			
			
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
	
	return codici;
}

public synchronized ArrayList<Posto> getPostiPrenotabili(int codVolo){
ArrayList<Posto> posti= new ArrayList<Posto>();
			Connection conn = null;
	PreparedStatement cmd = null;
	Posto p;
	try {
		conn = DriverManagerConnectionPool.getConnection();

		String sql ="SELECT tipologia,isPrenotato,postoprenotato.codPosto FROM `postoprenotato`join "
				+ "posto on postoprenotato.codAereo=posto.codAereo and postoprenotato.codPosto=posto.numPosto WHERE codVolo=?";
		cmd = (PreparedStatement) conn.prepareStatement(sql);
		cmd.setInt(1, codVolo);
		ResultSet res = cmd.executeQuery();
		while(res.next()){
			p=new Posto();
		p.setNumPosto(res.getString("codPosto"));
		p.setPrenotato(res.getBoolean("isPrenotato"));
		p.setTipologia(res.getString("tipologia"));
		posti.add(p);
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
	
	
	
	return posti;
}

}
