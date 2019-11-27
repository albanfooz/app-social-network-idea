package glap.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import glap.DTO.CommentaireDTO;
import glap.model.Commentaire;
import glap.model.Idee;
import glap.model.Membre;
import glap.repository.CommentaireRepository;
import glap.repository.IIdeeRepository;
import glap.repository.IMembreRepository;
import glap.service.ICommentaireService;

/**
 *
 * Commentaire service
 *
 */
@Service
public class CommentaireService implements ICommentaireService {

	@Autowired
	private CommentaireRepository commentaireRepository;
	@Autowired
	private IIdeeRepository ideeRepository;
	@Autowired
	private IMembreRepository membreRepository;

	//TODO: redondance de code, fusionner addOnIdee et addOnComment avec des if (dans le front demande de renvoyer "idCommentaire":null quand commentaire sur idée
	@Override
	public CommentaireDTO addOnIdee(CommentaireDTO com) {
		Commentaire comModel = new Commentaire();
		comModel.setContenu(com.getContenu());
		comModel.setCreatedAt(Calendar.getInstance().getTime());
		//trouver une solution pour que la valeur par default soit utilisé dans my sql
		Optional<Idee> optIdee=this.ideeRepository.findById((com.getIdIdee()));
		if(optIdee.isPresent()) {
			comModel.setIdee(optIdee.get());
		}
		Optional<Membre> opt = this.membreRepository.findById((com.getIdMembre()));
		//si il a trouvé (isPresent) il va set Membre avec l'objet qu'il a trouvé (opt.get())
		if (opt.isPresent()) {
			comModel.setMembre(opt.get());
		}
		this.commentaireRepository.save(comModel);
		com=new CommentaireDTO(comModel.getId(),comModel.getContenu(),comModel.getCreatedAt(),comModel.getIdee().getId(),comModel.getMembre().getId(), null);
		return com;
	}

	@Override
	public CommentaireDTO addOnCommentaire(CommentaireDTO com) {
		Commentaire comModel = new Commentaire();
		comModel.setContenu(com.getContenu());
		comModel.setCreatedAt(Calendar.getInstance().getTime());
		//trouver une solution pour que la valeur par default soit utilisé dans my sql
		Optional<Idee> optIdee=this.ideeRepository.findById((com.getIdIdee()));
		if(optIdee.isPresent()) {
			comModel.setIdee(optIdee.get());
		}
		Optional<Membre> opt = this.membreRepository.findById((com.getIdMembre()));
		//si il a trouvé (isPresent) il va set Membre avec l'objet qu'il a trouvé (opt.get())
		if (opt.isPresent()) {
			comModel.setMembre(opt.get());
		}
		comModel.setCommentaire(this.commentaireRepository.findById(com.getIdCommentaire()));
		this.commentaireRepository.save(comModel);
		com=new CommentaireDTO(comModel.getId(),comModel.getContenu(),comModel.getCreatedAt(),comModel.getIdee().getId(),comModel.getMembre().getId(), comModel.getCommentaire().getId());
		return com;
	}


	@Override
	public void delete(int id) {
		this.commentaireRepository.delete(id);
	}

	@Override
	public CommentaireDTO update(Integer id, String contenu) {
		Commentaire com=this.commentaireRepository.updateMessage(id, contenu);
		CommentaireDTO result=new CommentaireDTO(com.getId(),com.getContenu(), com.getCreatedAt(),(com.getCommentaire()!=null?com.getCommentaire().getId():null),com.getIdee().getId(),com.getMembre().getId());
		return result;
	}

	@Override
	public List<CommentaireDTO> findForComment(int id) {
		//obtenir la liste des commentaire aillant comme parent l'id de ce commentaire DTO
		List<Commentaire> list=this.commentaireRepository.findByCommentaireId(id);
		//faire une boucle forEach pour transformer les commentaires en commentairesDTO
		List<CommentaireDTO> result=new ArrayList<>();
		for (Commentaire commentaire : list) {
			result.add( new CommentaireDTO(commentaire.getContenu(),commentaire.getIdee().getId(),commentaire.getMembre().getId()));
		}
		return result;
	}

	@Override
	public List<CommentaireDTO> findForIdea(int id) {
		//obtenir la liste des commentaire aillant comme parent l'id de l'idée liée ce commentaire DTO
		List<Commentaire> list=this.commentaireRepository.findByIdeeId(id);
		//faire une boucle forEach pour transformer les commentaires en commentairesDTO
		List<CommentaireDTO> result=new ArrayList<>();
		for (Commentaire commentaire : list) {
			result.add( new CommentaireDTO(commentaire.getContenu(),commentaire.getIdee().getId(),commentaire.getMembre().getId()));
		}
		return result;
	}

}
