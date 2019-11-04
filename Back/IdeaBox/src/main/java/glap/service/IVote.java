package glap.service;

public interface IVote {
	//ajouter un vote positif
	public int upVote();
	//ajouter un vote négatif
	public int downVote();
	//supprimer n'importe quel type de vote
	public void delete();
}
