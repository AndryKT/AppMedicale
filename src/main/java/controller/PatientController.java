package controller;

import database.JpaManager;
import model.ModelAndView;
import java.util.List;
import jakarta.persistence.EntityManager;
import model.User;

@Controller
public class PatientController {
    @UrlMapping(value = "/patient", method = "GET")
    public ModelAndView afficherPagePatient() {
        ModelAndView modelAndView = new ModelAndView("/pages/PatientListe.jsp");
        return modelAndView;
    }

    @UrlMapping(value = "/patient/fiche", method = "GET")
    public ModelAndView afficherFichePatient() {
        ModelAndView modelAndView = new ModelAndView("/pages/FichePatient.jsp");
        return modelAndView;
    }

    @UrlMapping(value = "/patient/form", method = "GET")
    public ModelAndView afficherFormPatient() {
        ModelAndView modelAndView = new ModelAndView("/pages/CreationPatient.jsp");
        return modelAndView;
    }

    @UrlMapping(value = "/users", method = "GET")
    @JsonResponse
    public List<User> users() {
        EntityManager entityManager = (EntityManager) JpaManager.createEntityManager();
        try {
            return entityManager
                    .createQuery("SELECT u FROM User u", User.class)
                    .getResultList();
        } finally {
            JpaManager.closeEntityManager(entityManager);
        }
    }
}
