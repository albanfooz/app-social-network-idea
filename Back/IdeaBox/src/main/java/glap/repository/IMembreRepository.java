package glap.repository;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import glap.model.Membre;
@Repository
@Transactional
public interface IMembreRepository extends PagingAndSortingRepository<Membre, Integer> {

}
