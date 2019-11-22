package glap.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import glap.DTO.membre.MembreDTO;
import glap.service.impl.MembreService;

@RestController
@RequestMapping("/membres")
public class MembreController {

	@Autowired
	private MembreService mService;

	@GetMapping
	public List<MembreDTO> findAll() {
		return this.mService.recupererAll();
	}
	@PostMapping
	public MembreDTO add() {

		return null;
	}

}
