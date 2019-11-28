package glap.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import glap.DTO.IdeeDTO;
import glap.service.impl.CategorieService;
import glap.service.impl.IdeeService;
import glap.service.impl.MembreService;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
@RequestMapping("/idees")
public class IdeeController {
	@Autowired
	private IdeeService iService;
	@Autowired
	private CategorieService catService;
	@Autowired
	private MembreService membreService;

	@GetMapping
	public List<IdeeDTO> findAll() {
		return this.iService.recupererAll();
	}

	@GetMapping ("/categorie/{idCat}")
	@ResponseBody
	// recuperer ici la methode findIdeeByCategorie de CategorieService
	public List<Integer> findById(@PathVariable Integer idCat) {
		return this.catService.findIdeeByCategorie(idCat);
	}

	@GetMapping ("/membre/{idMembre}")
	@ResponseBody
	// récupérer ici la methode findIdeeByMembre de MmembreService
	public List<Integer> findByIdMembre(@PathVariable Integer idMembre) {
		return this.membreService.findIdeeByMembre(idMembre);
	}


}
