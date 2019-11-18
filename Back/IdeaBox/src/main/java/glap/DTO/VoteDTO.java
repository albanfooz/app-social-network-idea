package glap.DTO;

import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class VoteDTO {
	private Integer id;
	private Boolean positif;
	private Integer idCommentaire;
	private Integer idIdee;
	@NotNull
	private Integer idMembre;
}
