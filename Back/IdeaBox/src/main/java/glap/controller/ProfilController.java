package glap.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import glap.DTO.profil.ProfilDTO;
import glap.service.impl.ProfilService;

@RestController
@RequestMapping("/profils")
public class ProfilController {
	@Autowired
	private ProfilService pService;

	@GetMapping
	public List<ProfilDTO> findAll() {
		return this.pService.recupererAll();
	}

	@PostMapping
	public ProfilDTO save(@RequestBody ProfilDTO profilDto) {
		ProfilDTO result = new ProfilDTO();
		return this.pService.add(profilDto);
	}
}
