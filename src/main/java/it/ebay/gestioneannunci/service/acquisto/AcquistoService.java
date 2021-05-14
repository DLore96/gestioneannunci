package it.ebay.gestioneannunci.service.acquisto;

import java.util.List;

import it.ebay.gestioneannunci.model.Acquisto;

public interface AcquistoService {

	public List<Acquisto> listAllElements();

	public Acquisto caricaSingoloElemento(Long id);
	
	public Acquisto caricaSingoloElementoEager(Long id);

	public void aggiorna(Acquisto acquistoInstance);

	public void inserisciNuovo(Acquisto acquistoInstance);

	public void rimuovi(Acquisto acquistoInstance);
	
}
