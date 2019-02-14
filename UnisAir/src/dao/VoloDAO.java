package dao;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import model.LowCost;
import model.Volo;

public class VoloDAO {
	public synchronized boolean doSave(Volo v, ArrayList<String> posti){
		
		Connection conn = null;
		PreparedStatement cmd = null;
		try {
	
			conn = DriverManagerConnectionPool.getConnection();
			

		
				String sql = "INSERT INTO volo(aeroportoPartenza,aeroportoDestinazione,dat,oraPartenza,"
						+ "oraArrivo,isNextDay,durataVolo,prezzoEconomy,prezzoBusiness,prezzoPremium,cod_aereo)"
						+ " VALUES(?,?,?,?,?,?,?,?,?,?,?)";
				cmd = (PreparedStatement) conn.prepareStatement(sql);
				cmd.setString(1,v.getAeroportoPartenza());
				cmd.setString(2, v.getAeroportoDestinazione());
				cmd.setString(3, v.getData() );
				cmd.setString(4, v.getOraPartenza());
				cmd.setString(5, v.getOraArrivo());
				cmd.setBoolean(6, v.isNextDay());
				cmd.setString(7, v.getDurataVolo());
				cmd.setDouble(8, v.getPrezzoEconomy());
				cmd.setDouble(9, v.getPrezzoBusiness());
				cmd.setDouble(10, v.getPrezzoPremium());
				cmd.setInt(11, v.getCod_aereo());
				cmd.executeUpdate();
				
				getMaxCod(v);
				
				for(int i=0;i< posti.size();i++){
				String sql2="INSERT INTO postoprenotato(codPosto,codVolo,codAereo) VALUES (?,?,?)";
				cmd = (PreparedStatement) conn.prepareStatement(sql2);
				cmd.setString(1,posti.get(i));
				cmd.setInt(2, v.getCodVolo());
				cmd.setInt(3, v.getCod_aereo());
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
	
	private synchronized void getMaxCod(Volo v){
		Connection conn = null;
		PreparedStatement cmd = null;
		
		try {
			conn = DriverManagerConnectionPool.getConnection();
		String sql4 ="select MAX(codVolo) as maxCod from volo";
		cmd = (PreparedStatement) conn.prepareStatement(sql4);
		ResultSet res = cmd.executeQuery();
		if(res.next()){
		v.setCodVolo(res.getInt("maxCod"));
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
	
	public synchronized void doUpdate(Volo v) {

		Connection conn = null;
		PreparedStatement cmd = null;

		try {
			conn = DriverManagerConnectionPool.getConnection();

		
		
			
			
			String sql = " UPDATE volo SET aeroportoPartenza=?,aeroportoDestinazione=?,dat=?,oraPartenza=?,"
						+ "oraArrivo=?,isNextDay=?,durataVolo=?,prezzoEconomy=?,prezzoBusiness=?,prezzoPremium=?,cod_aereo=?  where codVolo=?";
			cmd = (PreparedStatement) conn.prepareStatement(sql);
			cmd.setString(1,v.getAeroportoPartenza());
			cmd.setString(2, v.getAeroportoDestinazione());
			cmd.setString(3, v.getData() );
			cmd.setString(4, v.getOraPartenza());
			cmd.setString(5, v.getOraArrivo());
			cmd.setBoolean(6, v.isNextDay());
			cmd.setString(7, v.getDurataVolo());
			cmd.setDouble(8, v.getPrezzoEconomy());
			cmd.setDouble(9, v.getPrezzoBusiness());
			cmd.setDouble(10, v.getPrezzoPremium());
			cmd.setInt(11, v.getCod_aereo());
			cmd.setInt(12, v.getCodVolo());
			cmd.executeUpdate();
			
			String sql1="UPDATE prenotazione set prenotazione.isChangeVolo='1' WHERE codVolo=?";
            cmd = (PreparedStatement) conn.prepareStatement(sql1);
            cmd.setInt(1,v.getCodVolo());
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

	public synchronized void doDelete(int cod) {

		Connection conn = null;
		PreparedStatement cmd = null;

		try {
			conn = DriverManagerConnectionPool.getConnection();

			String sql = "UPDATE volo SET isDelete=1 where codVolo=? ";
			cmd = (PreparedStatement) conn.prepareStatement(sql);
		
			cmd.setInt(1,cod);
			cmd.executeUpdate();
			
			

				String sql2="delete from postoprenotato where codVolo=?";
				cmd = (PreparedStatement) conn.prepareStatement(sql2);

				cmd.setInt(1, cod);
		
				cmd.executeUpdate();
				

				String sql3="delete from lowcost where codVolo=?";
				cmd = (PreparedStatement) conn.prepareStatement(sql3);
				cmd.setInt(1, cod);
		
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
	
	public synchronized ArrayList<Volo> showAll(String dataV,String ora) {

		ArrayList<Volo> voli = new ArrayList<Volo>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			Volo v;
			conn = DriverManagerConnectionPool.getConnection();

			String sql = "SELECT * FROM `volo` WHERE (dat>? or (dat=? and oraPartenza>?) ) and isDelete='false'";
			ps = (PreparedStatement) conn.prepareStatement(sql);
			ps.setString(1,dataV);
			ps.setString(2,dataV);
			ps.setString(3,ora);
			rs = ps.executeQuery();
			

			while (rs.next()) {
				v = new Volo();
						v.setCodVolo(rs.getInt("codVolo"));
						v.setAeroportoPartenza(rs.getString("aeroportoPartenza"));
						v.setAeroportoDestinazione(rs.getString("aeroportoDestinazione"));
						v.setData(rs.getString("dat")) ;
						v.setOraPartenza(rs.getString("oraPartenza"));
						v.setOraArrivo(rs.getString("oraArrivo"));
						v.setNextDay(rs.getBoolean("isNextDay"));
						v.setDurataVolo(rs.getString("durataVolo"));
						v.setPrezzoEconomy(rs.getDouble("prezzoEconomy"));
						v.setPrezzoBusiness(rs.getDouble("prezzoBusiness"));
						v.setPrezzoPremium(rs.getDouble("prezzoPremium"));
						v.setCod_aereo(rs.getInt("cod_aereo"));
				
				voli.add(v);
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
		return voli;
	}
	public synchronized Volo doRetriveByCod(int cod) {

		Volo v=new Volo();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
		
			conn = DriverManagerConnectionPool.getConnection();

			String sql = "SELECT * FROM `volo` WHERE codVolo=?";
			ps = (PreparedStatement) conn.prepareStatement(sql);
			ps.setInt(1,cod);
			
			rs = ps.executeQuery();
			

			while (rs.next()) {
				
						v.setCodVolo(rs.getInt("codVolo"));
						v.setAeroportoPartenza(rs.getString("aeroportoPartenza"));
						v.setAeroportoDestinazione(rs.getString("aeroportoDestinazione"));
						v.setData(rs.getString("dat")) ;
						v.setOraPartenza(rs.getString("oraPartenza"));
						v.setOraArrivo(rs.getString("oraArrivo"));
						v.setNextDay(rs.getBoolean("isNextDay"));
						v.setDurataVolo(rs.getString("durataVolo"));
						v.setPrezzoEconomy(rs.getDouble("prezzoEconomy"));
						v.setPrezzoBusiness(rs.getDouble("prezzoBusiness"));
						v.setPrezzoPremium(rs.getDouble("prezzoPremium"));
						v.setCod_aereo(rs.getInt("cod_aereo"));
				
				
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
		return v;
	}
	
	public synchronized boolean isLowCost(LowCost l){
		Connection conn = null;
		PreparedStatement cmd = null;
		try {
	
			conn = DriverManagerConnectionPool.getConnection();
		
				String sql = "INSERT INTO lowcost(img,codVolo,quant,percentuale,nome)VALUES(?,?,?,?,?)";
				cmd = (PreparedStatement) conn.prepareStatement(sql);
				cmd.setString(1, l.getImg());
				cmd.setInt(2, l.getCodVolo());
				cmd.setInt(3, l.getQuant() );
				cmd.setInt(4, l.getPercentuale());
				cmd.setString(5, l.getNome());
				cmd.executeUpdate();
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
	
	
	public synchronized ArrayList<LowCost> showAllLowCost(String dataV,String ora) {

		ArrayList<LowCost> voliLow = new ArrayList<LowCost>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			LowCost l;
			conn = DriverManagerConnectionPool.getConnection();
		
			String sql3="delete FROM lowcost WHERE  lowcost.codVolo in(SELECT volo.codvolo FROM `volo` WHERE dat<? or (dat=? and oraPartenza<?) ) ";
			ps = (PreparedStatement) conn.prepareStatement(sql3);
			ps.setString(1,dataV);
			ps.setString(2,dataV);
			ps.setString(3,ora);
			ps.executeUpdate();
			
		
			
			String sql = "SELECT * FROM lowcost join volo on lowcost.codVolo=volo.codVolo";
			ps = (PreparedStatement) conn.prepareStatement(sql);
		
			rs = ps.executeQuery();
			

			while (rs.next()) {
				l = new LowCost();
						l.setCodVolo(rs.getInt("codVolo"));
						l.setImg(rs.getString("img"));
						l.setPercentuale(rs.getInt("percentuale"));
						l.setNome(rs.getString("nome"));
						l.setQuant(rs.getInt("quant"));
						l.setPrezzoEconomy(rs.getDouble("prezzoEconomy"));
				voliLow.add(l);
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
		return voliLow;
	}
	public synchronized LowCost LowCostByCodVolo(int cod){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		LowCost l=new LowCost();
		try {
		
			conn = DriverManagerConnectionPool.getConnection();
		
		String sql = "SELECT * FROM lowcost join volo on lowcost.codVolo=volo.codVolo where volo.codVolo=?";
		ps = (PreparedStatement) conn.prepareStatement(sql);
		ps.setInt(1, cod);
		rs = ps.executeQuery();
		

		if (rs.next()) {
			
					l.setCodVolo(rs.getInt("codVolo"));
					l.setImg(rs.getString("img"));
					l.setPercentuale(rs.getInt("percentuale"));
					l.setNome(rs.getString("nome"));
					l.setQuant(rs.getInt("quant"));
					l.setAeroportoPartenza(rs.getString("aeroportoPartenza"));
					l.setAeroportoDestinazione(rs.getString("aeroportoDestinazione"));
					l.setData(rs.getString("dat")) ;
					l.setOraPartenza(rs.getString("oraPartenza"));
					l.setOraArrivo(rs.getString("oraArrivo"));
					l.setNextDay(rs.getBoolean("isNextDay"));
					l.setDurataVolo(rs.getString("durataVolo"));
					l.setPrezzoEconomy(rs.getDouble("prezzoEconomy"));
					l.setPrezzoBusiness(rs.getDouble("prezzoBusiness"));
					l.setPrezzoPremium(rs.getDouble("prezzoPremium"));
					l.setCod_aereo(rs.getInt("cod_aereo"));
			
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
	return l;
}
	
	
}
