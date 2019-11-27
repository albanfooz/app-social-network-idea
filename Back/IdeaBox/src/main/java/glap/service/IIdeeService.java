package glap.service;

import java.util.List;

import glap.DTO.IdeeDTO;

/**
 * Interface service idee
 *
 *
 * @author Alban
 *
 */
public interface IIdeeService {
	/**
	 *
	 * @param ideeDTO
	 * @return IdeeDTO from DB
	 */
	public IdeeDTO add(IdeeDTO ideeDTO);

	/**
	 *
	 * @return All Idees
	 */
	public List<IdeeDTO> recupererAll();

	/**
	 *
	 * @param id à update
	 * @param ideeDTO avec les bonnes valeurs
	 * @return Idee modifiée
	 */
	public IdeeDTO update(Integer id, IdeeDTO ideeDTO);
	/**
	 *
	 * @param id
	 * @return	Idee get by id
	 */
	public IdeeDTO getById(Integer id);

}
