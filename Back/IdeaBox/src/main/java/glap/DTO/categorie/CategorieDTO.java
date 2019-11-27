package glap.DTO.categorie;

import java.util.Set;

import glap.model.Idee;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CategorieDTO {
	private Integer id;
	private String categoriecol;
	private String description;
	private String titre;
	private Set<Idee> idees;


	public CategorieDTO (Set<Idee> idees, String description, String titre) {
		this.description=description;
		this.titre=titre;
		this.idees=idees;
	}


}
