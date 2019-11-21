package glap.DTO.profil;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProfilDTO {
	Integer id;
	String login; //Pseudo
	String mdp;
	Integer score;
	LocalDateTime createdAt;
	LocalDateTime deletedAt;
}
