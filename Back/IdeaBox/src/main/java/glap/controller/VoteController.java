package glap.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import glap.DTO.VoteDTO;
import glap.model.Vote;
import glap.service.impl.VoteService;

public class VoteController {
	private VoteService voteService;

	@GetMapping
	public List<Vote> findDownVote() {
		List<Vote> result = new ArrayList<>();
		return result;
	}

	@GetMapping
	public List<Vote> findUpVote() {
		List<Vote> result = new ArrayList<>();
		return result;
	}

	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public VoteDTO save(@RequestBody VoteDTO v) {
		VoteDTO result= this.voteService.add(v);
		return result;
	}

}
