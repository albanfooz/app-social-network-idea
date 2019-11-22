package glap.repository;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import glap.model.Categorie;
import glap.model.Idee;

@Repository
@Transactional
public class CategorieRepository {
	private EntityManager em;

	public CategorieRepository() {
	}

	//Afficher la liste de toutes les categories
	public List<Categorie> findForCategorieId (Integer id) {
		List <Categorie> result = new ArrayList<>();
		TypedQuery<Categorie>query = this.em.createQuery("SELECT * FROM Catégorie c WHERE c.categorie_id=:id",Categorie.class);
		query.setParameter("id", id);
		result= query.getResultList();
		return result;

	}

	// trouver des idées liés à une categorie
	public List<Idee> findByCategorieId(Integer id) {
		List<Idee> result = new ArrayList<>();
		TypedQuery<Idee> query = this.em.createQuery("SELECT * FROM Idee i WHERE i.categorie_id=:id",Idee.class);
		query.setParameter("id", id);
		result=query.getResultList();
		return result;

	}



























































}
