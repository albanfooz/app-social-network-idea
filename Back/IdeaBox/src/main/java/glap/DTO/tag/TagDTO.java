package glap.DTO.tag;

import java.util.Set;

import glap.model.Idee;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class TagDTO {
	private Integer id;
	private String titre;
	private Set<Idee> Idees;
	
	
	public TagDTO(String titre, Set<Idee> idees) {
		super();
		this.titre = titre;
		Idees = idees;
	}
	
	

}
