package controller;

import model.ModelAndView;
import model.Etudiant;
import controller.*;
import java.util.ArrayList;
import java.util.List;


@Controller
public class EtudiantController {
    @UrlMapping(value = "/etudiant" , method = "GET")
    public ModelAndView afficherPageEtudiant() {
        ModelAndView modelAndView = new ModelAndView("/pages/Etudiant.jsp");
        modelAndView.addObject("message", "Bienvenue sur la page de l'étudiant !");
        return modelAndView;
    } 
    
    @UrlMapping(value = "/etudiant/liste" , method = "GET")
    @JsonResponse
    public Object afficherListeEtudiants() {
        Etudiant etudiant1 = new Etudiant("Doe", "John");
        Etudiant etudiant2 = new Etudiant("Smith", "Jane");
        List<Etudiant> listeEtudiants = new ArrayList<>();
        listeEtudiants.add(etudiant1);
        listeEtudiants.add(etudiant2);
        return listeEtudiants;
    }
}
