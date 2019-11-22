package glap.service.impl;

import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import glap.DTO.VoteDTO;
import glap.model.Vote;
import glap.repository.VoteRepository;
import glap.service.IVoteService;

@Service
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
	public VoteDTO findVoteByMemberIdAndCommentaireId(int idcom,int idmembre) {
		Vote vote = this.voteRepository.findByCommentaireIdAndMembreId(idcom,idmembre);
		VoteDTO result=null;
		result=new VoteDTO(vote.getId(),vote.isPositif(),vote.getCommentaire(),vote.getIdee(),vote.getMembre());
		return result;
	}

	@Override
	public VoteDTO findByMemberIdAndIdeeId(int ididee,int idmembre) {
		Vote vote = this.voteRepository.findByIdeeIdAndMembreId(ididee,idmembre);
		VoteDTO result=new VoteDTO(vote.getId(),vote.isPositif(),vote.getCommentaire(),vote.getIdee(),vote.getMembre());
		return result;
	}

	@Override
	public long findScoreByCommentaireId(int id) {
		long result=this.voteRepository.findCommentaireScore(id);
		return result;
	}

	@Override
	public long findScoreByIdeeId(int id) {
		long result=this.voteRepository.findIdeeScore(id);
		return result;
	}

}
