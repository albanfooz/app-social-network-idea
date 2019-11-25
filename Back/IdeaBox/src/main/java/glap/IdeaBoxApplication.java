package glap;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class IdeaBoxApplication {

	public static void main(String[] args) {
		SpringApplication.run(IdeaBoxApplication.class, args);

		//membre et idee pour le test
		Idee ideeModel=new Idee();
		Membre membreModel=new Membre();
		CommentaireDTO com = new CommentaireDTO("mon commentaire",ideeModel,membreModel,Calendar.getInstance().getTime());
		comServ.add(com);
	}
}
