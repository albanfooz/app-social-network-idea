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
public class IdeeRepository {
	@PersistenceContext
	private EntityManager em;

	public IdeeRepository() {
	}
	//ajouter une idée
	public void save(Idee i) {
		this.em.persist(i);
	}

	//supprimer une idée
	public Integer delete(Idee i) {
		Query query = this.em.createQuery("DELETE FROM Idee i where i.id=:id");
		query.setParameter("id", i.getId());
		Integer result = query.executeUpdate();
		return result;
	}

	//modifier une idée
	public int update(Integer id, Idee i) {
		Query query = this.em.createQuery("Update Idee i Set i.description=:description, i.titre=:titre WHERE i.id=:id");
		query.setParameter("description", i.getDescription());
		query.setParameter("titre", i.getTitre());
		query.setParameter("id", id);
		int result = query.executeUpdate();
		return result;
	}

	//trouver tous les commentaires liés à un autre commentaire
	public List<Commentaire> findByCommentaireId(Integer id) {
		List<Commentaire> result = new ArrayList<>();
		TypedQuery<Commentaire> query = this.em.createQuery("SELECT * FROM Commentaire c where c.commentaire_id=:id",Commentaire.class);
		query.setParameter("id", id);
		result= query.getResultList();
		return result;
	}
}
