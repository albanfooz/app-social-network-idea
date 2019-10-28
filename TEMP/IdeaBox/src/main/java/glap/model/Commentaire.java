package glap.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.Set;


/**
 * The persistent class for the commentaire database table.
 * 
 */
@Entity
@Table(name="commentaire")
@NamedQuery(name="Commentaire.findAll", query="SELECT c FROM Commentaire c")
public class Commentaire implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_at", nullable=false)
	private Date createdAt;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="deleted_at")
	private Date deletedAt;

	//bi-directional many-to-one association to Commentaire
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="commentaire_id")
	private Commentaire commentaire;

	//bi-directional many-to-one association to Commentaire
	@OneToMany(mappedBy="commentaire")
	private Set<Commentaire> commentaires;

	//bi-directional many-to-one association to Idee
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="idee_id", nullable=false)
	private Idee idee;

	//bi-directional many-to-one association to Membre
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="membre_id", nullable=false)
	private Membre membre;

	//bi-directional many-to-one association to Fichier
	@OneToMany(mappedBy="commentaireBean")
	private Set<Fichier> fichiers;

	//bi-directional many-to-one association to Vote
	@OneToMany(mappedBy="commentaire")
	private Set<Vote> votes;

	public Commentaire() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getCreatedAt() {
		return this.createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getDeletedAt() {
		return this.deletedAt;
	}

	public void setDeletedAt(Date deletedAt) {
		this.deletedAt = deletedAt;
	}

	public Commentaire getCommentaire() {
		return this.commentaire;
	}

	public void setCommentaire(Commentaire commentaire) {
		this.commentaire = commentaire;
	}

	public Set<Commentaire> getCommentaires() {
		return this.commentaires;
	}

	public void setCommentaires(Set<Commentaire> commentaires) {
		this.commentaires = commentaires;
	}

	public Commentaire addCommentaire(Commentaire commentaire) {
		getCommentaires().add(commentaire);
		commentaire.setCommentaire(this);

		return commentaire;
	}

	public Commentaire removeCommentaire(Commentaire commentaire) {
		getCommentaires().remove(commentaire);
		commentaire.setCommentaire(null);

		return commentaire;
	}

	public Idee getIdee() {
		return this.idee;
	}

	public void setIdee(Idee idee) {
		this.idee = idee;
	}

	public Membre getMembre() {
		return this.membre;
	}

	public void setMembre(Membre membre) {
		this.membre = membre;
	}

	public Set<Fichier> getFichiers() {
		return this.fichiers;
	}

	public void setFichiers(Set<Fichier> fichiers) {
		this.fichiers = fichiers;
	}

	public Fichier addFichier(Fichier fichier) {
		getFichiers().add(fichier);
		fichier.setCommentaireBean(this);

		return fichier;
	}

	public Fichier removeFichier(Fichier fichier) {
		getFichiers().remove(fichier);
		fichier.setCommentaireBean(null);

		return fichier;
	}

	public Set<Vote> getVotes() {
		return this.votes;
	}

	public void setVotes(Set<Vote> votes) {
		this.votes = votes;
	}

	public Vote addVote(Vote vote) {
		getVotes().add(vote);
		vote.setCommentaire(this);

		return vote;
	}

	public Vote removeVote(Vote vote) {
		getVotes().remove(vote);
		vote.setCommentaire(null);

		return vote;
	}

}