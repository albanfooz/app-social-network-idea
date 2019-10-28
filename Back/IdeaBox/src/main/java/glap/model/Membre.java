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

	//bi-directional many-to-one association to Commentaire
	@OneToMany(mappedBy="membre")
	private Set<Commentaire> commentaires;

	//bi-directional many-to-one association to Fichier
	@OneToMany(mappedBy="membre")
	private Set<Fichier> fichiers;

	//bi-directional many-to-one association to Profil
	@OneToMany(mappedBy="membre")
	private Set<Profil> profils;

	//bi-directional many-to-one association to Role
	@OneToMany(mappedBy="membre")
	private Set<Role> roles;

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

	public Set<Role> getRoles() {
		return this.roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public Role addRole(Role role) {
		getRoles().add(role);
		role.setMembre(this);

		return role;
	}

	public Role removeRole(Role role) {
		getRoles().remove(role);
		role.setMembre(null);

		return role;
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