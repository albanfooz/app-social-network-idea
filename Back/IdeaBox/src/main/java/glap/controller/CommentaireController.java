package glap.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import glap.model.Commentaire;

@RestController
@RequestMapping("/commentaires")
public class CommentaireController {

	@GetMapping
	public List<Commentaire> findAll() {
		List<Commentaire> result = new ArrayList<>();
		return result;
	}

	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public Commentaire save(@RequestBody Commentaire m) {
		return m;
	}

	/**
	 * L'url ici est "/messages/id", ou l'id est un entier fournit par le client
	 * @param id : id du message
	 * @return
	 */
	@DeleteMapping
	@RequestMapping("/{id}")
	public String removeById(@PathVariable int id) {
		System.out.println("suppresion du commentaire : " + id);
		return "commentaire bien supprimé";
	}
}