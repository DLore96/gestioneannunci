package it.ebay.gestioneannunci.repository.annuncio;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.apache.commons.lang3.StringUtils;

import it.ebay.gestioneannunci.model.Annuncio;

public class CustomAnnuncioRepositoryImpl implements CustomAnnuncioRepository {

	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	public List<Annuncio> findByExample(Annuncio example) {
		
		Map<String, Object> paramaterMap = new HashMap<String, Object>();
        List<String> whereClauses = new ArrayList<String>();

        StringBuilder queryBuilder = new StringBuilder("select u from Annuncio a inner join a.utente u inner join fetch a.categorie where a.id = a.id ");

        if (StringUtils.isNotEmpty(example.getTestoAnnuncio())) {
            whereClauses.add(" a.testoAnnuncio like :testoAnnuncio ");
            paramaterMap.put("testoAnnuncio", "%" + example.getTestoAnnuncio() + "%");
        }
        if (example.getPrezzo() != null) {
            whereClauses.add(" a.prezzo >= :prezzo ");
            paramaterMap.put("prezzo", example.getPrezzo());
        }
        if (example.getDataPubblicazione() != null) {
            whereClauses.add(" a.dataPubblicazione >= :dataPubblicazione ");
            paramaterMap.put("dataPubblicazione", example.getDataPubblicazione());
        }
        if (example.getUtente() != null) {
            whereClauses.add(" a.utente = :utente ");
            paramaterMap.put("utente", example.getUtente());
        }
        if (example.getCategorie() != null) {
            whereClauses.add("a.categorie in :categorie ");
            paramaterMap.put("categorie", example.getCategorie());
        }

        queryBuilder.append(!whereClauses.isEmpty()?" and ":"");
        queryBuilder.append(StringUtils.join(whereClauses, " and "));
        TypedQuery<Annuncio> typedQuery = entityManager.createQuery(queryBuilder.toString(), Annuncio.class);

        for (String key : paramaterMap.keySet()) {
            typedQuery.setParameter(key, paramaterMap.get(key));
        }

        return typedQuery.getResultList();
		
	}

}
