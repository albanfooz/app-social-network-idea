package glap.repository;

import org.springframework.data.repository.PagingAndSortingRepository;

import glap.model.Idee;

public interface IIdeeRepository extends PagingAndSortingRepository<Idee, Integer> {

}
