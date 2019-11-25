package glap.repository;

import org.springframework.data.repository.PagingAndSortingRepository;

import glap.model.Categorie;

public interface ICategorieRepository extends PagingAndSortingRepository<Categorie, Integer> {

}
