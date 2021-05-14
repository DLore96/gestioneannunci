package it.ebay.gestioneannunci.service.ruolo;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import it.ebay.gestioneannunci.model.Ruolo;
import it.ebay.gestioneannunci.repository.ruolo.RuoloRepository;

@Service
@Transactional
public class RuoloServiceImpl implements RuoloService {

	@Autowired
	private RuoloRepository repository;
	
	@Override
	public List<Ruolo> listAll() {
		return (List<Ruolo>) repository.findAll();
	}

	@Override
	public Ruolo caricaSingoloElemento(Long id) {
		return repository.findById(id).orElse(null);
	}

	@Override
	public void aggiorna(Ruolo ruoloInstance) {
		repository.save(ruoloInstance);
	}

	@Override
	public void inserisciNuovo(Ruolo ruoloInstance) {
		repository.save(ruoloInstance);
	}

	@Override
	public void rimuovi(Ruolo ruoloInstance) {
		repository.delete(ruoloInstance);
	}

	@Override
	public Ruolo cercaPerDescrizioneECodice(String descrizione, String codice) {
		return repository.findByDescrizioneAndCodice(descrizione, codice);
	}

}
