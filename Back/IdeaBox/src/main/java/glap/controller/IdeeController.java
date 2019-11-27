package glap.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import glap.DTO.IdeeDTO;
import glap.service.impl.IdeeService;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
@RequestMapping("/idees")
public class IdeeController {
	@Autowired
	private IdeeService iService;

	@GetMapping
	public List<IdeeDTO> findAll() {
		return this.iService.recupererAll();
	}
}
