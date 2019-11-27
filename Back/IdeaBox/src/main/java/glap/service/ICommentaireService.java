package glap.service;

import java.util.List;

import glap.DTO.CommentaireDTO;

public interface ICommentaireService {

	//supprimer un commentaire
	public void delete(int id);

	//modifier un commentaire
	CommentaireDTO update(Integer id, String contenu);

	//afficher les commentaires d'un commentaire
	List<CommentaireDTO> findForComment(int id);

	//afficher les commentaires d'une idée
	public List<CommentaireDTO> findForIdea(int id);

	CommentaireDTO addOnCommentaire(CommentaireDTO com);

	CommentaireDTO addOnIdee(CommentaireDTO com);


}
