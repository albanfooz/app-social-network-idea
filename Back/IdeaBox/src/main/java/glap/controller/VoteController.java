package glap.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import glap.DTO.VoteDTO;
import glap.service.impl.VoteService;

@RestController
@RequestMapping("/votes")
public class VoteController {

	@Autowired
	private VoteService voteService;

	@GetMapping
	@RequestMapping("/membre-{idmembre}/commentaire-{idcom}")
	public VoteDTO findByMemberIdAndCommentaireId(@PathVariable int idcom, @PathVariable int idmembre) {
		VoteDTO result = this.voteService.findVoteByMemberIdAndCommentaireId(idcom, idmembre);
		return result;
	}
	//
	//	@GetMapping
	//@RequestMapping("/commentaire/{id}")
	//	public List<Vote> findVoteByMemberIdAndCommentaireId() {
	//		List<Vote> result = new ArrayList<>();
	//		return result;
	//	}

	@GetMapping
	@RequestMapping("/commentaire/{id}")
	public long findScoreCommentaire(@PathVariable int id) {
		long result=this.voteService.findScoreByCommentaireId(id);
		return result;
	}

	@GetMapping
	@RequestMapping("/idee/{id}")
	public long findScoreIdee(@PathVariable int id) {
		long result=this.voteService.findScoreByIdeeId(id);
		return result;
	}

	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public VoteDTO save(@RequestBody VoteDTO v) {
		VoteDTO result= this.voteService.add(v);
		return result;
	}

}
