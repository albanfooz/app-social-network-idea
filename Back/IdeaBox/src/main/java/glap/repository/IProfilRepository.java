package glap.repository;

import org.springframework.data.repository.PagingAndSortingRepository;

import glap.model.Profil;

public interface IProfilRepository extends PagingAndSortingRepository<Profil, Integer> {
	//List<Profil> findByMembre(Membre membre, Pageable pageable);
}
