package glap.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the profil database table.
 * 
 */
@Entity
@Table(name="profil")
@NamedQuery(name="Profil.findAll", query="SELECT p FROM Profil p")
public class Profil implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="ceated_at", nullable=false)
	private Date ceatedAt;

	@Column(nullable=false, length=200)
	private String login;

	@Column(length=200)
	private String nom;

	@Column(nullable=false, length=200)
	private String password;

	@Column(length=200)
	private String prenom;

	@Column(nullable=false)
	private int score;

	//bi-directional many-to-one association to Fichier
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="fichier_id", nullable=false)
	private Fichier fichier;

	//bi-directional many-to-one association to Membre
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="membre_id", nullable=false)
	private Membre membre;

	public Profil() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getCeatedAt() {
		return this.ceatedAt;
	}

	public void setCeatedAt(Date ceatedAt) {
		this.ceatedAt = ceatedAt;
	}

	public String getLogin() {
		return this.login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getNom() {
		return this.nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPrenom() {
		return this.prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public int getScore() {
		return this.score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public Fichier getFichier() {
		return this.fichier;
	}

	public void setFichier(Fichier fichier) {
		this.fichier = fichier;
	}

	public Membre getMembre() {
		return this.membre;
	}

	public void setMembre(Membre membre) {
		this.membre = membre;
	}

}