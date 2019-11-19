package glap.service;

import java.util.List;

import glap.DTO.VoteDTO;
import glap.model.Vote;

public interface IVoteService{
	//ajouter un vote
	public VoteDTO add(VoteDTO vote);

	//supprimer un vote
	public void delete();

	public List<Vote> findDownVote();

	public List<Vote> findUpVote();
}
