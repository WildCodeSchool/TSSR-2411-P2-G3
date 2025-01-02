# Script Bash<br>

1) L'admin lance le script<br>

2) On choisit le menu du script<br>
     Qui voulez-vous cibler ?<br>
       a) utilisateur<br>
       b) ordinateur<br>
             b1) Nom de l'ordinateur<br>
             b2) Adresse IP<br>

a) Utilisateur<br>
    - Entrez votre nom (partiel ou complet)<br>
        - Si partiel, afficher la liste des utilisateurs correspondant aux caracètres saisis<br>
        - Si complet, afficher directement l'utilisateur<br>
    - Entrez le mot de passe<br>

a.1) Proposer une liste d'action :<br>
    - créer un utilisateur<br>
    - supprimer un utilisateur<br>
    - modifier les droits d'un utilisateur<br>
    - etc.<br>

a.2) Pour chaque action, message de réussite et enrigstrer les logs avec des "echo >> fichier_log"<br>

b) Ordinateur<br>
   - Entrez le nom de la machine ou son IP (partiel ou complet)<br>
        - Si partiel, afficher la liste des ordinateur correspondant aux caracètres saisis<br>
        - Si complet, afficher directement l'ordinateur<br>
    - Valider la connexion<br>

b.1) Proposer une liste d'action :<br>
     - redémarrer la machine<br>
     - éteindre la machine<br>
     - créer des dossiers :<br>
          - dossier compta (avec fichiers correspondants)<br>
          - dossier production (avec fichiers correspondants)<br>
     - etc.<br>

b.2) Pour chaque action, message de réussite et enrigstrer les logs avec des "echo >> fichier_log"<br>







# Difficultés

- Intégration de Dialog dans le script : il a fallu modifier l'ensemble du script pour intégrer dialog
- Difficultés pour intégrer l'autocomplétion : on a choisi de tester cette fonction sur la fonction collecte_utilisateurs_infos() avec la commande laslog.
Il y a eu plusieurs versions
     - sur la première version on avait une erreur, il n'affichait rien quel que soit l'utilisateur sélectionné avec un message ""lastlog : Utilisateur ou gamme inconnu : utilisateur"
     - on a modifié, le script, après cette modif lorsque le script trouvait 1 seul utilisateur avec la chaine de caractères tapée -> il affichait directement les infos de celui-ci, sans passer par une liste. Ca fonctionnait, mais le souci était que s'il y avait plusieurs utilisateurs et qu'il fallait en choisir un dans la liste, dans ce cas il affichait systémtatiquement "never logged in".
     - On a mis à jour le script et cette fois c'était OK, par contre pour que les logs soient affichés, il fallait que l'utilisateur se connecte au moins une fois en ssh, sinon on avait l'affichage "Never logged in". Pour résoudre ce problème on a donc ajouté dans le script la connexion automatique en ssh lors de la création d'un utilisateur.

