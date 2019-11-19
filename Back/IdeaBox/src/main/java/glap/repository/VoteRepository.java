package glap.repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

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

	public Vote update(Vote vote) {
		Vote result = this.em.find(Vote.class,vote.getId());
		if (result.isPositif()==true) {
			result.setPositif(false);
		}else {
			result.setPositif(true);
		}
		return result;
	}
}
