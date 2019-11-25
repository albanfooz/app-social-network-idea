package glap.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;


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
	private Integer id;

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

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
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
		this.getIdees().add(idee);
		idee.setCategorie(this);

		return idee;
	}

	public Idee removeIdee(Idee idee) {
		this.getIdees().remove(idee);
		idee.setCategorie(null);

		return idee;
	}

}