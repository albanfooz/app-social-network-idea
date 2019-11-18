package glap.repository;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import glap.model.Commentaire;
import glap.model.Idee;

@Repository
@Transactional
public class CommentaireRepository {
	@PersistenceContext
	private EntityManager em;

	public CommentaireRepository() {
	}

	//ajouter un commentaire
	public void save(Commentaire c) {
		this.em.persist(c);
	}

	//supprimer un commentaire
	public Integer delete(Commentaire c) {
		Query query = this.em.createQuery("DELETE FROM Commentaire c where c.id=:id");
		query.setParameter("id", c.getId());
		Integer result = query.executeUpdate();
		return result;
	}

	//modifier un commentaire
	public Commentaire updateMessage(Commentaire c, String message) {
		Commentaire result = this.em.find(Commentaire.class,c.getId());
		result.setContenu(message);
		return result;
	}

	//trouver tous les commentaires d'un membre liés à un autre commentaire
	public List<Commentaire> findByCommentaireId(Integer id) {
		List<Commentaire> result = new ArrayList<>();
		TypedQuery<Commentaire> query = this.em.createQuery("SELECT * FROM Commentaire c where c.commentaire_id=id",Commentaire.class);
		query.setParameter("id", id);
		result= query.getResultList();
		return result;
	}

	//Trouver les comentaires d'un membre liés à une idée
	public List<Commentaire> findByMembreIdAndIdeeId(Idee i) {
		List<Commentaire> result = new ArrayList<>();
		TypedQuery<Commentaire> query = this.em.createQuery("SELECT * FROM Commentaire c where c.idee_id=id",Commentaire.class);
		query.setParameter("id", i.getId());
		result= query.getResultList();
		return result;
	}
}
