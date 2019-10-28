package glap.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Set;


/**
 * The persistent class for the categorie database table.
 * 
 */
@Entity
@Table(name="categorie")
@NamedQuery(name="Categorie.findAll", query="SELECT c FROM Categorie c")
public class Categorie implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	@Column(length=45)
	private String categoriecol;

	@Column(length=200)
	private String description;

	@Column(nullable=false, length=200)
	private String titre;

	//bi-directional many-to-one association to Idee
	@OneToMany(mappedBy="categorie")
	private Set<Idee> idees;

	public Categorie() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCategoriecol() {
		return this.categoriecol;
	}

	public void setCategoriecol(String categoriecol) {
		this.categoriecol = categoriecol;
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

	public Set<Idee> getIdees() {
		return this.idees;
	}

	public void setIdees(Set<Idee> idees) {
		this.idees = idees;
	}

	public Idee addIdee(Idee idee) {
		getIdees().add(idee);
		idee.setCategorie(this);

		return idee;
	}

	public Idee removeIdee(Idee idee) {
		getIdees().remove(idee);
		idee.setCategorie(null);

		return idee;
	}

}