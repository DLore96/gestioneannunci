package it.ebay.gestioneannunci.web.controller;

import it.ebay.gestioneannunci.model.RegistrationParam;
import it.ebay.gestioneannunci.model.StatoUtente;
import it.ebay.gestioneannunci.model.Utente;
import it.ebay.gestioneannunci.service.ruolo.RuoloService;
import it.ebay.gestioneannunci.service.utente.UtenteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.security.Principal;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/areaprivata")
public class AreaPrivataController {

    @Autowired
    private UtenteService utenteService;

    @Autowired
    private RuoloService ruoloService;

    @GetMapping
    public ModelAndView listUtente(Principal principal) {
        Utente utenteInSessione = utenteService.findByUsername(principal.getName());
        ModelAndView mv = new ModelAndView();
        mv.addObject("utente_attribute", utenteInSessione);
        mv.addObject("annuncio_list_attribute", utenteInSessione.getAcquisti());
        mv.setViewName("/areaprivata/index");
        return mv;
    }

    @GetMapping("/edit/{idUtente}")
    public String editUtente(@PathVariable(required = true) Long idUtente, Model model) {
        Utente utente=utenteService.caricaSingoloUtente(idUtente);
        if (utente.getRuoli() != null && !utente.getRuoli().isEmpty())
            utente=utenteService.caricaUtenteConRuoli(idUtente);
        model.addAttribute("utente_attribute", utente);
        return "areaprivata/edit";
    }

    @PostMapping("/saveEdit/")
    public String executeUpdateUtente(@RequestParam(name = "passwordNuova") String passwordNuova, @Validated(RegistrationParam.class) @ModelAttribute("utente_attribute") Utente utente, BindingResult result,
                                      Model model, RedirectAttributes redirectAttrs) {

        Utente utenteCaricato = utenteService.caricaSingoloUtente(utente.getId());
        utente.setCreditoResiduo(utenteCaricato.getCreditoResiduo());
        utente.setDateCreated(utenteCaricato.getDateCreated());
        utente.setStato(utenteCaricato.getStato());
        utente.setRuoli(utenteCaricato.getRuoli());

        if (utente.getPassword() != null && !utente.getPassword().equals(passwordNuova)) {
            result.rejectValue("password", "Fdsfdsf.sdfsdf", "Le due password non coincidono");
        }

        if (result.hasErrors())
            return "areaprivata/edit";

        utenteService.aggiorna(utente);

        redirectAttrs.addFlashAttribute("successMessage", "Operazione eseguita correttamente");
        return "redirect:/areaprivata";

    }

}
