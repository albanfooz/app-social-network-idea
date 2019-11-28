package glap.service.impl;

import java.time.Instant;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import glap.DTO.IdeeDTO;
import glap.model.Idee;
import glap.repository.ICategorieRepository;
import glap.repository.IIdeeRepository;
import glap.repository.IMembreRepository;
import glap.service.IIdeeService;

@Service
public class IdeeService implements IIdeeService {
	@Autowired
	private IIdeeRepository ideeRepository;
	@Autowired
	private ICategorieRepository catRepository;
	@Autowired
	private IMembreRepository membreRepository;


	@Autowired
	private VoteService voteService;


	@Override
	@Transactional
	public IdeeDTO add(IdeeDTO ideeDTO) {
		Idee result = new Idee();

		//id (using DB default)

		//catId
		result.setCategorie(catRepository.findById( ideeDTO.getCategorieId()).get());

		//Titre
		result.setTitre(ideeDTO.getTitre());

		//description
		result.setDescription(ideeDTO.getDescription());

		//collabId (none)

		//membreId (Original Posteur)
		result.setMembre(membreRepository.findById(ideeDTO.getMembreId()).get());

		//Score(not in DB)

		//Dates (using DB default)

		return this.ideeModelToDTO(ideeRepository.save(result));
	}

	@Override
	public List<IdeeDTO> recupererAll() {
		Iterator<Idee> iterator = this.ideeRepository.findAll().iterator();

		List<Idee> listI = new ArrayList<>();
		List<IdeeDTO> listDTO = new ArrayList<>();
		// Add each element of iterator to the List
		iterator.forEachRemaining(listI::add);
		for (Idee idee : listI) {
			// mapping Model To DTO
			IdeeDTO ideeToPush = this.ideeModelToDTO(idee);

			listDTO.add(ideeToPush);
		}
		return listDTO;
	}

	@Override
	public IdeeDTO update(Integer id, IdeeDTO ideeDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public IdeeDTO getById(Integer id) {
		IdeeDTO result = new IdeeDTO();
		Optional<Idee> opt = this.ideeRepository.findById(id);
		if(opt.isPresent()) {
			result = this.ideeModelToDTO(opt.get());
		}else {
			result = null;
		}
		return result;
	}

	private IdeeDTO ideeModelToDTO(Idee idee) {
		IdeeDTO result = new IdeeDTO();

		//id
		result.setId(idee.getId());

		//catId
		result.setCategorieId(idee.getCategorie().getId());

		//Titre
		result.setTitre(idee.getTitre());

		//description
		result.setDescription(idee.getDescription());

		//collabId
		Set<Integer> setCollabIds = new HashSet<>();
		idee.getCollaborteurs().forEach(element -> { setCollabIds.add(element.getId());});
		result.setCollaborateurIds(setCollabIds);

		//membreId (Original Posteur)
		result.setMembreId(idee.getMembre().getId());

		//Score
		result.setScore((int) (voteService.findScoreByIdeeId(idee.getId())*54.66)); //TODO fix bouchon with vote


		//Dates
		result.setCreatedAt(
				Instant.ofEpochMilli(idee.getCreatedAt().getTime()).atZone(ZoneId.systemDefault()).toLocalDateTime());
		if (idee.getDeleteAt() != null) {
			result.setDeletedAt(Instant.ofEpochMilli(idee.getDeleteAt().getTime()).atZone(ZoneId.systemDefault())
					.toLocalDateTime());
		}
		return result;
	}

	/* private Idee IdeeDTOtoModel(IdeeDTO ideeDTO) {
		Idee result = new Idee();

		//id
		result.setId(ideeDTO.getId());

		//catId
		result.setCategorie();

		return result;
	}
	 */
}
