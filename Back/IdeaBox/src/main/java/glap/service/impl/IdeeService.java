package glap.service.impl;

import java.time.Instant;
import java.time.ZoneId;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import glap.DTO.IdeeDTO;
import glap.model.Idee;
import glap.repository.IIdeeRepository;
import glap.service.IIdeeService;

public class IdeeService implements IIdeeService {
	@Autowired
	private IIdeeRepository ideeRepository;


	@Override
	public IdeeDTO add(IdeeDTO ideeDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<IdeeDTO> recupererAll() {
		Iterator<Idee> iterator = this.ideeRepository.findAll().iterator();
		//TODO
		//iterator to List
		return null;
	}

	@Override
	public IdeeDTO update(Integer id, IdeeDTO ideeDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public IdeeDTO getById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	private IdeeDTO ideeModelToDTO(Idee idee) {
		IdeeDTO result = new IdeeDTO();
		result.setId(idee.getId());
		result.setCategorieId(idee.getCategorie().getId());

		//Set<Membre> to Set<getMembreId>
		Set<Integer> setCollabIds;
		idee.getCollaborteurs().forEach(element -> { setCollabIds.add(element.getId());});
		result.setCollaborateurIds(setCollabIds);
		result.setMembreId(idee.getMembre().getId());
		result.setScore(idee.getScore());

		result.setCreatedAt(
				Instant.ofEpochMilli(idee.getCreatedAt().getTime()).atZone(ZoneId.systemDefault()).toLocalDateTime());
		if (idee.getDeletedAt() != null) {
			result.setDeletedAt(Instant.ofEpochMilli(idee.getDeletedAt().getTime()).atZone(ZoneId.systemDefault())
					.toLocalDateTime());
		}
		return result;
	}

}
