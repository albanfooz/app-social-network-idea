package glap.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the role database table.
 * 
 */
@Entity
@Table(name="role")
@NamedQuery(name="Role.findAll", query="SELECT r FROM Role r")
public class Role implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private RolePK id;

	@Column(name="porteur_projet", nullable=false)
	private byte porteurProjet;

	//bi-directional many-to-one association to Idee
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="idee_id", nullable=false, insertable=false, updatable=false)
	private Idee idee;

	//bi-directional many-to-one association to Membre
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="membre_id", nullable=false, insertable=false, updatable=false)
	private Membre membre;

	public Role() {
	}

	public RolePK getId() {
		return this.id;
	}

	public void setId(RolePK id) {
		this.id = id;
	}

	public byte getPorteurProjet() {
		return this.porteurProjet;
	}

	public void setPorteurProjet(byte porteurProjet) {
		this.porteurProjet = porteurProjet;
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