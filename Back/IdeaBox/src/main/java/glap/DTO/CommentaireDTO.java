package glap.DTO;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentaireDTO {
	private Integer id;
	private String contenu;
	private Date createdAt;
	private Integer idMembre;
	private Integer idIdee;
	private Integer idCommentaire;

	//	private Commentaire commentaire;
	//	@JsonIgnore
	//	private Idee idee;
	//	@JsonIgnore
	//	private Membre membre;
	//	//	private Set<Vote> votes;

	//constructeur pour commentaire Idee
	public CommentaireDTO(String contenu,Integer idIdee,Integer idMembre){
		this.contenu=contenu;
		this.idIdee=idIdee;
		this.idMembre=idMembre;
	}
	//constructeur pour commentaire reponse
	public CommentaireDTO(String contenu,Integer idIdee,Integer idMembre, Integer idCommentaire){
		this.contenu=contenu;
		this.idIdee=idIdee;
		this.idMembre=idMembre;
		this.idCommentaire=idCommentaire;

	}
}


