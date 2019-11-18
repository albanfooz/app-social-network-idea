package glap.repository;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import glap.model.Membre;
@Repository
public interface IMembreRepository extends PagingAndSortingRepository<Membre, Integer> {

}
