package model;

public class LowCost extends Volo {
	private String img;
	private int percentuale,quant;
	private String nome;
public LowCost(){}

public LowCost(String img, int percentuale, int quant,String nome) {
	super();
	this.img = img;
	this.percentuale = percentuale;
	this.quant = quant;
	this.nome=nome;
}

public String getNome() {
	return nome;
}

public void setNome(String nome) {
	this.nome = nome;
}

public String getImg() {
	return img;
}

public void setImg(String img) {
	this.img = img;
}

public int getPercentuale() {
	return percentuale;
}

public void setPercentuale(int percentuale) {
	this.percentuale = percentuale;
}

public int getQuant() {
	return quant;
}

public void setQuant(int quant) {
	this.quant = quant;
}

}
