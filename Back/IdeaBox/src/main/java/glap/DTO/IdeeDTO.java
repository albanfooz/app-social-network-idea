package glap.DTO;

import java.util.Set;

import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

import glap.model.Categorie;
import glap.model.Commentaire;
import glap.model.Fichier;
import glap.model.Tag;
import glap.model.Vote;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class IdeeDTO {

	private String description;

	private String titre;

	private Set<Commentaire> commentaires;

	private Set<Fichier> fichiers;

	private Categorie categorie;


	//bi-directional many-to-many association to Tag
	@ManyToMany(mappedBy="idees")
	private Set<Tag> tags;

	//bi-directional many-to-one association to Vote
	@OneToMany(mappedBy="idee")
	private Set<Vote> votes;
}
