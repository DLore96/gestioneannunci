package it.ebay.gestioneannunci.repository.acquisto;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import it.ebay.gestioneannunci.model.Acquisto;

public interface AcquistoRepository extends CrudRepository<Acquisto, Long> {

	@Query("from Acquisto a join fetch a.utente where a.id = :id")
	Acquisto findOneEager(Long id);
	
}
