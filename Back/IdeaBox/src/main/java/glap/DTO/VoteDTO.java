package glap.DTO;

import javax.validation.constraints.NotNull;

import glap.model.Commentaire;
import glap.model.Idee;
import glap.model.Membre;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class VoteDTO {
	private Integer id;
	private Boolean positif;
	//commentaire parent
	private Commentaire commentaire;
	//idee parent
	private Idee idee;
	//membre parent
	@NotNull
	private Membre membre;
}
