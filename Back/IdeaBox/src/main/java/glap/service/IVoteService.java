package glap.service;

import java.util.List;

import glap.DTO.VoteDTO;
import glap.model.Vote;

public interface IVoteService{
	//ajouter un vote
	public VoteDTO add(VoteDTO vote);

	//changer son vote, pour l'inverser ou l'annuler
	public VoteDTO update(VoteDTO vote);

	public List<Vote> findDownVote();

	public List<Vote> findUpVote();
}
