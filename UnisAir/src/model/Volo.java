package model;



public class Volo {
	private int codVolo;
	private String aeroportoPartenza;
	private String aeroportoDestinazione;
	private String data;
	private String oraPartenza;
	private String oraArrivo;
	private String durataVolo;
	private double prezzoEconomy,prezzoBusiness,prezzoPremium;
	private int cod_aereo;
	private boolean isDelete=false;
	private boolean isNextDay=false;
public Volo(){
}

public Volo( String aeroportoPartenza, String aeroportoDestinazione, String data,
		String oraPartenza, String oraArrivo, String durataVolo, double prezzoEconomy, double prezzoBusiness,
		double prezzoPremium,int cod_aereo) {

	this.aeroportoPartenza = aeroportoPartenza;
	this.aeroportoDestinazione = aeroportoDestinazione;
	this.data = data;
	this.oraPartenza = oraPartenza;
	this.oraArrivo = oraArrivo;
	this.durataVolo = durataVolo;
	this.prezzoEconomy = prezzoEconomy;
	this.prezzoBusiness = prezzoBusiness;
	this.prezzoPremium = prezzoPremium;
	this.cod_aereo=cod_aereo;
}

public int getCodVolo() {
	return codVolo;
}

public void setCodVolo(int codVolo) {
	this.codVolo = codVolo;
}

public String getAeroportoPartenza() {
	return aeroportoPartenza;
}

public void setAeroportoPartenza(String aeroportoPartenza) {
	this.aeroportoPartenza = aeroportoPartenza;
}

public String getAeroportoDestinazione() {
	return aeroportoDestinazione;
}

public void setAeroportoDestinazione(String aeroportoDestinazione) {
	this.aeroportoDestinazione = aeroportoDestinazione;
}


public String getData() {
	return data;
}

public void setData(String data) {
	this.data = data;
}

public String getOraPartenza() {
	return oraPartenza;
}

public void setOraPartenza(String oraPartenza) {
	this.oraPartenza = oraPartenza;
}

public String getOraArrivo() {
	return oraArrivo;
}

public void setOraArrivo(String oraArrivo) {
	this.oraArrivo = oraArrivo;
}

public String getDurataVolo() {
	return durataVolo;
}

public void setDurataVolo(String durataVolo) {
	this.durataVolo = durataVolo;
}

public double getPrezzoEconomy() {
	return prezzoEconomy;
}

public void setPrezzoEconomy(double prezzoEconomy) {
	this.prezzoEconomy = prezzoEconomy;
}

public double getPrezzoBusiness() {
	return prezzoBusiness;
}

public void setPrezzoBusiness(double prezzoBusiness) {
	this.prezzoBusiness = prezzoBusiness;
}

public double getPrezzoPremium() {
	return prezzoPremium;
}

public void setPrezzoPremium(double prezzoPremium) {
	this.prezzoPremium = prezzoPremium;
}

public int getCod_aereo() {
	return cod_aereo;
}

public void setCod_aereo(int cod_aereo) {
	this.cod_aereo = cod_aereo;
}

public boolean isDelete() {
	return isDelete;
}

public void setDelete(boolean isDelete) {
	this.isDelete = isDelete;
}

public boolean isNextDay() {
	return isNextDay;
}

public void setNextDay(boolean isNextDay) {
	this.isNextDay = isNextDay;
}


}
