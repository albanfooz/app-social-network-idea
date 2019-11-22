package glap.DTO;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonIgnore;

import glap.model.Idee;
import glap.model.Membre;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class CommentaireDTO {
	private Integer id;
	private String contenu;
	private Date createdAt;
	private Integer idCommentaire;
	@JsonIgnore
	private Idee idee;
	@JsonIgnore
	private Membre membre;
	//	private Set<Vote> votes;

	//constructeur pour le test
	public CommentaireDTO(String contenu,Idee idee,Membre membre, Date createdAt){
		this.contenu=contenu;
		this.createdAt=createdAt;
		this.idee=idee;
		this.membre=membre;

	}
}


