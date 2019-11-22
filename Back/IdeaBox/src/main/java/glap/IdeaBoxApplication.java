package glap;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;

@SpringBootApplication
public class IdeaBoxApplication {

	public static void main(String[] args) {
		//enlever toute la partie avant le =
		ConfigurableApplicationContext conteneurSpring =SpringApplication.run(IdeaBoxApplication.class, args);


	}

}
