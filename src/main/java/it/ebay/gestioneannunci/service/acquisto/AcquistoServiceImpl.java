package it.ebay.gestioneannunci.service.acquisto;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import it.ebay.gestioneannunci.model.Acquisto;
import it.ebay.gestioneannunci.repository.acquisto.AcquistoRepository;

@Service
@Transactional
public class AcquistoServiceImpl implements AcquistoService {

	@Autowired
	private AcquistoRepository repository;
	
	@Override
	public List<Acquisto> listAllElements() {
		return (List<Acquisto>) repository.findAll();
	}

	@Override
	public Acquisto caricaSingoloElemento(Long id) {
		return repository.findById(id).orElse(null);
	}

	@Override
	public Acquisto caricaSingoloElementoEager(Long id) {
		return repository.findOneEager(id);
	}

	@Override
	public void aggiorna(Acquisto acquistoInstance) {
		repository.save(acquistoInstance);
	}

	@Override
	public void inserisciNuovo(Acquisto acquistoInstance) {
		repository.save(acquistoInstance);
	}

	@Override
	public void rimuovi(Acquisto acquistoInstance) {
		repository.delete(acquistoInstance);
	}

}
