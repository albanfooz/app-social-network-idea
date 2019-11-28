package glap.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	@GetMapping("/{id}")
	@ResponseBody
	public IdeeDTO finById(@PathVariable Integer id) {
		return this.iService.getById(id);
	}

	@GetMapping ("/categorie/{idCat}")
	@ResponseBody
	// recuperer ici la methode findIdeeByCategorie de CategorieService
	public List<IdeeDTO> findById(@PathVariable Integer idCat) {
		List<IdeeDTO> result =  new ArrayList<>();
		this.catService.findIdeeByCategorie(idCat).forEach(element -> {result.add(this.iService.getById(idCat));});
		return result;
	}

	@GetMapping ("/membre/{idMembre}")
	@ResponseBody
	// récupérer ici la methode findIdeeByMembre de MmembreService
	public List<IdeeDTO> findByIdMembre(@PathVariable Integer idMembre) {
		List<IdeeDTO> result =  new ArrayList<>();
		this.membreService.findIdeeByMembre(idMembre).forEach(element ->{result.add(this.iService.getById(element));});
		return result ;
	}

	@PostMapping
	@ResponseBody
	public IdeeDTO save(@RequestBody IdeeDTO ideeDTO) {

		return this.iService.add(ideeDTO);

	}


}
