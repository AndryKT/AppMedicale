package model;

public class Patient {
    private String etatCivile;
    private String identifiant;

    public Patient() {
        
    }

    public String getEtatCivile() {
        return etatCivile;
    }

    public void setEtatCivile(String etatCivile) {
        this.etatCivile = etatCivile;
    }

    public String getIdentifiant() {
        return identifiant;
    }

    public void setIdentifiant(String identifiant) {
        this.identifiant = identifiant;
    }
}
