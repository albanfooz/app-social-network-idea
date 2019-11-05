package glap.DTO;

import java.util.Date;

import glap.model.Membre;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommentaireDTO {
	private Integer id;
	private String texteCommentaire;
	private Date createdAt;
	private Membre membre;
}
