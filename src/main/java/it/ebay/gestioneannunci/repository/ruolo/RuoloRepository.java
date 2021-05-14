package it.ebay.gestioneannunci.repository.ruolo;

import org.springframework.data.repository.CrudRepository;

import it.ebay.gestioneannunci.model.Ruolo;

public interface RuoloRepository extends CrudRepository<Ruolo, Long> {

	Ruolo findByDescrizioneAndCodice(String descrizione, String codice);
	
}
