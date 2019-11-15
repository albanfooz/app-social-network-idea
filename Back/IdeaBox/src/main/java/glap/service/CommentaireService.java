package glap.service;

import org.springframework.stereotype.Service;

import glap.DTO.CommentaireDTO;
import glap.model.Commentaire;

/**
 *
 * Commentaire service
 *
 */
@Service
public class CommentaireService implements ICommentaireService {

	//TODO : continuer cette methode
	@Override
	public CommentaireDTO add(CommentaireDTO com) {
		Commentaire comModel = new Commentaire();
		comModel.setCreatedAt(com.getCreatedAt());
		comModel.setContenu(com.getContenu());
		comModel.setMembre(com.getIdMembre());
		//tModel.setUser(u);
		tchateurRepository.save(comModel);

		tDto.setId(tModel.getId());

		return com;
	}

	@Override
	public void delete() {
		// TODO Auto-generated method stub

	}

	@Override
	public String update(String com) {
		// TODO Auto-generated method stub
		return null;
	}


}
