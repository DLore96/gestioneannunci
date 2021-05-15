package it.ebay.gestioneannunci.repository.annuncio;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import it.ebay.gestioneannunci.model.Annuncio;

public interface AnnuncioRepository extends CrudRepository<Annuncio, Long>, CustomAnnuncioRepository {

	@Query("from Annuncio a join fetch a.utente where a.id = :id")
	Annuncio findOneEagerUtente(Long id);
	
	@Query("from Annuncio a join fetch a.categorie where a.id = :id")
	Annuncio findOneEagerCategoria(Long id);

	@Query("from Annuncio a inner join fetch a.categorie c inner join fetch a.utente u where a.id = :id")
	Annuncio findOneEager(Long id);

	
}
