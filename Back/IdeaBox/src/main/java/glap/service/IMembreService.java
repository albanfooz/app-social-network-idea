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
	 * Ajouter un Membre
	 *
	 * membre n'est composé que d'un ID en Auto increment alors pas de parametres
	 * @return membreDTO si OK, null sinon
	 */
	public MembreDTO add() ;
	/**
	 * Afficher les Membres
	 *
	 * @return List<membreDTO> si OK, null sinon
	 */
	public List<MembreDTO> recupererAll();
	public MembreDTO getById(Integer idMembre);



	/**
	 * Récuperer toutes les idéées appartenant à un membre
	 * @param idMembrel
	 * @return ideeDTO si ok sinon null
	 */
	public List<Integer> findIdeeByMembre (Integer idMembre);

}
