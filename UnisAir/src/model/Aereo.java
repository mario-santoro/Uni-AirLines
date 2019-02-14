package model;

import java.util.ArrayList;

public class Aereo {
	private int codAereo;
	private String nome;
	private ArrayList<Posto> posti;
	public Aereo(){}
	
	public Aereo(int codAereo, String nome) {
		super();
		this.codAereo = codAereo;
		this.nome = nome;
	}
	public int getCodAereo() {
		return codAereo;
	}
	public void setCodAereo(int codAereo) {
		this.codAereo = codAereo;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public ArrayList<Posto> getPosti() {
		return posti;
	}
	public void setPosti(ArrayList<Posto> posti) {
		this.posti = posti;
	}
	
}
