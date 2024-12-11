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

