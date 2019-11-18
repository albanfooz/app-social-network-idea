package glap.service;

import glap.DTO.CommentaireDTO;
import glap.model.Commentaire;

public interface ICommentaireService {
	//ajouter un commentaire
	public CommentaireDTO add(CommentaireDTO com);

	//supprimer un commentaire
	public void delete();

	//modifier un commentaire
	public Commentaire update(CommentaireDTO c,String com);
}
