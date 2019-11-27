package glap.repository;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import glap.model.Commentaire;

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
	public Integer delete(Integer id) {
		Query query = this.em.createQuery("DELETE FROM Commentaire c where c.id=:id");
		query.setParameter("id", id);
		Integer result = query.executeUpdate();
		return result;
	}

	//modifier un commentaire
	public Commentaire updateMessage(Integer id, String contenu) {
		Commentaire result = this.em.find(Commentaire.class,id);
		result.setContenu(contenu);
		result.setCreatedAt(Calendar.getInstance().getTime());
		System.out.println(result.toString());
		return result;
	}

	//trouver tous les commentaires liés à un autre commentaire
	public List<Commentaire> findByCommentaireId(Integer id) {
		List<Commentaire> result = new ArrayList<>();
		TypedQuery<Commentaire> query = this.em.createQuery("SELECT c FROM Commentaire c where c.commentaire.id=:id",Commentaire.class);
		query.setParameter("id", id);
		result= query.getResultList();
		return result;
	}

	//Trouver les comentaires liés à une idée
	public List<Commentaire> findByIdeeId(Integer id) {
		List<Commentaire> result = new ArrayList<>();
		TypedQuery<Commentaire> query = this.em.createQuery("SELECT c FROM Commentaire c where c.idee.id=:id",Commentaire.class);
		query.setParameter("id", id);
		result= query.getResultList();
		return result;
	}
	public Commentaire findById(Integer id) {
		Commentaire result=this.em.find(Commentaire.class, id);
		return result;
	}
}
