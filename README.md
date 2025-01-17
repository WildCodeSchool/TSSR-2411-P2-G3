# 🔔 README.md
# ⏩ TSSR-2411-P2-G3 
# ⏩ The scripting project

# Sommaire
1. [Présentation et objectifs](#1-présentation-et-objectifs)
   1. [Objectif principal](#1-Objectif-principal)
   2. [Objectif secondaire](#2-Objectif-secondaire)
2. [Choix techniques](#2-Choix-techniques)
   1. [Client Windows 10](#1-Client-Windows-10)
   2. [Client Ubuntu](#2-Client-Ubuntu)
   3. [Serveur Windows Server 2022](#3-Serveur-Windows-Server-2022)
   4. [Serveur Debian 12](#4-Serveur-Debian-12)
3. [Membres du groupe](#3-Membres-du-groupe)
4. [Réalisation des tâches](#4-Réalisation-des-tâches)
5. [Difficultés solutions et améliorations](#5-Difficultés-solutions-et-améliorations)
   1. [Difficultés rencontrées et problèmes techniques rencontrés](#1-Difficultés-rencontrées-et-problèmes-techniques-rencontrés)
   2. [Solutions trouvées ou alternatives trouvées](#2-Solutions-trouvées-ou-alternatives-trouvées)
   3. [Améliorations possibles et suggestions pour le futur](#3-Améliorations-possibles-et-suggestions-pour-le-futur)

## 1. Présentation et objectifs
Le but de ce projet est de produire un script Bash ou Powershell, qui permette de se connecter sur un ordinateur distant et d’effectuer un ensemble de tâches via un menu accessible sur le shell.

### 1. Objectif principal
 * Créer un script qui s’exécute sur une machine et effectue des tâches sur des machines distantes :
    * Depuis Windows Server vers Windows
    * Depuis Debian vers Ubuntu
 * Rédiger la documentation de configuration des environnements et de l’exécution du script
 * Présenter le projet

### 2. Objectif secondaire
 * Depuis un serveur Debian, cibler une machine Windows ou depuis Windows Server 2022, cibler une machine Ubuntu

## 2. Choix techniques

### 1. Client Windows 10
  * Nom : CLIWIN01
  * Compte utilisateur : wilder (dans le groupe des admins locaux)
  * Mot de passe : Azerty1*
  * Adresse IP fixe : 172.16.10.20/24

### 2. Client Ubuntu
  * Nom : CLILIN01
  * Compte utilisateur : wilder (dans le groupe sudo)
  * Mot de passe : Azerty1*
  * Adresse IP fixe : 172.16.10.30/24

### 3. Serveur Windows Server 2022
  * Nom : SRVWIN01
  * Compte : Administrator (dans le groupe des admins locaux)
  * Mot de passe : Azerty1*
  * Adresse IP fixe : 172.16.10.5/24

### 4. Serveur Debian 12
  * Nom : SRVLX01
  * Compte : root
  * Mot de passe : Azerty1*
  * Adresse IP fixe : 172.16.10.10/24

## 3. Membres du groupe


| Rôles du groupe | SPRINT 1 | SPRINT 2 | SPRINT 3 | SPRINT 4 |  
|:--------| :-------: | :-----------: | :-----------: | :--------: |
| Scrum Master  | Saddem  | Karim | Philippe | Angel | 
| Product Owner |  Angel | Saddem |  Karim | Philippe |  
| Technicien 1  |  Philippe |  Angel | Saddem | Karim |
| Technicien 2 |  Karim | Philippe | Angel | Saddem | 


## 4. Réalisation des tâches
Les scripts Bash et Powershell contiennent chacun 19 actions, toutes exécutées via SSH. Voici les taux de réalisation de chacun d'eux :
### `- BASH : 100%`
### `- POWERSHELL : 95%`


|`Cible`|`Tâche`|`Bash`|`PowerShell`|
|:-:|:-:|:-:|:-:|
|Utilisateur|Afficher la liste des utilisateurs|:white_check_mark:|:white_check_mark:|
|Utilisateur|Créer un utilisateur|:white_check_mark:|:white_check_mark:|
|Utilisateur|Modifier le mot de passe d'un utilisateur|:white_check_mark:|:white_check_mark:|
|Utilisateur|Supprimer un utilisateur|:white_check_mark:|:white_check_mark:|
|Ordinateur|Lister les services actifs|:white_check_mark:|:white_check_mark:|
|Ordinateur|Démarrer un service|:white_check_mark:|:white_check_mark:|
|Ordinateur|Arrêter un service|:white_check_mark:|:white_check_mark:|
|Ordinateur|Afficher les partitions des disques|:white_check_mark:|:white_check_mark:|
|Ordinateur|Version du système|:white_check_mark:|:white_check_mark:|
|Ordinateur|Rechercher les mises à jour|:white_check_mark:|:white_check_mark:|
|Ordinateur|Mettre à jour le système|:white_check_mark:|:x:|
|Ordinateur|Lister les mises à jour|:white_check_mark:|:white_check_mark:|
|Ordinateur|Arrêter un ordinateur|:white_check_mark:|:white_check_mark:|
|Ordinateur|Redémarrer un ordinateur|:white_check_mark:|:white_check_mark:|
|Utilisateur|Informations sur un utilisateur|:white_check_mark:|:white_check_mark:|
|Ordinateur|Informations sur un ordinateur|:white_check_mark:|:white_check_mark:|
|Ordinateur|Consulter les logs|:white_check_mark:|:white_check_mark:|
|Utilisateur|Consulter les infos utilisateur|:white_check_mark:|:white_check_mark:|
|Ordinateur|Consulter les infos de l'ordinateur|:white_check_mark:|:white_check_mark:|


## 5. Difficultés solutions et améliorations

### 1. Difficultés rencontrées et problèmes techniques rencontrés

1) Notre première difficulté a été de prendre du recul et de réfléchir aux différentes fonctionnalités que nous souhaitions implémenter dans le script. La première semaine nous avons démarrer le script Bash avec comme objectif de pouvoir se connecter sur la machine distante et de faire quelques actions dessus. Mais à un moment donné nous avons réalisé qu'il était important de réaliser le squelette du script pour bien ordonner nos idées et savoir de quoi seraient composés les différents menu.
Cette étape que nous avons réalisé en fin de semaine 1 a véritablement posé les bases de tout ce que nous avons fait ensuite.
2) Une autre difficulté a été de se connecter en SSH sans mot de passe, que ce soit avec Bash ou Powershell (essais toujours en cours sur Powershell). Nous avons fait beaucoup de manipulations, principalement de la modification de fichiers, et cela nous a pris de nombreuses heures.
3) Difficulté également pour intégrer l'autocomplétion : on a choisi de tester cette fonction sur la fonction collecte_utilisateurs_infos() avec la commande lastlog. Il y a eu plusieurs versions
sur la première version on avait une erreur, il n'affichait rien quel que soit l'utilisateur sélectionné avec un message "lastlog : Utilisateur ou gamme inconnu : utilisateur".<br>
On a modifié le script, après cette modif lorsque le script trouvait 1 seul utilisateur avec la chaine de caractères tapée -> il affichait directement les infos de celui-ci, sans passer par une liste. Ca fonctionnait, mais le souci était que s'il y avait plusieurs utilisateurs et qu'il fallait en choisir un dans la liste, dans ce cas il affichait systémtatiquement "never logged in".<br>
On a mis à jour le script et cette fois c'était OK, par contre pour que les logs soient affichés, il fallait que l'utilisateur se connecte au moins une fois en ssh, sinon on avait l'affichage "Never logged in". Pour résoudre ce problème on a donc ajouté dans le script la connexion automatique en ssh lors de la création d'un utilisateur.
4) Intégration difficile de Dialog dans Bash
Pour améliorer l'expérience utilisateur nous avons choisi d'utiliser Dialog, qui permet un affichage plus convivial et intuitif que celui proposé dans un menu basique. Sauf que nous l'avons implémenter alors que nous avions déjà rédigé la majeure partie de notre script. L'intégration de Dialog s'est avérée difficile, car elle imposait que revoir en profondeur chaque fonction pour s'afficher correctement. Et c'était notamment le cas lorsqu'il fallait afficher des informations renvoyées par le cient, comme par exemple la liste des utilisateur.
Si cela avait été à refaire, nous aurions directement débuté notre script Bash avec Dialog, et cela nous a servi de leçon avec Powershell, puisque le module FZF a été adopté et intégré dès les premières lignes du script.
5) En règle générale l'écriture du script a été marquée par de très nombreux soucis techniques :
Commandes qui ne fonctionne pas car :
  - la syntaxe est juste mais un élément manquant empêche la bonne exécution de la commande
  - le PC distant n'a pas la configuration requise pour exécuter la commande (manque un module par exemple)

### 2. Solutions trouvées ou alternatives trouvées
 1)  En règle générale nous avons réussi à trouver une solution pour chaque problème rencontré. Cela s'est fait au prix de nombreuses recherches sur internet et de nombreux tests sur nos VM. Nous nous sommes par exemple documentés pour trouver les commandes à implémenter dans le script, améliorer notre syntaxe, ou encore ajouter des éléments que nous aurions oublié.
 2)  La création d'un fichier temporaire ``$tempfile`` pour récupérer les infos renvoyées par le PC distant et les afficher correctement dans Dialog a été très utile et nous a servi dans de nombreuses fonctions.
 

### 3. Améliorations possibles et suggestions pour le futur
1) Finaliser toutes les commandes sur Powershell
2) Implémenter de nouvelles commandes pour Bash et Powershell
3) Renforcer les tests de variables de chaque fonction pour prendre en compte tous les cas de figure
4) Réussir à se connecter sans mot de passe en ssh sur Powershell
5) Améliorer la navigation dans le menu avec un fil d'Ariane comme sur un site web
6) Se connecter à une machine équipée d'un autre OS (nous n'avons pas eu le temps de le mettre en place)
