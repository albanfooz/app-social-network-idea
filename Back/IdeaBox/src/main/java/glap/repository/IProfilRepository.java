package glap.repository;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;

import glap.model.Membre;
import glap.model.Profil;

public interface IProfilRepository extends PagingAndSortingRepository<Profil, Integer> {
	List<Profil> findByMembre(Membre membre);

}
