package it.ebay.gestioneannunci.service.annuncio;

import java.util.List;

import it.ebay.gestioneannunci.model.Annuncio;

public interface AnnuncioService {
	
	public List<Annuncio> listAllElements();

	public Annuncio caricaSingoloElemento(Long id);
	
	public Annuncio caricaSingoloElementoEagerUtente(Long id);
	
	public Annuncio caricaSingoloElementoEagerCateogria(Long id);

	public void aggiorna(Annuncio annuncioInstance);

	public void inserisciNuovo(Annuncio annuncioInstance);

	public void rimuovi(Annuncio annuncioInstance);
	
	public List<Annuncio> findByExample(Annuncio annuncioInstance);

	public Annuncio caricaSingoloElementoEager(Long id);
	
}
