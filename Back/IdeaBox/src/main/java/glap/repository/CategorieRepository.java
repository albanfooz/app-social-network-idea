package glap.repository;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import glap.model.Categorie;
import glap.model.Idee;

@Repository
@Transactional
public class CategorieRepository {
	@PersistenceContext
	private EntityManager em;

	public CategorieRepository() {
	}

	//Ajouter une catégorie
	public void save(Categorie c) {
		this.em.persist(c);
	}

	//supprimer une categorie
	public Integer delete (Categorie c){
		Query query = this.em.createQuery("DELETE FROM Categorie c where c.id=:id");
		query.setParameter("id", c.getId());
		Integer result = query.executeUpdate();
		return result;
	}


	//modifier une categorie
	public Categorie updateCategorie (Categorie c, String titre, String description) {
		Categorie result = this.em.find(Categorie.class, c.getId());
		result.setTitre(titre);
		result.setDescription(description);
		return result;

	}


	//Afficher la liste de toutes les categories
	public List<Categorie> recupererAllCategorie (Integer id) {
		List <Categorie> result = new ArrayList<>();
		TypedQuery<Categorie>query = this.em.createQuery("SELECT c FROM Categorie c",Categorie.class);
		query.setParameter("id", id);
		result= query.getResultList();
		return result;

	}

	// trouver des idées liés à une categorie à placer dans le serviceRepository
	public List<Idee> findByCategorieId(Integer id) {
		List<Idee> result = new ArrayList<>();
		TypedQuery<Idee> query = this.em.createQuery("SELECT i FROM Idee i WHERE i.categorie_id=:id",Idee.class);
		query.setParameter("id", id);
		result=query.getResultList();
		return result;

	}



























































}
