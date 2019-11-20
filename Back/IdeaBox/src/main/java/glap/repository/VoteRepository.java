package glap.repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import glap.model.Vote;

@Repository
@Transactional
public class VoteRepository {
	@PersistenceContext
	private EntityManager em;

	public void save(Vote vote) {
		this.em.persist(vote);
	}

	//modifier une idée
	public int update(Integer id, Vote v) {
		Query query = this.em.createQuery("Update Vote v Set v.positif=:positif WHERE i.id=:id");
		query.setParameter("positif", v.isPositif());
		query.setParameter("id", id);
		int result = query.executeUpdate();
		return result;
	}
	public Vote findById(Integer id) {
		Vote result = this.em.find(Vote.class,id);
		return result;
	}
	public int findCommentaireScore(Integer id) {
		Query query = this.em.createQuery("SELECT COUNT(*) FROM Vote v where v.positif=true and v.commentaire_id=:id",Vote.class);
		query.setParameter("id", id);
		Integer upVote=(int) query.getSingleResult();
		Query query1 = this.em.createQuery("SELECT COUNT(*) FROM Vote v where v.positif=false and v.commentaire_id=:id",Vote.class);
		query1.setParameter("id", id);
		Integer downVote=(int) query1.getSingleResult();
		Integer score=upVote-downVote;
		return score;
	}
	public int findIdeeScore(Integer id) {
		Query query = this.em.createQuery("SELECT COUNT(*) FROM Vote v where v.positif=true and v.idee_id=:id",Vote.class);
		query.setParameter("id", id);
		Integer upVote=(int) query.getSingleResult();
		Query query1 = this.em.createQuery("SELECT COUNT(*) FROM Vote v where v.positif=false and v.idee_id=:id",Vote.class);
		query1.setParameter("id", id);
		Integer downVote=(int) query1.getSingleResult();
		Integer score=upVote-downVote;
		return score;
	}
}
