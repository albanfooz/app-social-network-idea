package glap.DTO;

import java.time.LocalDateTime;
import java.util.Set;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class IdeeDTO {

	private Integer id;
	private String description;
	private String titre;
	private Set<Integer> collaborateurIds;
	private Integer membreId;
	private Integer categorieId;
	private Integer score;
	private LocalDateTime createdAt;
	private LocalDateTime  deletedAt;
}
