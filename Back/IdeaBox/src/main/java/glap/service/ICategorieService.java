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

	//afficher les catégories
	public List <CategorieDTO> recupereAll();


}
