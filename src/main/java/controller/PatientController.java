package controller;

import database.JpaManager;
import model.ModelAndView;
import java.util.List;
import jakarta.persistence.EntityManager;
import model.Patient;
import model.User;

@Controller
public class PatientController {
    @UrlMapping(value = "/patient", method = "GET")
    public ModelAndView afficherPagePatient() {
        EntityManager entityManager = (EntityManager) JpaManager.createEntityManager();
        List<Patient> patients;
        try {
            patients = entityManager
                    .createQuery("SELECT p FROM Patient p", Patient.class)
                    .getResultList();
        } finally {
            JpaManager.closeEntityManager(entityManager);
        }

        ModelAndView modelAndView = new ModelAndView("/pages/ListePatient.jsp");
        modelAndView.addObject("patients", patients);
        return modelAndView;
    }

    @UrlMapping(value = "/patient/{id}", method = "GET")
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
