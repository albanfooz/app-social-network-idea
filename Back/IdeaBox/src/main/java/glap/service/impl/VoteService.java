package glap.service.impl;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import glap.DTO.VoteDTO;
import glap.model.Vote;
import glap.repository.VoteRepository;
import glap.service.IVoteService;


public class VoteService implements IVoteService {
	@Autowired
	private VoteRepository voteRepository;

	@Override
	public VoteDTO add(VoteDTO vote) {
		Vote voteModel = new Vote();

		voteModel.setPositif(vote.getPositif());
		// code pour test
		//setCreatedAt est censé s'instancier de base dans bdd
		voteModel.setCreatedAt(Calendar.getInstance().getTime());
		voteModel.setIdee(vote.getIdee());
		voteModel.setCommentaire(vote.getCommentaire());
		voteModel.setMembre(vote.getMembre());
		//fin code pour test
		this.voteRepository.save(voteModel);
		vote.setId(voteModel.getId());
		return vote;
	}

	@Override
	public VoteDTO update(VoteDTO vote) {
		Vote voteModel = this.voteRepository.findById(vote.getId());
		voteModel.setPositif(vote.getPositif());
		this.voteRepository.update(vote.getId(),voteModel);
		return vote;
	}

	@Override
	public List<Vote> findDownVote() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Vote> findUpVote() {
		// TODO Auto-generated method stub
		return null;
	}

}
