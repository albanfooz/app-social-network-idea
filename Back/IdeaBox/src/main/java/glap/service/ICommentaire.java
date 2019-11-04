package glap.service;

public interface ICommentaire {
	//ajouter un commentaire
	public String add(String com);

	//supprimer un commentaire
	public void delete();

	//modifier un commentaire
	public String update(String com);
}
