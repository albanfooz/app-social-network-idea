package glap.service;

import glap.DTO.VoteDTO;

public interface IVoteService{
	//ajouter un vote
	public VoteDTO add(VoteDTO vote);

	//changer son vote, pour l'inverser ou l'annuler
	public VoteDTO update(VoteDTO vote);

	//afficher les votes d'un membre sur une idée
	public VoteDTO findVoteByMemberIdAndCommentaireId(int idcom,int idmembre);

	public VoteDTO findByMemberIdAndIdeeId(int ididee,int idmembre);

	public long findScoreByCommentaireId(int id);

	public long findScoreByIdeeId(int id);
}
