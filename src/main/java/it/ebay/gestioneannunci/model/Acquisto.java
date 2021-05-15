package it.ebay.gestioneannunci.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "acquisto")
public class Acquisto {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;

	@NotBlank(message = "{descrizione.notblank}")
	@Column(name = "descrizione")
	private String descrizione;

	@NotBlank(message = "{codice.notblank}")
	@Column(name = "codice")
	private String codice;

	@NotNull(message = "{dataAcquisto.notnull}")
	@Column(name = "dataAcquisto")
	private Date dataAcquisto;

	@NotNull(message = "{prezzo.notnull}")
	@Min(1)
	@Column(name = "prezzo")
	private Double prezzo;

	@NotNull(message = "{utente.notnull}")
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "utente_id")
	private Utente utente;

	public Acquisto() {
	}

	public Acquisto(String descrizione, String codice) {
		this.descrizione = descrizione;
		this.codice = codice;
	}

	public Acquisto(String descrizione, String codice, Date dataAcquisto, Double prezzo) {
		this.descrizione = descrizione;
		this.codice = codice;
		this.dataAcquisto = dataAcquisto;
		this.prezzo = prezzo;
	}

	public Acquisto(String descrizione, Date dataAcquisto, Double prezzo, Utente utente) {
		this.descrizione = descrizione;
		this.dataAcquisto = dataAcquisto;
		this.prezzo = prezzo;
		this.utente = utente;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public String getCodice() {
		return codice;
	}

	public void setCodice(String codice) {
		this.codice = codice;
	}

	public Date getDataAcquisto() {
		return dataAcquisto;
	}

	public void setDataAcquisto(Date dataAcquisto) {
		this.dataAcquisto = dataAcquisto;
	}

	public Double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(Double prezzo) {
		this.prezzo = prezzo;
	}

	public Utente getUtente() {
		return utente;
	}

	public void setUtente(Utente utente) {
		this.utente = utente;
	}

}
