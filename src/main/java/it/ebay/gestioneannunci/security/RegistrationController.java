package it.ebay.gestioneannunci.security;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import it.ebay.gestioneannunci.model.RegistrationParam;
import it.ebay.gestioneannunci.model.StatoUtente;
import it.ebay.gestioneannunci.model.Utente;
import it.ebay.gestioneannunci.service.ruolo.RuoloService;
import it.ebay.gestioneannunci.service.utente.UtenteService;

@Controller
@RequestMapping("/registration")
public class RegistrationController {
	
	 @Autowired
	    private UtenteService utenteService;
	 @Autowired
	 private RuoloService ruoloService;

	    @GetMapping
	    public ModelAndView prepareRegistration() {

	        ModelAndView mv = new ModelAndView();
	        Utente utente = new Utente();
	        mv.addObject("utente_attribute", utente);
	        mv.setViewName("registration/register");
	        return mv;
	    }

	    @PostMapping("/save")
	    public String saveUser(@RequestParam String passwordNuova,
	                           @Validated({RegistrationParam.class})@ModelAttribute("utente_attribute") Utente utente,
	                           BindingResult result, RedirectAttributes redirectAttrs, HttpServletRequest request) {

	        if (utente.getPassword() != null && !utente.getPassword().equals(passwordNuova)) {
	            result.rejectValue("password", "Fdsfdsf.sdfsdf", "Le due password non coincidono");
	        }
	        if (result.hasErrors()) {
	            return "registration/register";
	        }

	        utente.setDateCreated(new Date());
	        utente.setStato(StatoUtente.CREATO);
	        utente.getRuoli().add(ruoloService.caricaSingoloElemento(2L));
	        utenteService.inserisciNuovo(utente);

	        redirectAttrs.addFlashAttribute("successMessage", "Operazione eseguita correttamente");
	        return "redirect:/login";
	    }
	
	
}
