package glap.DTO;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommentaireDTO {
	private Integer id;
	private String contenu;
	private Date createdAt;
	private Integer idCommentaire;
	private Integer idIdee;
	private Integer idMembre;
}


