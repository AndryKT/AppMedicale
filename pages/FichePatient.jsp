<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://fonts.googleapis.com/css2?family=Bricolage+Grotesque:wght@500;700&family=Figtree:wght@400;500&display=swap" rel="stylesheet">
 <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/app.css">
  <title>Fiche patient &ndash; AppM&eacute;dicale</title>
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
        <h1>Jean Rakoto</h1>
        <p>Dossier P-0001</p>
      </div>
      <div class="actions">
        <a class="btn" href="patients.html">Retour &agrave; la liste</a>
        <a class="btn btn-primary" href="patient-modifier.html">Modifier</a>
      </div>
    </div>

    <dl class="detail">
      <dt>Nom</dt><dd>Rakoto</dd>
      <dt>Pr&eacute;nom</dt><dd>Jean</dd>
      <dt>Date de naissance</dt><dd>12/03/1985</dd>
      <dt>Sexe</dt><dd>Masculin</dd>
      <dt>Groupe sanguin</dt><dd>O+</dd>
      <dt>T&eacute;l&eacute;phone</dt><dd>034 12 345 67</dd>
      <dt>Adresse e-mail</dt><dd>jean.rakoto@exemple.com</dd>
      <dt>Adresse</dt><dd>Lot II A 45, Antananarivo</dd>
    </dl>
  </main>
</body>
</html>