package glap.service.impl;

import java.sql.Date;
import java.time.Instant;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import glap.DTO.profil.ProfilDTO;
import glap.model.Membre;
import glap.model.Profil;
import glap.repository.IMembreRepository;
import glap.repository.IProfilRepository;
import glap.service.IProfilService;

@Service
public class ProfilService implements IProfilService {

	@Autowired
	private IProfilRepository profilRepository;
	@Autowired
	private IMembreRepository membreRepository;

	@Override
	public ProfilDTO update(Integer id, ProfilDTO profilDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public ProfilDTO add(ProfilDTO profilDTO) {
		ProfilDTO result = new ProfilDTO();
		Profil temp = this.profilDTOtoModel(profilDTO);
		result = this.profilModelToDTO(this.profilRepository.save(temp));
		return result;
	}

	@Override
	public List<ProfilDTO> recupererAll() {
		Iterator<Profil> iterator = profilRepository.findAll().iterator();
		// to list
		List<Profil> listP = new ArrayList<>();
		List<ProfilDTO> listDTO = new ArrayList<>();
		// Add each element of iterator to the List
		iterator.forEachRemaining(listP::add);
		for (Profil profil : listP) {
			// mapping Model To DTO
			ProfilDTO profilToPush = this.profilModelToDTO(profil);

			listDTO.add(profilToPush);
		}
		return listDTO;
	}

	private ProfilDTO profilModelToDTO(Profil profil) {
		ProfilDTO result = new ProfilDTO();
		result.setId(profil.getId());
		result.setLogin(profil.getLogin());
		result.setMdp(profil.getPassword());
		result.setMembreId(profil.getMembre().getId());
		result.setScore(profil.getScore());

		result.setCreatedAt(Instant.ofEpochMilli(profil.getCreatedAt().getTime()).atZone(ZoneId.systemDefault()).toLocalDateTime());
		if (profil.getDeletedAt() != null) {
			result.setDeletedAt(Instant.ofEpochMilli(profil.getDeletedAt().getTime()).atZone(ZoneId.systemDefault()).toLocalDateTime());
		}

		return result;
	}

	private Profil profilDTOtoModel(ProfilDTO profilDTO) {
		Profil result = new Profil();
		if (profilDTO.getId() != null) {
			result.setId(profilDTO.getId());
		}
		result.setLogin(profilDTO.getLogin());
		result.setPassword(profilDTO.getMdp());
		result.setScore(profilDTO.getScore());
		//membre to Membre id
		Optional<Membre> opt = membreRepository.findById(profilDTO.getMembreId());
		opt.ifPresent(membre -> { result.setMembre(membre);});
		result.setMembre(opt.orElse(membreRepository.save(new Membre())));

		result.setCreatedAt(Date.valueOf(profilDTO.getCreatedAt().toLocalDate()));
		if (profilDTO.getDeletedAt() != null) {
			result.setDeletedAt(Date.valueOf(profilDTO.getDeletedAt().toLocalDate()));
		}
		return result;
	}

}
