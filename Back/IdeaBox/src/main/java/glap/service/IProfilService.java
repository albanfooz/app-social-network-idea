/**
 *
 */
package glap.service;

import java.util.List;

import glap.DTO.profil.ProfilDTO;

/**
 *
 * @author Alban
 *
 */
public interface IProfilService {
	/**
	 * Modifier le Profil
	 *
	 * @param id        du profil à modifier dans la base
	 * @param profilDTO à remplacer
	 * @return profilDTO si OK, null sinon
	 */
	public ProfilDTO update(Integer id, ProfilDTO profilDTO);
	/**
	 * Ajouter le Profil
	 *
	 * @param profilDTO à ajouter
	 * @return profilDTO si OK, null sinon
	 */
	public ProfilDTO add(ProfilDTO profilDTO) ;
	/**
	 * Afficher les Profils
	 *
	 * @return List<profilDTO> si OK, null sinon
	 */
	public List<ProfilDTO> recupererAll();

}
