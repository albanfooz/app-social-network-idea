package glap.DTO.categorie;

import java.util.Set;

import glap.model.Idee;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class CategorieDTO {
	private Integer id;
	private String categoriecol;
	private String description;
	private String titre;
	private Set<Idee> idees;
	
	
	public CategorieDTO (String categoriecol, String description, String titre, Set<Idee> idees) {
		this.categoriecol=categoriecol;
		this.description=description;
		this.titre=titre;
		this.idees=idees;
	}
	
	
}
