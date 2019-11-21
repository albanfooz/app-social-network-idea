package glap.DTO;

import java.util.Date;
import java.util.Set;

import glap.model.Categorie;
import glap.model.Commentaire;
import glap.model.Fichier;
import glap.model.Membre;
import glap.model.Tag;
import glap.model.Vote;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class IdeeDTO {

	private int id;
	private Date createdAt;
	private String description;
	private String titre;
	private Set<Membre> collaborateurs;
	private Set<Commentaire> commentaires;
	private Set<Fichier> fichiers;
	private Membre membre;
	private Categorie categorie;
	private Set<Tag> tags;
	private Set<Vote> votes;

	//constructeur pour le test
	public IdeeDTO(Date createdAt,String description,String titre,Membre membre,Categorie categorie){
		this.createdAt=createdAt;
		this.description=description;
		this.titre=titre;
		this.membre=membre;
		this.categorie=categorie;
	}
}
