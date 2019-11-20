package glap.DTO.role;

import glap.model.Idee;
import glap.model.Membre;
import glap.model.RolePK;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class RoleDTO {
	private RolePK id;
	private byte porteurProjet;
	private Idee idee;
	private Membre membre;
	
	
	public RoleDTO(byte porteurProjet, Idee idee, Membre membre) {
		super();
		this.porteurProjet = porteurProjet;
		this.idee = idee;
		this.membre = membre;
	}
	
	
}
