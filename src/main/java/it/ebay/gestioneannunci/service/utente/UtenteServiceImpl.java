package it.ebay.gestioneannunci.service.utente;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import it.ebay.gestioneannunci.model.StatoUtente;
import it.ebay.gestioneannunci.model.Utente;
import it.ebay.gestioneannunci.repository.utente.UtenteRepository;

@Service
@Transactional
public class UtenteServiceImpl implements UtenteService {

	@Autowired
	private UtenteRepository repository;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public List<Utente> listAllUtenti() {
		return (List<Utente>) repository.findAll();
	}

	@Override
	public Utente caricaSingoloUtente(Long id) {
		return repository.findById(id).orElse(null);
	}

	@Override
	public void aggiorna(Utente utenteInstance) {
		utenteInstance.setPassword(passwordEncoder.encode(utenteInstance.getPassword()));
		repository.save(utenteInstance);
	}

	@Override
	public void inserisciNuovo(Utente utenteInstance) {
		utenteInstance.setPassword(passwordEncoder.encode(utenteInstance.getPassword()));
		repository.save(utenteInstance);
	}

	@Override
	public void rimuovi(Utente utenteInstance) {
		repository.delete(utenteInstance);
	}

	@Override
	public List<Utente> findByExample(Utente example) {
		return repository.findByExample(example);
	}

	@Override
	public Utente findByUsernameAndPassword(String username, String password) {
		return repository.findByUsernameAndPassword(username, password);
	}

	@Override
	public Utente eseguiAccesso(String username, String password) {
		return repository.findByUsernameAndPasswordAndStato(username, password, StatoUtente.ATTIVO);
	}

	@Override
	public void invertUserAbilitation(Long utenteInstanceId) {
		Utente utenteInstance = caricaSingoloUtente(utenteInstanceId);
		if(utenteInstance == null)
			throw new RuntimeException("Elemento non trovato.");
		
		if(utenteInstance.getStato().equals(StatoUtente.ATTIVO))
			utenteInstance.setStato(StatoUtente.DISABILITATO);
		else if(utenteInstance.getStato().equals(StatoUtente.DISABILITATO) || utenteInstance.getStato().equals(StatoUtente.CREATO))
			utenteInstance.setStato(StatoUtente.ATTIVO);
	}

	@Override
	public Utente findByUsername(String username) {
		return repository.findByUsername(username).orElse(null);
	}

	@Override
	public void sottraiCredito(Utente utente, Double costoAnnuncio) {
		Double creditoResiduo = utente.getCreditoResiduo();
		creditoResiduo = creditoResiduo - costoAnnuncio;
		utente.setCreditoResiduo(creditoResiduo);
		repository.save(utente);
	}

	@Override
	public Utente caricaUtenteConRuoli(Long id) {
		return repository.findOneEagerRuoli(id).orElse(null);
	}

}
