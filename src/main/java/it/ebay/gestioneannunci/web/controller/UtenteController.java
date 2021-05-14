package it.ebay.gestioneannunci.web.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import it.ebay.gestioneannunci.model.StatoUtente;
import it.ebay.gestioneannunci.model.Utente;
import it.ebay.gestioneannunci.service.ruolo.RuoloService;
import it.ebay.gestioneannunci.service.utente.UtenteService;

@Controller
@RequestMapping(value = "/utente")
public class UtenteController {

	@Autowired
	private UtenteService utenteService;
	@Autowired 
	private RuoloService ruoloService;
	@Autowired
	private PasswordEncoder paw;

	@GetMapping
	public ModelAndView listAllUtenti() {
		ModelAndView mv = new ModelAndView();
		List<Utente> utenti = utenteService.listAllUtenti();
		mv.addObject("utente_list_attribute", utenti);
		mv.setViewName("utente/list");
		return mv;
	}

	@GetMapping("/search")
	public String searchUtente(Model model) {
		model.addAttribute("list_stati_attr", StatoUtente.values());
		model.addAttribute("ruoloAttr", ruoloService.listAll());
		return "utente/search";
	}
	
	@PostMapping("/list")
	public String listUtenti(Utente utenteExample, ModelMap model) {
		List<Utente> utenti = utenteService.findByExample(utenteExample);
		model.addAttribute("utente_list_attribute", utenti);
		return "utente/list";
	}

	@GetMapping("/insert")
	public String createUtente(Model model) {
		model.addAttribute("insert_utente_attr", new Utente());
		return "utente/insert";
	}

	@PostMapping("/save")
	public String saveUtente(@Valid @ModelAttribute("insert_utente_attr") Utente utente, BindingResult result,
			RedirectAttributes redirectAttrs) {
		System.out.println(utente.getCognome());
		if (result.hasErrors()) {
			return "utente/insert";
		}
		utenteService.inserisciNuovo(utente);

		redirectAttrs.addFlashAttribute("successMessage", "Operazione eseguita correttamente");
		return "redirect:/utente";
	}
	
	@PostMapping("/cambiaStato")
	public String cambiaStato(@RequestParam(name = "idUtenteForChangingStato", required = true) Long idUtente) {
		utenteService.invertUserAbilitation(idUtente);
		return "redirect:/utente";
	}
	
	@GetMapping("/show/{idUtente}")
	public String showRegisti(@PathVariable(required = true) Long idUtente, Model model) {
		model.addAttribute("show_utente_attr", utenteService.caricaSingoloUtente(idUtente));
		return "utente/show";
	}
	
	
	
	
}
