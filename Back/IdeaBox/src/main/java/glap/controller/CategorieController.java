package glap.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import glap.DTO.categorie.CategorieDTO;
import glap.service.impl.CategorieService;

@RestController
@RequestMapping("/categorie")
public class CategorieController {
	@Autowired
	private CategorieService CategorieService;

	@GetMapping
	public List<CategorieDTO> findAll() {
		return this.CategorieService.recupererAll();
	}

	@PostMapping
	public CategorieDTO save(@RequestBody CategorieDTO CatDto) {
		CategorieDTO result = new CategorieDTO();
		return this.CategorieService.add(CatDto);
	}
}
