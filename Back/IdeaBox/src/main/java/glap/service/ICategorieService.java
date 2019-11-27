package glap.service;

import java.util.List;

import glap.DTO.categorie.CategorieDTO;

public interface ICategorieService {

	// ajouter une categorie
	public CategorieDTO add (CategorieDTO catDTO);

	//supprimer une Categorie
	public CategorieDTO delete (CategorieDTO catDTO);

	//modifier une categorie
	public CategorieDTO update (Integer id, CategorieDTO catDTO);

	//afficher Toutes les catégories
	public List <CategorieDTO> recupereAll();

	//afficher une catégorie avec l'id
	public CategorieDTO getById(Integer IdCategorie);

	//afficher toutes les idées d'une catégorie
	public List<Integer> findIdeeByCategorie (Integer IdCategorie);

}
