package glap.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the vote database table.
 * 
 */
@Entity
@Table(name="vote")
@NamedQuery(name="Vote.findAll", query="SELECT v FROM Vote v")
public class Vote implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_at", nullable=false)
	private Date createdAt;

	private byte positif;

	//bi-directional many-to-one association to Commentaire
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="commentaire_id")
	private Commentaire commentaire;

	//bi-directional many-to-one association to Idee
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="idee_id")
	private Idee idee;

	//bi-directional many-to-one association to Membre
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="membre_id", nullable=false)
	private Membre membre;

	public Vote() {
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

	public byte getPositif() {
		return this.positif;
	}

	public void setPositif(byte positif) {
		this.positif = positif;
	}

	public Commentaire getCommentaire() {
		return this.commentaire;
	}

	public void setCommentaire(Commentaire commentaire) {
		this.commentaire = commentaire;
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

}