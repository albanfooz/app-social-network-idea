package glap.service;

import java.util.List;

import glap.DTO.membre.MembreDTO;

/**
 * Interface de MembreService
 *
 * @author Alban
 *
 */
public interface IMembreService {
	// créer
	// supprimer
	/**
	 * Modifier le Membre
	 *
	 * @param id        du membre à modifier dans la base
	 * @param membreDTO à remplacer
	 * @return membreDTO si OK, null sinon
	 */
	public MembreDTO update(Integer id, MembreDTO membreDTO);
	/**
	 * Ajouter le Membre
	 *
	 * @param membreDTO à ajouter
	 * @return membreDTO si OK, null sinon
	 */
	public MembreDTO add(MembreDTO membreDTO) ;
	/**
	 * Afficher les Membres
	 *
	 * @return List<membreDTO> si OK, null sinon
	 */
	public List<MembreDTO> recupererAll();

}
