package it.ebay.gestioneannunci.repository.utente;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.apache.commons.lang3.StringUtils;

import it.ebay.gestioneannunci.model.Utente;

public class CustomUtenteRepositoryImpl implements CustomUtenteRepository {
	
	@PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Utente> findByExample(Utente example) {
		return null;
        
    }

}
