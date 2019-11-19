package glap.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Set;


/**
 * The persistent class for the membre database table.
 * 
 */
@Entity
@Table(name="membre")
@NamedQuery(name="Membre.findAll", query="SELECT m FROM Membre m")
public class Membre implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	//bi-directional many-to-many association to Idee
	@ManyToMany
	@JoinTable(
		name="collaborateur"
		, joinColumns={
			@JoinColumn(name="membre_id", nullable=false)
			}
		, inverseJoinColumns={
			@JoinColumn(name="idee_id", nullable=false)
			}
		)
	private Set<Idee> idees1;

	//bi-directional many-to-one association to Commentaire
	@OneToMany(mappedBy="membre")
	private Set<Commentaire> commentaires;

	//bi-directional many-to-one association to Fichier
	@OneToMany(mappedBy="membre")
	private Set<Fichier> fichiers;

	//bi-directional many-to-one association to Idee
	@OneToMany(mappedBy="membre")
	private Set<Idee> idees2;

	//bi-directional many-to-one association to Profil
	@OneToMany(mappedBy="membre")
	private Set<Profil> profils;

	//bi-directional many-to-one association to Vote
	@OneToMany(mappedBy="membre")
	private Set<Vote> votes;

	public Membre() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Set<Idee> getIdees1() {
		return this.idees1;
	}

	public void setIdees1(Set<Idee> idees1) {
		this.idees1 = idees1;
	}

	public Set<Commentaire> getCommentaires() {
		return this.commentaires;
	}

	public void setCommentaires(Set<Commentaire> commentaires) {
		this.commentaires = commentaires;
	}

	public Commentaire addCommentaire(Commentaire commentaire) {
		getCommentaires().add(commentaire);
		commentaire.setMembre(this);

		return commentaire;
	}

	public Commentaire removeCommentaire(Commentaire commentaire) {
		getCommentaires().remove(commentaire);
		commentaire.setMembre(null);

		return commentaire;
	}

	public Set<Fichier> getFichiers() {
		return this.fichiers;
	}

	public void setFichiers(Set<Fichier> fichiers) {
		this.fichiers = fichiers;
	}

	public Fichier addFichier(Fichier fichier) {
		getFichiers().add(fichier);
		fichier.setMembre(this);

		return fichier;
	}

	public Fichier removeFichier(Fichier fichier) {
		getFichiers().remove(fichier);
		fichier.setMembre(null);

		return fichier;
	}

	public Set<Idee> getIdees2() {
		return this.idees2;
	}

	public void setIdees2(Set<Idee> idees2) {
		this.idees2 = idees2;
	}

	public Idee addIdees2(Idee idees2) {
		getIdees2().add(idees2);
		idees2.setMembre(this);

		return idees2;
	}

	public Idee removeIdees2(Idee idees2) {
		getIdees2().remove(idees2);
		idees2.setMembre(null);

		return idees2;
	}

	public Set<Profil> getProfils() {
		return this.profils;
	}

	public void setProfils(Set<Profil> profils) {
		this.profils = profils;
	}

	public Profil addProfil(Profil profil) {
		getProfils().add(profil);
		profil.setMembre(this);

		return profil;
	}

	public Profil removeProfil(Profil profil) {
		getProfils().remove(profil);
		profil.setMembre(null);

		return profil;
	}

	public Set<Vote> getVotes() {
		return this.votes;
	}

	public void setVotes(Set<Vote> votes) {
		this.votes = votes;
	}

	public Vote addVote(Vote vote) {
		getVotes().add(vote);
		vote.setMembre(this);

		return vote;
	}

	public Vote removeVote(Vote vote) {
		getVotes().remove(vote);
		vote.setMembre(null);

		return vote;
	}

}