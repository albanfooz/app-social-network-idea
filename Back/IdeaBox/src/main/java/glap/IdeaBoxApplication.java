package glap;

import java.util.Calendar;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;

import glap.DTO.CommentaireDTO;
import glap.model.Idee;
import glap.model.Membre;
import glap.service.impl.CommentaireService;

@SpringBootApplication
public class IdeaBoxApplication {

	public static void main(String[] args) {
		//enlever toute la partie avant le =
		ConfigurableApplicationContext conteneurSpring =SpringApplication.run(IdeaBoxApplication.class, args);
		CommentaireService comServ = conteneurSpring.getBean(CommentaireService.class);

		//membre et idee pour le test
		Idee ideeModel=new Idee();
		Membre membreModel=new Membre();
		CommentaireDTO com = new CommentaireDTO("mon commentaire",ideeModel,membreModel,Calendar.getInstance().getTime());
		comServ.add(com);
	}

}
