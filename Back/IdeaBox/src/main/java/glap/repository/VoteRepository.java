package glap.repository;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
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
		System.out.println("vote sauvegardé");
	}

	//modifier une idée
	public int update(Integer id, Vote v) {
		Query query = this.em.createQuery("Update Vote v Set v.positif=:positif WHERE v.id=:id");
		if(v.isPositif()==null) {
			query.setParameter("positif", null);
		}else {
			query.setParameter("positif", v.isPositif());
		}
		query.setParameter("id", id);
		int result = query.executeUpdate();
		return result;
	}
	public Vote findById(Integer id) {
		Vote result = this.em.find(Vote.class,id);
		return result;
	}
	public Vote findByCommentaireIdAndMembreId(Integer comId,Integer membreId) {
		Vote result=null;
		try {
			Query query = this.em.createQuery("SELECT v FROM Vote v where v.commentaire.id=:id and v.membre.id=:idM",Vote.class);
			query.setParameter("id", comId);
			query.setParameter("idM", membreId);
			result= (Vote) query.getSingleResult();
		}catch(NoResultException e){
			System.out.println("pas de vote");
		}
		return result;
	}

	public Vote findByIdeeIdAndMembreId(Integer ididee, Integer idmembre) {
		Query query = this.em.createQuery("SELECT v FROM Vote v where v.idee.id=:id and v.membre.id=:idM",Vote.class);
		query.setParameter("id", ididee);
		query.setParameter("idM", idmembre);
		Vote result= (Vote) query.getSingleResult();
		return result;
	}

	public long findCommentaireScore(int id) {
		Query query = this.em.createQuery("SELECT COUNT(*) FROM Vote v where v.positif=true and v.commentaire.id=:id",Long.class);
		query.setParameter("id", id);
		long upVote=  (long) query.getSingleResult();
		Query query1 = this.em.createQuery("SELECT COUNT(*) FROM Vote v where v.positif=false and v.commentaire.id=:id",Long.class);
		query1.setParameter("id", id);
		long downVote= (long) query1.getSingleResult();
		long score=upVote-downVote;
		return score;
	}

	public long findIdeeScore(Integer id) {
		Query query = this.em.createQuery("SELECT COUNT(*) FROM Vote v where v.positif=true and v.idee.id=:id",Long.class);
		query.setParameter("id", id);
		long upVote=  (long) query.getSingleResult();
		Query query1 = this.em.createQuery("SELECT COUNT(*) FROM Vote v where v.positif=false and v.idee.id=:id",Long.class);
		query1.setParameter("id", id);
		long downVote= (long) query1.getSingleResult();
		long score=upVote-downVote;
		return score;
	}

}
