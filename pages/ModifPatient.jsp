<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://fonts.googleapis.com/css2?family=Bricolage+Grotesque:wght@500;700&family=Figtree:wght@400;500&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/app.css">
  <title>Modifier un patient &ndash; AppM&eacute;dicale</title>
</head>
<body>
  <header class="topbar">
    <a class="brand" href="patients.html">
      <svg viewBox="0 0 24 24" width="22" height="22" aria-hidden="true"><rect x="9" y="2" width="6" height="20" rx="1.5" fill="currentColor"/><rect x="2" y="9" width="20" height="6" rx="1.5" fill="currentColor"/></svg>
      AppM&eacute;dicale
    </a>
    <nav>
      <a href="patients.html" aria-current="page">Patients</a>
      <a href="../login.html">D&eacute;connexion</a>
    </nav>
  </header>

  <main class="container">
    <div class="page-head">
      <div>
        <h1>Modifier le patient</h1>
        <p>Jean Rakoto &middot; P-0001</p>
      </div>
    </div>

    <form class="form-card" action="#" method="post">
      <div class="form-grid">
        <div class="field">
          <label for="num">N&deg; de dossier</label>
          <input type="text" id="num" name="numero" value="P-0001" readonly>
        </div>
        <div class="field">
          <label for="naissance">Date de naissance</label>
          <input type="date" id="naissance" name="date_naissance" value="1985-03-12" required>
        </div>
        <div class="field">
          <label for="nom">Nom</label>
          <input type="text" id="nom" name="nom" value="Rakoto" autocomplete="family-name" required>
        </div>
        <div class="field">
          <label for="prenom">Pr&eacute;nom</label>
          <input type="text" id="prenom" name="prenom" value="Jean" autocomplete="given-name" required>
        </div>
        <div class="field">
          <label for="sexe">Sexe</label>
          <select id="sexe" name="sexe" required>
            <option value="">Choisir</option>
            <option value="M" selected>Masculin</option>
            <option value="F">F&eacute;minin</option>
          </select>
        </div>
        <div class="field">
          <label for="groupe">Groupe sanguin</label>
          <select id="groupe" name="groupe_sanguin">
            <option value="">Inconnu</option>
            <option>A+</option><option>A-</option><option>B+</option><option>B-</option>
            <option>AB+</option><option>AB-</option><option selected>O+</option><option>O-</option>
          </select>
        </div>
        <div class="field">
          <label for="tel">T&eacute;l&eacute;phone</label>
          <input type="tel" id="tel" name="telephone" value="034 12 345 67" autocomplete="tel">
        </div>
        <div class="field">
          <label for="email">Adresse e-mail</label>
          <input type="email" id="email" name="email" value="jean.rakoto@exemple.com" autocomplete="email">
        </div>
        <div class="field full">
          <label for="adresse">Adresse</label>
          <textarea id="adresse" name="adresse" autocomplete="street-address">Lot II A 45, Antananarivo</textarea>
        </div>
      </div>
      <div class="form-actions">
        <button type="submit" class="btn btn-primary">Enregistrer les modifications</button>
        <a class="btn" href="patients.html">Annuler</a>
      </div>
    </form>
  </main>
</body>
</html>