package glap.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import glap.DTO.categorie.CategorieDTO;
import glap.model.Categorie;
import glap.repository.ICategorieRepository;
import glap.service.ICategorieService;

@Service
public class CategorieService implements ICategorieService {

	@Autowired
	private ICategorieRepository categorieRepository;

	@Override
	@Transactional
	public CategorieDTO add(CategorieDTO catDTO) {
		CategorieDTO result = new CategorieDTO();
		Categorie temp = this.categorieDTOtoModel(catDTO);
		result = this.categorieModelToDTO(this.categorieRepository.save(temp));
		return result;
	}

	public List<CategorieDTO> recupererAll() {
		Iterator<Categorie> iterator = this.categorieRepository.findAll().iterator();
		//toList
		List<Categorie> listC = new ArrayList<>();
		List<CategorieDTO> listDTO = new ArrayList<>();
		//ajouter chaque element de iterator dans la list
		iterator.forEachRemaining(listC::add);
		for (Categorie categorie : listC) {
			//mapping Moddel dans DTO
			CategorieDTO CategorieToPush = this.categorieModelToDTO(categorie);
			listDTO.add(CategorieToPush);
		}
		return listDTO;
	}

	@Override
	public CategorieDTO delete(CategorieDTO cat) {

		return null;
	}


	private CategorieDTO categorieModelToDTO(Categorie cat) {
		CategorieDTO result = new CategorieDTO();
		result.setId(cat.getId());
		result.setTitre(cat.getTitre());
		result.setDescription(cat.getDescription());
		return result;
	}



	private Categorie categorieDTOtoModel(CategorieDTO catDTO) {
		Categorie result = new Categorie();
		if (catDTO.getId() != null) {
			result.setId(catDTO.getId());
		}
		result.setTitre(catDTO.getTitre());
		result.setDescription(catDTO.getDescription());
		return result;
	}

	@Override
	public List<CategorieDTO> findForCategorie(CategorieDTO c) {
		
		return null;
	}

}