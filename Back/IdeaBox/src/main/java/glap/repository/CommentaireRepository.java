package glap.repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import glap.model.Commentaire;
import glap.model.Idee;
import glap.model.Membre;

@Repository
@Transactional
public class CommentaireRepository {
	@PersistenceContext
	private EntityManager em;

	public CommentaireRepository() {
	}
	public void save(Commentaire c) {
		this.em.persist(c);
	}
	//trouver tous les commentaires d'un membre
	public Commentaire findByMembreId(Membre m) {
		Commentaire result = null;
		TypedQuery<Commentaire> query = this.em.createQuery("SELECT m FROM Commentaire m where m.membre_id=:id",Commentaire.class);
		query.setParameter("id", m.getId());
		result= query.getSingleResult();
		return result;
	}

	//Trouver les comentaires d'un membre liés à une idée
	//TODO : continuer cette methode
	public Commentaire findByMembreIdAndIdeeId(Membre m, Idee i) {
		Commentaire result = null;
		TypedQuery<Commentaire> query = this.em.createQuery("SELECT m FROM Commentaire m where m.membre_id=:id and ",Commentaire.class);
		query.setParameter("id", m.getId());
		result= query.getSingleResult();
		return result;
	}
	//trouver les commentaire d'un membre qui repo
}
