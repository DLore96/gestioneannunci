package it.ebay.gestioneannunci.repository.utente;

import java.util.Optional;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import it.ebay.gestioneannunci.model.StatoUtente;
import it.ebay.gestioneannunci.model.Utente;

public interface UtenteRepository extends CrudRepository<Utente, Long>, CustomUtenteRepository {

	Optional<Utente> findByUsername(String username);
	
	Utente findByUsernameAndPassword(String username, String password);
	
	@EntityGraph(attributePaths = { "ruoli" })
	Utente findByUsernameAndPasswordAndStato(String username,String password, StatoUtente stato);
	
	@Query("from Utente u left join fetch u.ruoli a where u.id = ?1")
	Optional<Utente> findOneEagerRuoli(Long id);
	
}
 	