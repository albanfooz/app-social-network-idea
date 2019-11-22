package glap.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import glap.DTO.membre.MembreDTO;
import glap.model.Membre;
import glap.repository.IMembreRepository;
import glap.service.IMembreService;

@Service
public class MembreService implements IMembreService {
	@Autowired
	private IMembreRepository membreRepository;

	@Override
	public MembreDTO update(Integer id, MembreDTO membreDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public MembreDTO add() {
		MembreDTO result = new MembreDTO();
		Membre m = membreRepository.save(new Membre());
		result.setId(m.getId());
		return result;
	}

	@Override
	public List<MembreDTO> recupererAll() {
		Iterator<Membre> iterator = membreRepository.findAll().iterator();




		List<Membre> listM = new ArrayList<>();
		List<MembreDTO> listDTO = new ArrayList<>();
		// Add each element of iterator to the List
		iterator.forEachRemaining(listM::add);
		for (Membre membre : listM) {
			MembreDTO mToPush = new MembreDTO();
			mToPush.setId(membre.getId());
			listDTO.add(mToPush);
		}

		return listDTO;
	}

}
