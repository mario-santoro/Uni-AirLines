package model;

public class Passeggero {
	private String codFiscale;
	//prezzo risultante dalla quantità dei bagagli scelta dal passeggero
	private double tariffaBagaglio;
	//quantità bagagli
	private int numBagaglio;
	private String nome;
	private String cognome;
	private int eta;
	private String indirizzo;
	private int cap;
	private String citta;
	private String paese;
	private String tipoDocumento;
	private String numeroDocumento;
	private boolean checkIsDone;
	private String posto;
	
	public Passeggero() {
		
	}


	
	

	public Passeggero(String codFiscale, double tariffaBagaglio, int numBagaglio, String nome, String cognome,
			int eta, String indirizzo, int cap, String citta, String paese, String tipoDocumento,
			String numeroDocumento,String posto) {
		this.codFiscale = codFiscale;
		this.tariffaBagaglio = tariffaBagaglio;
		this.numBagaglio =numBagaglio ;
		this.nome = nome;
		this.cognome = cognome;
		this.eta = eta;
		this.indirizzo = indirizzo;
		this.cap = cap;
		this.citta = citta;
		this.paese = paese;
		this.tipoDocumento = tipoDocumento;
		this.numeroDocumento = numeroDocumento;
		this.posto=posto;
	}





	public String getPosto() {
		return posto;
	}





	public void setPosto(String posto) {
		this.posto = posto;
	}





	public String getCodFiscale() {
		return codFiscale;
	}


	public void setCodFiscale(String codFiscale) {
		this.codFiscale = codFiscale;
	}


	public double getTariffaBagaglio() {
		return tariffaBagaglio;
	}


	public void setTariffaBagaglio(double tariffaBagaglio) {
		this.tariffaBagaglio = tariffaBagaglio;
	}


	

	public int getNumBagaglio() {
		return numBagaglio;
	}





	public void setNumBagaglio(int numBagaglio) {
		this.numBagaglio = numBagaglio;
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


	public int getEta() {
		return eta;
	}


	public void setEta(int eta) {
		this.eta = eta;
	}


	public String getIndirizzo() {
		return indirizzo;
	}


	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}


	public int getCap() {
		return cap;
	}


	public void setCap(int cap) {
		this.cap = cap;
	}


	public String getCitta() {
		return citta;
	}


	public void setCitta(String citta) {
		this.citta = citta;
	}


	public String getPaese() {
		return paese;
	}


	public void setPaese(String paese) {
		this.paese = paese;
	}


	public String getTipoDocumento() {
		return tipoDocumento;
	}


	public void setTipoDocumento(String tipoDocumento) {
		this.tipoDocumento = tipoDocumento;
	}


	public String getNumeroDocumento() {
		return numeroDocumento;
	}


	public void setNumeroDocumento(String numeroDocumento) {
		this.numeroDocumento = numeroDocumento;
	}





	
	

	
}
