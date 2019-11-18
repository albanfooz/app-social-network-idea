package glap.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import glap.DTO.CommentaireDTO;
import glap.model.Commentaire;
import glap.repository.CommentaireRepository;

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

}
