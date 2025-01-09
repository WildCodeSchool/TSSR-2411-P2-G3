# Documentation générale
# TSSR-2411-P2-G3 
# The scripting project
<br>

## 1. Presentation et objectifs.
Le but de ce projet est de produire un script Bash ou Powershell, qui permette de se connecter sur un ordinateur distant et d’effectuer un ensemble de tâches via un menu accessible sur le shell.

### Objectif principal
 * Créer un script qui s’exécute sur une machine et effectue des tâches sur des machines distantes :
    * Depuis Windows Server vers Windows
    * Depuis Debian vers Ubuntu
 * Rédiger la documentation de configuration des environnements et de l’exécution du script
 * Présenter le projet

### Objectif secondaire
 * Depuis un serveur Debian, cibler une machine Windows ou depuis Windows Server 2022, cibler une machine Ubuntu

## 2. Choix techniques

### Client Windows 10
  * Nom : CLIWIN01
  * Compte utilisateur : wilder (dans le groupe des admins locaux)
  * Mot de passe : Azerty1*
  * Adresse IP fixe : 172.16.10.20/24

### Client Ubuntu 22.04/24.04 LTS
  * Nom : CLILIN01
  * Compte utilisateur : wilder (dans le groupe sudo)
  * Mot de passe : Azerty1*
  * Adresse IP fixe : 172.16.10.30/24

### Serveur Windows Server 2022
  * Nom : SRVWIN01
  * Compte : Administrator (dans le groupe des admins locaux)
  * Mot de passe : Azerty1*
  * Adresse IP fixe : 172.16.10.5/24

### Serveur Debian 12
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


### 4 Taux de réalisation des tâches
Il y avait 58 commandes à réaliser au total par langage :
36 commandes en local + 22 commandes à distance en SSH.
Taux de réalisation en pourcentage des commandes :
#### `- BASH : 81%`
#### `- POWERSHELL : 10%`


