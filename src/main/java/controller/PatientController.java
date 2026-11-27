package controller;

import model.Patient;
import model.ModelAndView;
import controller.*;
import java.util.ArrayList;
import java.util.List;


@Controller
public class PatientController {
    @UrlMapping(value = "/patient" , method = "GET")
    public ModelAndView afficherPagePatient() {
        ModelAndView modelAndView = new ModelAndView("/pages/PatientListe.jsp");
        return modelAndView;
    } 
    
    @UrlMapping(value = "/patient/fiche" , method = "GET")
    public ModelAndView afficherFichePatient(){
        ModelAndView modelAndView = new ModelAndView("/pages/FichePatient.jsp");
        return modelAndView;
    }

    @UrlMapping(value = "/patient/form" , method = "GET")
    public ModelAndView afficherFormPatient(){
        ModelAndView modelAndView = new ModelAndView("/pages/CreationPatient.jsp");
        return modelAndView;
    }
}
