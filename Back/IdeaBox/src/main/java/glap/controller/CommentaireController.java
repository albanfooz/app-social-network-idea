package glap.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import glap.DTO.CommentaireDTO;
import glap.service.impl.CommentaireService;
import glap.service.impl.MembreService;

@RestController
@RequestMapping("/commentaires")
public class CommentaireController {
	private CommentaireService commentaireService;

	@Autowired
	public CommentaireController( CommentaireService cService) {
		this.commentaireService = cService;
	}
	@Autowired
	private MembreService membreService;

	@GetMapping
	@RequestMapping("/idee-{id}")
	public List<CommentaireDTO> findForIdee(@PathVariable int id) {
		List<CommentaireDTO> result =this.commentaireService.findForIdea(id);
		return result;
	}

	@GetMapping
	@RequestMapping("/commentaire-{id}")
	public List<CommentaireDTO> findForCommentaire(@PathVariable int id) {
		List<CommentaireDTO> result = this.commentaireService.findForComment(id);

		return result;
	}

	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public CommentaireDTO saveOnIdee(@RequestBody CommentaireDTO c) {
		CommentaireDTO result= this.commentaireService.addOnIdee(c);
		return result;
	}

	@PostMapping
	@RequestMapping("/reponse")
	@ResponseStatus(HttpStatus.CREATED)
	public CommentaireDTO saveOnCommentaire(@RequestBody CommentaireDTO c) {
		CommentaireDTO result= this.commentaireService.addOnCommentaire(c);
		return result;
	}

	@PutMapping
	@RequestMapping("/modifier-{id}")
	public CommentaireDTO update(@PathVariable Integer id, @RequestBody CommentaireDTO com) {
		String contenu=com.getContenu();
		CommentaireDTO result=this.commentaireService.update(id, contenu);
		return result;
	}

	/**
	 * L'url ici est "/messages/id", ou l'id est un entier fournit par le client
	 * @param id : id du message
	 * @return
	 */
	@DeleteMapping
	@RequestMapping("/supprimer-{id}")
	public void removeById(@PathVariable Integer id) {
		this.commentaireService.delete(id);
	}

	@GetMapping ("/membre/{idMembre}")
	@ResponseBody
	// recupérer ici la methode findCommentaireByMmebre de Mmembre service
	public List<Integer> findCommentaireByMember (@PathVariable Integer idMembre) {
		return this.membreService.findCommentaireByMember(idMembre);
	}


}