|`Type`|`Cible`|`Tâche`|`Bash`|`PowerShell`|
|:-:|:-:|:-:|:-:|:-:|
|Action|Utilisateur|Création de compte utilisateur local|:white_check_mark:|:x:|
|Action|Utilisateur|Changement de mot de passe|:white_check_mark:|:x:|
|Action|Utilisateur|Suppression de compte utilisateur local|:white_check_mark:|:x:|
|Action|Utilisateur|Désactivation de compte utilisateur local|:white_check_mark:|:x:|
|Action|Utilisateur|Ajout à un groupe d'administration|:white_check_mark:|:x:|
|Action|Utilisateur|Ajout à un groupe local|:white_check_mark:|:x:|
|Action|Utilisateur|Sortie d’un groupe local|:white_check_mark:|:x:|
|Action|Ordinateur client|Arrêt (local)|:white_check_mark:|:x:|
|Action|Ordinateur client |Arrêt (SSH)|:x:|:white_check_mark:|
|Action|Ordinateur client|Redémarrage (local)|:white_check_mark:|:x:|
|Action|Ordinateur client|Redémarrage (SSH)|:x:|:white_check_mark:|
|Action|Ordinateur client|Verrouillage (local)|:white_check_mark:|:x:|
|Action|Ordinateur client|Verrouillage (SSH)|:x:|:white_check_mark:|
|Action|Ordinateur client|Mise-à-jour du système (local)|:white_check_mark:|:x:|
|Action|Ordinateur client|Mise-à-jour du système (SSH)|:x:|:white_check_mark:|
|Action|Ordinateur client|Création de répertoire (local)|:white_check_mark:|:x:|
|Action|Ordinateur client|Création de répertoire (SSH)|:x:|:white_check_mark:|
|Action|Ordinateur client|Modification de répertoire (local)|:white_check_mark:|:x:|
|Action|Ordinateur client|Modification de répertoire (SSH)|:x:|:x:|
|Action|Ordinateur client|Suppression de répertoire (local)|:white_check_mark:|:x:|
|Action|Ordinateur client|Suppression de répertoire (SSH)|:x:|:x:|
|Action|Ordinateur client|Activation du pare-feu (local)|:white_check_mark:|:x:|
|Action|Ordinateur client|Activation du pare-feu (SSH)|:x:|:x:|
|Action|Ordinateur client|Désactivation du pare-feu (local)|:white_check_mark:|:x:|
|Action|Ordinateur client|Désactivation du pare-feu (SSH)|:x:|:x:|
|Action|Ordinateur client|Installation de logiciel (local)|:white_check_mark:|:x:|
|Action|Ordinateur client|Installation de logiciel (SSH)|:x:|:x:|
|Action|Ordinateur client|Désinstallation de logiciel (local)|:white_check_mark:|:x:|
|Action|Ordinateur client|Désinstallation de logiciel (SSH)|:x:|:x:|
|Information|Utilisateur|Date de dernière connexion d’un utilisateur|:white_check_mark:|:x:|
|Information|Utilisateur|Date de dernière modification du mot de passe|:white_check_mark:|:x:|
|Information|Utilisateur|Liste des sessions ouvertes par l'utilisateur|:white_check_mark:|:x:|
|Information|Utilisateur|Groupe d’appartenance d’un utilisateur|:white_check_mark:|:x:|
|Information|Utilisateur|Historique des commandes exécutées par l'utilisateur|:white_check_mark:|:x:|
|Information|Utilisateur|Droits/permissions de l’utilisateur sur un dossier|:white_check_mark:|:x:|
|Information|Utilisateur|Droits/permissions de l’utilisateur sur un fichier|:white_check_mark:|:x:|
|Information|Ordinateur client|Version de l'OS (local)|:white_check_mark:|:x:|
|Information|Ordinateur client|Version de l'OS (SSH)|:white_check_mark:|:white_check_mark:|
|Information|Ordinateur client|Nombre de disque (local)|:white_check_mark:|:x:|
|Information|Ordinateur client|Nombre de disque (SSH)|:white_check_mark:|:x:|
|Information|Ordinateur client|Partition (nombre, nom, FS, taille) par disque (local)|:white_check_mark:|:x:|
|Information|Ordinateur client|Partition (nombre, nom, FS, taille) par disque (SSH)|:white_check_mark:|:x:|
|Information|Ordinateur client|Espace disque restant par partition/volume (local)|:white_check_mark:|:x:|
|Information|Ordinateur client|Espace disque restant par partition/volume (SSH)|:white_check_mark:|:x:|
|Information|Ordinateur client|Nom et espace disque d'un dossier (nom de dossier demandé) (local)|:white_check_mark:|:x:|
|Information|Ordinateur client|Nom et espace disque d'un dossier (nom de dossier demandé) (SSH)|:x:|:x:|
|Information|Ordinateur client|Liste des lecteurs monté (disque, CD, etc.) (local)|:white_check_mark:|:x:|
|Information|Ordinateur client|Liste des lecteurs monté (disque, CD, etc.) (SSH)|:white_check_mark:|:x:|
|Information|Ordinateur client|Liste des applications/paquets installées (local)|:white_check_mark:|:x:|
|Information|Ordinateur client|Liste des applications/paquets installées (SSH)|:white_check_mark:|:x:|
|Information|Ordinateur client|Liste des services en cours d'execution (local)|:white_check_mark:|:x:|
|Information|Ordinateur client|Liste des services en cours d'execution (SSH)|:white_check_mark:|:x:|
|Information|Ordinateur client|Liste des utilisateurs locaux (local)|:white_check_mark:|:x:|
|Information|Ordinateur client|Liste des utilisateurs locaux (SSH)|:white_check_mark:|:x:|
|Information|Ordinateur client|Mémoire RAM totale (local)|:white_check_mark:|:x:|
|Information|Ordinateur client|Mémoire RAM totale (SSH)|:white_check_mark:|:x:|
|Information|Ordinateur client|Utilisation de la RAM (local)|:white_check_mark:|:x:|
|Information|Ordinateur client|Utilisation de la RAM (SSH)|:white_check_mark:|:x:|
|Information|Script|Recherche des evenements dans le fichier log_evt.log pour un utilisateur|:white_check_mark:|:x:|
|Information|Script|Recherche des evenements dans le fichier log_evt.log pour un ordinateur|:white_check_mark:|:x:|


## 4. Difficultés / Solutions / Améliorations

### Difficultés rencontrées : problèmes techniques rencontrés**

1) Notre première difficulté a été de comprendre les besoins de ce script, et donc les solutions que nous allions devoir trouver.
2) La recherche et la compréhension des commandes pour les actions demandées.
3) Temps passé à coder des parties en local et en SSH qui ne devaient être qu'en SSH.
4) La compréhention de ce que représente, ainsi que la création de la partie information.
5) Organisation dans le groupe, notament un agenda commun des tache type Myro.


### Solutions trouvées : Solutions et alternatives trouvées**
 1)  Beaucoup de temps passé à se documenter
 

### Améliorations possibles : suggestions d’améliorations futures**
1) Finir les commandes
2) Implémenter les adresses IP dans le fichier des Logs
