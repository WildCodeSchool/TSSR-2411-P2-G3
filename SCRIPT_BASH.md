# Script Bash

1) L'admin lance le script

2) On choisit le menu du script
     Qui voulez-vous cibler ?
       a) utilisateur
       b) ordinateur
             b1) Nom de l'ordinateur
             b2) Adresse IP

a) Utilisateur
    - Entrez votre nom (partiel ou complet)
        - Si partiel, afficher la liste des utilisateurs correspondant aux caracètres saisis
        - Si complet, afficher directement l'utilisateur
    - Entrez le mot de passe

a.1) Proposer une liste d'action :
    - créer un utilisateur
    - supprimer un utilisateur
    - modifier les droits d'un utilisateur
    - etc.

a.2) Pour chaque action, message de réussite et enrigstrer les logs avec des "echo >> fichier_log"

b) Ordinateur
   - Entrez le nom de la machine ou son IP (partiel ou complet)
        - Si partiel, afficher la liste des ordinateur correspondant aux caracètres saisis
        - Si complet, afficher directement l'ordinateur
    - Valider la connexion

b.1) Proposer une liste d'action :
     - redémarrer la machine
     - éteindre la machine
     - créer des dossiers :
          - dossier compta (avec fichiers correspondants)
          - dossier production (avec fichiers correspondants)
     - etc.

b.2) Pour chaque action, message de réussite et enrigstrer les logs avec des "echo >> fichier_log"

