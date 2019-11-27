package glap.service;

import java.util.List;

import glap.DTO.CommentaireDTO;
import glap.model.Commentaire;

public interface ICommentaireService {

	//supprimer un commentaire
	public void delete(int id);

	//modifier un commentaire
	public Commentaire update(CommentaireDTO c,String com);

	//afficher les commentaires d'un commentaire
	List<CommentaireDTO> findForComment(int id);

	//afficher les commentaires d'une idée
	public List<CommentaireDTO> findForIdea(int id);

	CommentaireDTO addOnCommentaire(CommentaireDTO com);

	CommentaireDTO addOnIdee(CommentaireDTO com);
}
