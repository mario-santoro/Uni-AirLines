package model;

import java.util.ArrayList;
import java.util.GregorianCalendar;

public class Prenotazione {
	private int codPrenotazione;
	private String data;
	private String ora;
	private double prezzoTotale;
	private String proprietarioCarta;
	private int numCarta;
	private String scadenzaCarta;
	private int cvv;
	private int numBiglietti;
	private int numBagagliTot;
	private String email;
	private boolean isChangeVolo;
	private ArrayList<Passeggero> passeggeri;
	private Volo volo;
	
	public Prenotazione() {
		this.passeggeri=new ArrayList<Passeggero>();
	}
	
	
	public Prenotazione(int codPrenotazione, String data, String ora, double prezzoTotale,int numBagagliTot,
			String proprietarioCarta, int numCarta, String scadenzaCarta, int cvv, int numBiglietti,
			String email, Volo volo, boolean isChangeVolo, ArrayList<Passeggero> passeggeri) {
		this.codPrenotazione = codPrenotazione;
		this.data = data;
		this.ora = ora;
		this.prezzoTotale = prezzoTotale;
		this.proprietarioCarta = proprietarioCarta;
		this.numBagagliTot=numBagagliTot;
		this.numCarta = numCarta;
		this.scadenzaCarta = scadenzaCarta;
		this.cvv = cvv;
		this.numBiglietti = numBiglietti;
		this.email = email;
		this.volo = volo;
		this.isChangeVolo = isChangeVolo;
		this.passeggeri = passeggeri;
	}


	public int getCodPrenotazione() {
		return codPrenotazione;
	}


	public void setCodPrenotazione(int codPrenotazione) {
		this.codPrenotazione = codPrenotazione;
	}


	public String getData() {
		return data;
	}


	public Volo getVolo() {
		return volo;
	}


	public void setVolo(Volo volo) {
		this.volo = volo;
	}


	public void setData(String data) {
		this.data = data;
	}


	public String getOra() {
		return ora;
	}


	public void setOra(String ora) {
		this.ora = ora;
	}


	public double getPrezzoTotale() {
		return prezzoTotale;
	}


	public void setPrezzoTotale(double prezzoTotale) {
		this.prezzoTotale = prezzoTotale;
	}


	public String getProprietarioCarta() {
		return proprietarioCarta;
	}


	public void setProprietarioCarta(String proprietarioCarta) {
		this.proprietarioCarta = proprietarioCarta;
	}


	public int getNumCarta() {
		return numCarta;
	}


	public void setNumCarta(int numCarta) {
		this.numCarta = numCarta;
	}


	public String getScadenzaCarta() {
		return scadenzaCarta;
	}


	public void setScadenzaCarta(String scadenzaCarta) {
		this.scadenzaCarta = scadenzaCarta;
	}


	public int getCvv() {
		return cvv;
	}


	public void setCvv(int cvv) {
		this.cvv = cvv;
	}


	public int getNumBiglietti() {
		return numBiglietti;
	}


	public void setNumBiglietti(int numBiglietti) {
		this.numBiglietti = numBiglietti;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	

	public boolean isChangeVolo() {
		return isChangeVolo;
	}


	public void setChangeVolo(boolean isChangeVolo) {
		this.isChangeVolo = isChangeVolo;
	}


	public ArrayList<Passeggero> getPasseggeri() {
		return passeggeri;
	}


	public void setPasseggeri(Passeggero p) {
		passeggeri.add(p);
	}
	
	public void setPasseggeri(ArrayList<Passeggero> passeggeri) {
		this.passeggeri = passeggeri;
	}

	public int getNumBagagliTot() {
		return numBagagliTot;
	}


	public void setNumBagagliTot(int numBagagliTot) {
		this.numBagagliTot = numBagagliTot;
	}


	
	
	
	}
