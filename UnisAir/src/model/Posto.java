package model;

public class Posto {
private	String numPosto;  //A1
private String tipologia; //economy, business e premium
private int codAereo;

private boolean isPrenotato;
	public Posto(){}
	public Posto(String numPosto, String tipologia,int codAereo) {
		super();
		this.numPosto = numPosto;
		this.tipologia=tipologia;
		this.codAereo = codAereo;
	}
	public String getNumPosto() {
		return numPosto;
	}
	public void setNumPosto(String numPosto) {
		this.numPosto = numPosto;
	}

	public boolean isPrenotato() {
		return isPrenotato;
	}
	public void setPrenotato(boolean isPrenotato) {
		this.isPrenotato = isPrenotato;
	}
	public String getTipologia() {
		return tipologia;
	}
	public void setTipologia(String tipologia) {
		this.tipologia = tipologia;
	}
	public int getCodAereo() {
		return codAereo;
	}
	public void setCodAereo(int codAereo) {
		this.codAereo = codAereo;
	}
	
	
}
