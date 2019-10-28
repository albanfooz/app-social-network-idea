package glap.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Set;


/**
 * The persistent class for the tag database table.
 * 
 */
@Entity
@Table(name="tag")
@NamedQuery(name="Tag.findAll", query="SELECT t FROM Tag t")
public class Tag implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	@Column(nullable=false, length=200)
	private String titre;

	//bi-directional many-to-many association to Idee
	@ManyToMany
	@JoinTable(
		name="marquer"
		, joinColumns={
			@JoinColumn(name="tag_id", nullable=false)
			}
		, inverseJoinColumns={
			@JoinColumn(name="idee_id", nullable=false)
			}
		)
	private Set<Idee> idees;

	public Tag() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitre() {
		return this.titre;
	}

	public void setTitre(String titre) {
		this.titre = titre;
	}

	public Set<Idee> getIdees() {
		return this.idees;
	}

	public void setIdees(Set<Idee> idees) {
		this.idees = idees;
	}

}