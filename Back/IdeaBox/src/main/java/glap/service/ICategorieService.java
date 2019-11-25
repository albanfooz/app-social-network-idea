package glap.service;

import java.util.List;

import glap.DTO.categorie.CategorieDTO;

public interface ICategorieService {

	// ajouter une categorie
	public CategorieDTO add (CategorieDTO cat);

	//afficher les catégories
	List <CategorieDTO> findForCategorie(CategorieDTO c);

	//supprimer une Categorie
	public CategorieDTO delete (CategorieDTO cat);



}
