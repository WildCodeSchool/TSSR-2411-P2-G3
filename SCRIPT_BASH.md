# Script Bash

1) On lance le terminal : on choisit si on veut utiliser le terminal ou lancer le menu du script

2) On choisit le menu du script
     Qui voulez vous cilbler ?
       a) utilisateur
       b) ordinateur

a) Utilisateur
    - Entrez votre nom (partiel ou complet)
        - Si partiel, afficher la liste des utilisateur correspondant aux caracètres saisi
        - Si complet, afficher directement l'utilisateur
    - Entrez le mot de passe

a.1) Proposer une liste d'action :
    - ajouter un utilisateur
    - supprimer un utilisateur
    - modifier les droits d'un utilisateur
    - etc.

a.2) Pour chaque action, message de réussite et enrigstrer les logs avec des "echo >> fichier_log"

b) ordinateur
   - Entrez le nom de la machine (partiel ou complet)
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
