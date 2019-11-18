package glap.service;

import glap.DTO.MembreDTO;

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
	 * @param membreDTO à remplacer à l'idee
	 * @return membreDTO si OK, null sinon
	 */
	public MembreDTO update(Integer id, MembreDTO membreDTO);
}
