package glap.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.concurrent.atomic.AtomicReference;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import glap.DTO.membre.MembreDTO;
import glap.DTO.profil.ProfilDTO;
import glap.model.Commentaire;
import glap.model.Idee;
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
		Membre m = this.membreRepository.save(new Membre());
		result.setId(m.getId());
		return result;
	}

	@Override
	public List<MembreDTO> recupererAll() {
		Iterator<Membre> iterator = this.membreRepository.findAll().iterator();

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

	@Override
	public MembreDTO getById(Integer idMembre) {
		MembreDTO result = null;
		// Atomic to set value in lambda
		AtomicReference<ProfilDTO> value = new AtomicReference<>();
		Optional<Membre> opt = this.membreRepository.findById(idMembre);
		opt.ifPresent(profil ->{
			MembreDTO temp = new MembreDTO();
			//value.set();
		});
		//	result = value.get();
		return result;
	}


	@Override

	// afficher les idee appartenant à un membre
	public List<Integer> findIdeeByMembre(Integer idMembre) {
		List <Integer> result = new ArrayList<>();

		//membre = pro.findById(idPro) retourne MembreModel avec optional
		Optional<Membre> optMembre = this.membreRepository.findById(idMembre);

		// membre.getIdees() retourne un <setIdeeModel>
		if (optMembre.isPresent()) {

			Membre membre = optMembre.get();

			//transformer Set<Idee> en List List<Idee>
			Set<Idee> setIdees= membre.getIdees2();

			//Transformer List<Idee> en List<Integer> (IdeeModel -> IdeesId)
			List<Idee> listIdees = new ArrayList<>(setIdees);

			//Boucle for each add chaque idee.getID de la listIdees dans result.
			for (Idee idee : listIdees) {
				result.add(idee.getId());
			}
		} else {
			result = null;
		}

		//retourne List<Interger> IdeesId;
		return result;
	}

	//methode pour afficher tout les commentaire lié à un membre
	public List<Integer> findCommentaireByMember (Integer idMmeber) {
		List<Integer> result = new ArrayList<>();

		//membre = pro.finById(idPro) retourne MembreModel avec optional
		Optional<Membre> optMembre = this.membreRepository.findById(idMmeber);

		//membre.getCommentaire /() retourne <setCommentaireModel>
		if (optMembre.isPresent()) {
			Membre membre = optMembre.get();

			//transformer Set<Commentaire> en List List<Commnetaire> 2 etape
			Set<Commentaire> setCommentaire = membre.getCommentaires();

			//transformer List<commentaires en list <integer> (CommentaireModel -> CommentaireId)
			List<Commentaire> listCommentaires = new ArrayList<>(setCommentaire);

			// voucle for each add chaque commmentaire.getId de la listCommentaire dans result.
			for (Commentaire commentaire : listCommentaires) {
				result.add(commentaire.getId());
			}
		} else {
			result = null;
		}
		return result;

	}
}