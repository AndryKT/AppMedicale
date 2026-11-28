<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.List"%>
<%@page import="model.Patient"%>

<%
    List<Patient> patients = (List<Patient>) request.getAttribute("patients");

%>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://fonts.googleapis.com/css2?family=Bricolage+Grotesque:wght@500;700&family=Figtree:wght@400;500&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/app.css">
  <title>Patients &ndash; AppM&eacute;dicale</title>
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
        <h1>Patients</h1>
        <p>3 dossiers enregistr&eacute;s</p>
      </div>
      <a class="btn btn-primary" href="patient-creer.html">Ajouter un patient</a>
    </div>

    <form class="search" role="search" action="#" method="get">
      <label for="q" class="sr-only" style="position:absolute;left:-9999px">Rechercher un patient</label>
      <input type="search" id="q" name="q" placeholder="Rechercher par nom, pr&eacute;nom ou n&deg; de dossier">
      <button type="submit" class="btn">Rechercher</button>
    </form>

    <div class="table-wrap">
      <table>
        <thead>
          <tr>
            <th>N&deg; dossier</th>
            <th>Nom</th>
            <th>Pr&eacute;nom</th>
            <th>N&eacute;(e) le</th>
            <th>T&eacute;l&eacute;phone</th>
            <th><span style="position:absolute;left:-9999px">Actions</span></th>
          </tr>
        </thead>
        <tbody>
        <% for (Patient patient : patients) { %>
          <tr>
            <td class="num">P-<%= patient.getId() %></td>
            <td><%= patient.getNom() %></td>
            <td><%= patient.getPrenom() %></td>
            <td><%= patient.getDateNaissance() %></td>
            <td><%= patient.getTelephone() %></td>
            <td class="row-actions">
              <a class="btn btn-small" href="<%= request.getContextPath() %>/patient/<%= patient.getId() %>">Voir</a>
              <a class="btn btn-small" href="<%= request.getContextPath() %>/patient/<%= patient.getId() %>/modifier">Modifier</a>
              <button type="button" class="btn btn-small btn-link-danger" data-delete="Jean Rakoto">Supprimer</button>
            </td>
          </tr>

        <% } %>
          
        </tbody>
      </table>
    </div>
  </main>

  <!-- Confirmation de suppression -->
  <dialog id="confirm">
    <form method="post" action="#">
      <h2>Supprimer ce patient ?</h2>
      <p>Le dossier de <strong id="confirm-name"></strong> sera supprim&eacute; d&eacute;finitivement, avec ses ant&eacute;c&eacute;dents.</p>
      <div class="actions">
        <button type="button" class="btn" id="cancel">Annuler</button>
        <button type="submit" class="btn btn-danger">Supprimer le patient</button>
      </div>
    </form>
  </dialog>

  <script>
    const dialog = document.getElementById('confirm');
    document.querySelectorAll('[data-delete]').forEach(btn => {
      btn.addEventListener('click', () => {
        document.getElementById('confirm-name').textContent = btn.dataset.delete;
        dialog.showModal();
      });
    });
    document.getElementById('cancel').addEventListener('click', () => dialog.close());
  </script>
</body>
</html>