package noel.model;

public class Produits {

	private long idProd;
	private String nom;
	private long prix;
	private long qtProd;

	public Produits() {
		super();
		// TODO Auto-generated constructor stub
	}

	public long getQtProd() {
		return qtProd;
	}

	public void setQtProd(long qtProd) {
		this.qtProd = qtProd;
	}

	public Produits(String nom, long prix, long qtProd) {
		super();
		this.nom = nom;
		this.prix = prix;
		this.qtProd = qtProd;
	}

	public long getIdProd() {
		return idProd;
	}

	public void setIdProd(long idProd) {
		this.idProd = idProd;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public Long getPrix() {
		return prix;
	}

	public void setPrix(long prix) {
		this.prix = prix;
	}

}
