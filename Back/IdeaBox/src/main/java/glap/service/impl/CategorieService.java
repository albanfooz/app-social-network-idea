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
	public CategorieDTO update(Integer id, CategorieDTO catDTO) {

		return null;
	}

	@Override
	@Transactional
	public CategorieDTO add(CategorieDTO catDTO) {
		CategorieDTO result = new CategorieDTO();
		Categorie cat = this.categorieDTOtoModel(catDTO);
		result = this.CategorieModelToDTO(this.categorieRepository.save(cat));

		return result;
	}

	@Override
	public CategorieDTO delete(CategorieDTO catDTO) {
		return null;
	}

	@Override
	public List<CategorieDTO> recupereAll() {
		Iterator<Categorie> iterator = this.categorieRepository.findAll().iterator();
		List<Categorie> listCat = new ArrayList<>();
		List<CategorieDTO> listCatDTO = new ArrayList<>();
		iterator.forEachRemaining(listCat::add);
		for (Categorie categorie : listCat) {
			CategorieDTO CatToPush = this.CategorieModelToDTO(categorie);

			listCatDTO.add(CatToPush);
		}
		return listCatDTO;
	}

	private CategorieDTO CategorieModelToDTO (Categorie cat) {
		CategorieDTO result = new CategorieDTO();
		if (cat.getId() == null) {
			result.setId(null);
		}
		else {
			result.setId(cat.getId());
		}
		result.setTitre(cat.getTitre());
		result.setDescription(cat.getDescription());
		return result;
	}

	private  Categorie categorieDTOtoModel (CategorieDTO catDTO) {
		Categorie result = new Categorie();
		if (catDTO.getId() == null) {
			result.setId(null);
		} else {
			result.setId(catDTO.getId());
		}
		result.setTitre(catDTO.getTitre());
		result.setDescription(catDTO.getDescription());
		return result;
	}
}