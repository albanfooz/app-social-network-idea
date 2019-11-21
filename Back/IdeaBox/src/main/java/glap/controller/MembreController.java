package glap.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import glap.DTO.membre.MembreDTO;
import glap.service.impl.MembreImpl;

@RestController
@RequestMapping("/membres")
public class MembreController {

	@Autowired
	private MembreImpl mService;

	@GetMapping
	public List<MembreDTO> findAll() {
		return this.mService.recupererAll();
	}

}
