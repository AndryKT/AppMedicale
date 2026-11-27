<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Connexion &ndash; AppM&eacute;dicale</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Bricolage+Grotesque:wght@500;700&family=Figtree:wght@400;500&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/login.css">
</head>
<body>
  <main class="page">
    <section class="intro">
      <div class="brand">
        <svg class="brand-mark" viewBox="0 0 24 24" width="28" height="28" aria-hidden="true">
          <rect x="9" y="2" width="6" height="20" rx="1.5" fill="currentColor"/>
          <rect x="2" y="9" width="20" height="6" rx="1.5" fill="currentColor"/>
        </svg>
        <span>AppM&eacute;dicale</span>
      </div>

      <div class="intro-body">
        <p class="intro-title">Les ant&eacute;c&eacute;dents m&eacute;dicaux, en un coup d&rsquo;&oelig;il.</p>
        <p class="intro-text">Connectez-vous pour consulter les dossiers. Les informations de sant&eacute; restent confidentielles.</p>
      </div>
    </section>

    <section class="panel">
      <form class="login" action="<%= request.getContextPath() %>/login" method="post" novalidate>
        <h1>Connexion</h1>
        <p class="lead">Acc&eacute;dez &agrave; votre espace.</p>

        <div class="field">
          <label for="email">Adresse e-mail</label>
          <input type="email" id="email" name="email" autocomplete="email" placeholder="nom@exemple.com" required>
        </div>

        <div class="field">
          <label for="password">Mot de passe</label>
          <div class="password-wrap">
            <input type="password" id="password" name="password" autocomplete="current-password" required>
            <button type="button" class="toggle" id="toggle" aria-controls="password" aria-pressed="false">Afficher</button>
          </div>
        </div>

        <div class="row">
          <label class="check">
            <input type="checkbox" name="remember">
            <span>Rester connect&eacute;</span>
          </label>
          <a href="#">Mot de passe oubli&eacute; ?</a>
        </div>

        <button type="submit" class="submit">Se connecter</button>

        <p class="signup">Pas encore de compte ? <a href="#">Cr&eacute;er un compte</a></p>
      </form>
    </section>
  </main>

  <script>
    const input = document.getElementById('password');
    const toggle = document.getElementById('toggle');
    toggle.addEventListener('click', () => {
      const show = input.type === 'password';
      input.type = show ? 'text' : 'password';
      toggle.textContent = show ? 'Masquer' : 'Afficher';
      toggle.setAttribute('aria-pressed', show);
    });
  </script>
</body>
</html>