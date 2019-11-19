package glap.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import glap.DTO.CommentaireDTO;
import glap.model.Commentaire;
import glap.repository.CommentaireRepository;
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

	@Override
	public CommentaireDTO add(CommentaireDTO com) {
		Commentaire comModel = new Commentaire();

		comModel.setContenu(com.getContenu());
		// code pour test
		comModel.setCreatedAt(com.getCreatedAt());
		comModel.setIdee(com.getIdee());
		comModel.setMembre(com.getMembre());
		//fin code pour test
		this.commentaireRepository.save(comModel);
		com.setId(comModel.getId());
		return com;
	}

	@Override
	public void delete() {
		// TODO Auto-generated method stub
	}

	@Override
	public Commentaire update(CommentaireDTO c, String message) {
		Commentaire com= new Commentaire ();
		Commentaire result=this.commentaireRepository.updateMessage(com, message);
		c.setId(result.getId());
		return result;
	}

	@Override
	public List<CommentaireDTO> findForComment(CommentaireDTO c) {
		//obtenir la liste des commentaire aillant comme parent l'id de ce commentaire DTO
		List<Commentaire> list=this.commentaireRepository.findByCommentaireId(c.getId());
		//faire une boucle forEach pour transformer les commentaires en commentairesDTO
		List<CommentaireDTO> result=new ArrayList<>();
		for (Commentaire commentaire : list) {
			result.add( new CommentaireDTO(commentaire.getContenu(),commentaire.getIdee(),commentaire.getMembre(),commentaire.getCreatedAt()));
		}
		return result;
	}

	@Override
	public List<CommentaireDTO> findForIdea(CommentaireDTO c) {
		//obtenir la liste des commentaire aillant comme parent l'id de l'idée liée ce commentaire DTO
		List<Commentaire> list=this.commentaireRepository.findByIdeeId(c.getIdee().getId());
		//faire une boucle forEach pour transformer les commentaires en commentairesDTO
		List<CommentaireDTO> result=new ArrayList<>();
		for (Commentaire commentaire : list) {
			result.add( new CommentaireDTO(commentaire.getContenu(),commentaire.getIdee(),commentaire.getMembre(),commentaire.getCreatedAt()));
		}
		return result;
	}

}
