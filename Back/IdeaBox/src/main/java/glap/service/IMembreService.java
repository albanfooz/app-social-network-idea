package glap.service;

import glap.GTO.MembreGTO;

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
	 * @param membreGTO à remplacer à l'id
	 * @return membreGTO si OK, null sinon
	 */
	public MembreGTO update(Integer id, MembreGTO membreGTO);
}
