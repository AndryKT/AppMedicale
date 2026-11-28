package controller;

import model.Patient;
import model.ModelAndView;
import model.MySession;

@Controller
public class LoginController {
    @UrlMapping(value = "/", method = "GET")
    public ModelAndView login(String identifiant, MySession session) {
        session.add("identifiant", identifiant);
        return new ModelAndView("accueil");
    }
}
