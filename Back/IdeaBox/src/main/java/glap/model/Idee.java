package glap.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.Set;


/**
 * The persistent class for the idee database table.
 * 
 */
@Entity
@Table(name="idee")
@NamedQuery(name="Idee.findAll", query="SELECT i FROM Idee i")
public class Idee implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_at", nullable=false)
	private Date createdAt;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="delete_at")
	private Date deleteAt;

	@Lob
	@Column(nullable=false)
	private String description;

	@Column(nullable=false, length=500)
	private String titre;

	//bi-directional many-to-one association to Commentaire
	@OneToMany(mappedBy="idee")
	private Set<Commentaire> commentaires;

	//bi-directional many-to-one association to Fichier
	@OneToMany(mappedBy="idee")
	private Set<Fichier> fichiers;

	//bi-directional many-to-one association to Categorie
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="type_id", nullable=false)
	private Categorie categorie;

	//bi-directional many-to-one association to Role
	@OneToMany(mappedBy="idee")
	private Set<Role> roles;

	//bi-directional many-to-many association to Tag
	@ManyToMany(mappedBy="idees")
	private Set<Tag> tags;

	//bi-directional many-to-one association to Vote
	@OneToMany(mappedBy="idee")
	private Set<Vote> votes;

	public Idee() {
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

	public Date getDeleteAt() {
		return this.deleteAt;
	}

	public void setDeleteAt(Date deleteAt) {
		this.deleteAt = deleteAt;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTitre() {
		return this.titre;
	}

	public void setTitre(String titre) {
		this.titre = titre;
	}

	public Set<Commentaire> getCommentaires() {
		return this.commentaires;
	}

	public void setCommentaires(Set<Commentaire> commentaires) {
		this.commentaires = commentaires;
	}

	public Commentaire addCommentaire(Commentaire commentaire) {
		getCommentaires().add(commentaire);
		commentaire.setIdee(this);

		return commentaire;
	}

	public Commentaire removeCommentaire(Commentaire commentaire) {
		getCommentaires().remove(commentaire);
		commentaire.setIdee(null);

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
		fichier.setIdee(this);

		return fichier;
	}

	public Fichier removeFichier(Fichier fichier) {
		getFichiers().remove(fichier);
		fichier.setIdee(null);

		return fichier;
	}

	public Categorie getCategorie() {
		return this.categorie;
	}

	public void setCategorie(Categorie categorie) {
		this.categorie = categorie;
	}

	public Set<Role> getRoles() {
		return this.roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public Role addRole(Role role) {
		getRoles().add(role);
		role.setIdee(this);

		return role;
	}

	public Role removeRole(Role role) {
		getRoles().remove(role);
		role.setIdee(null);

		return role;
	}

	public Set<Tag> getTags() {
		return this.tags;
	}

	public void setTags(Set<Tag> tags) {
		this.tags = tags;
	}

	public Set<Vote> getVotes() {
		return this.votes;
	}

	public void setVotes(Set<Vote> votes) {
		this.votes = votes;
	}

	public Vote addVote(Vote vote) {
		getVotes().add(vote);
		vote.setIdee(this);

		return vote;
	}

	public Vote removeVote(Vote vote) {
		getVotes().remove(vote);
		vote.setIdee(null);

		return vote;
	}

}