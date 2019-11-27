package glap.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import glap.DTO.CommentaireDTO;
import glap.model.Commentaire;
import glap.repository.CommentaireRepository;
import glap.repository.IdeeRepository;
import glap.service.ICommentaireService;

/**
 *
 * Commentaire service
 *
 */
@Service
public class CommentaireService implements ICommentaireService {

	@Autowired
	private CommentaireRepository commentaireRepository;
	@Autowired
	private IdeeRepository ideeRepository;

	@Override
	public CommentaireDTO addOnIdee(CommentaireDTO com) {
		Commentaire comModel = new Commentaire();
		comModel.setContenu(com.getContenu());
		// code pour test
		comModel.setCreatedAt(com.getCreatedAt());
		comModel.setIdee(com.getIdee());
		comModel.setMembre(com.getIdMembre());
		//fin code pour test
		this.commentaireRepository.save(comModel);
		com.setId(comModel.getId());
		return com;
	}

	@Override
	public CommentaireDTO addOnCommentaire(CommentaireDTO com) {
		Commentaire comModel = new Commentaire();
		comModel.setContenu(com.getContenu());
		// code pour test
		comModel.setCreatedAt(com.getCreatedAt());
		comModel.setIdee(this.ideeRepository.findById((com.getIdIdee())));
		comModel.setMembre(com.getIdMembre());
		comModel.setCommentaire(com.getIdCommentaire());
		//fin code pour test
		this.commentaireRepository.save(comModel);
		com.setId(comModel.getId());
		return com;
	}

	@Override
	public void delete(int id) {
		this.commentaireRepository.delete(id);
	}

	@Override
	public Commentaire update(CommentaireDTO c, String message) {
		Commentaire com= new Commentaire ();
		Commentaire result=this.commentaireRepository.updateMessage(com, message);
		c.setId(result.getId());
		return result;
	}

	@Override
	public List<CommentaireDTO> findForComment(int id) {
		//obtenir la liste des commentaire aillant comme parent l'id de ce commentaire DTO
		List<Commentaire> list=this.commentaireRepository.findByCommentaireId(id);
		//faire une boucle forEach pour transformer les commentaires en commentairesDTO
		List<CommentaireDTO> result=new ArrayList<>();
		for (Commentaire commentaire : list) {
			result.add( new CommentaireDTO(commentaire.getContenu(),commentaire.getIdee(),commentaire.getMembre(),commentaire.getCreatedAt()));
		}
		return result;
	}

	@Override
	public List<CommentaireDTO> findForIdea(int id) {
		//obtenir la liste des commentaire aillant comme parent l'id de l'idée liée ce commentaire DTO
		List<Commentaire> list=this.commentaireRepository.findByIdeeId(id);
		//faire une boucle forEach pour transformer les commentaires en commentairesDTO
		List<CommentaireDTO> result=new ArrayList<>();
		for (Commentaire commentaire : list) {
			result.add( new CommentaireDTO(commentaire.getContenu(),commentaire.getIdee(),commentaire.getMembre(),commentaire.getCreatedAt()));
		}
		return result;
	}

}
