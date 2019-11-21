package glap.service.impl;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import glap.DTO.profil.ProfilDTO;
import glap.model.Profil;
import glap.repository.IProfilRepository;
import glap.service.IProfilService;

public class ProfilService implements IProfilService {

	@Autowired
	private IProfilRepository profilRepository;
	@Override
	public ProfilDTO update(Integer id, ProfilDTO profilDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProfilDTO add(ProfilDTO profilDTO) {
		// TODO Auto-generated method stub
		return null;
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
			//mapping Model To DTO
			ProfilDTO profilToPush = new ProfilDTO();
			profilToPush.setId(profil.getId());
			profilToPush.setLogin(profil.getLogin());
			profilToPush.setMdp(profil.getPassword());
			profilToPush.setScore(profil.getScore());
			//date to localdatetime
			profilToPush.setCreatedAt( LocalDateTime.ofInstant(profil.getCreatedAt().toInstant(), ZoneId.systemDefault()));
			listDTO.add(profilToPush);
		}
		return listDTO;
	}

}
