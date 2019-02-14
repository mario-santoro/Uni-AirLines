package model;

public class Utente {
	private String email;
	private String password;
	private String nome;
	private String cognome;
	private String tipoDocumento;
	private String numDocumento;
	private long numCartaCredito;
	private String ScadenzaCarta;
	private int CVC;
	public Utente() {
		
	}

	public Utente(String email, String password, String nome, String cognome, String tipoDocumento,String numDocumento) {
		this.email = email;
		this.password = password;
		this.nome = nome;
		this.cognome = cognome;
		this.tipoDocumento = tipoDocumento;
		this.numDocumento = numDocumento;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getTipoDocumento() {
		return tipoDocumento;
	}

	public void setTipoDocumento(String tipoDocumento) {
		this.tipoDocumento = tipoDocumento;
	}

	public String getNumDocumento() {
		return numDocumento;
	}

	public void setNumDocumento(String numDocumento) {
		this.numDocumento = numDocumento;
	}

	public long getNumCartaCredito() {
		return numCartaCredito;
	}

	public void setNumCartaCredito(long numCartaCredito) {
		this.numCartaCredito = numCartaCredito;
	}

	public String getScadenzaCarta() {
		return ScadenzaCarta;
	}

	public void setScadenzaCarta(String scadenzaCarta) {
		ScadenzaCarta = scadenzaCarta;
	}

	public int getCVC() {
		return CVC;
	}

	public void setCVC(int cVC) {
		CVC = cVC;
	}
	
	
}


