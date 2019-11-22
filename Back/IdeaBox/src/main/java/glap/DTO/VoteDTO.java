package glap.DTO;

import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnore;

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
	@JsonIgnore
	private Commentaire commentaire;
	//idee parent
	@JsonIgnore
	private Idee idee;
	//membre parent
	@NotNull
	@JsonIgnore
	private Membre membre;
}
