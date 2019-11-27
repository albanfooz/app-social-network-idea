package glap.service;

import java.util.List;

import glap.DTO.CommentaireDTO;
import glap.model.Commentaire;

public interface ICommentaireService {
	//ajouter un commentaire
	public CommentaireDTO add(CommentaireDTO com);

	//supprimer un commentaire
	public void delete(int id);

	//modifier un commentaire
	public Commentaire update(CommentaireDTO c,String com);

	//afficher les commentaires d'un commentaire
	List<CommentaireDTO> findForComment(int id);

	//afficher les commentaires d'une idée
	public List<CommentaireDTO> findForIdea(int id);

}
