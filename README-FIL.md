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
Les scripts Bash et Powershell contiennent chacun 19 actionit 58 commandes à réaliser au total par langage :
36 commandes en local + 22 commandes à distance en SSH.
Taux de réalisation en pourcentage des commandes :
#### `- BASH : 81%`
#### `- POWERSHELL : 10%`


|`Cible`|`Tâche`|`Bash`|`PowerShell`|
|:-:|:-:|:-:|:-:|
|Utilisateur|Afficher la liste des utilisateurs|:white_check_mark:|:white_check_mark:|
|Utilisateur|Créer un utilisateur|:white_check_mark:|:white_check_mark:|
|Utilisateur|Modifier le mot de passe d'un utilisateur|:white_check_mark:|:white_check_mark:|
|Utilisateur|Supprimer un utilisateur|:white_check_mark:|:white_check_mark:|
|Ordinateur|Lister les services actifs|:white_check_mark:|:x:|
|Ordinateur|Démarrer un service|:white_check_mark:|:x:|
|Ordinateur|Arrêter un service|:white_check_mark:|:x:|
|Ordinateur|Afficher les partitions des disques|:white_check_mark:|:x:|
|Ordinateur|Version du système|:white_check_mark:|:x:|
|Ordinateur|Rechercher et appliquer les mises à jour|:white_check_mark:|:x:|
|Ordinateur|Lister les mises à jour|:white_check_mark:|:white_check_mark:|
|Ordinateur|Mettre à jour le système|:white_check_mark:|:white_check_mark:|
|Ordinateur|Arrêter un ordinateur|:white_check_mark:|:white_check_mark:|
|Ordinateur|Redémarrer un ordinateur|:white_check_mark:|:white_check_mark:|
|Utilisateur|Informations sur un utilisateur|:white_check_mark:|:x::|
|Ordinateur|Informations sur un ordinateur|:white_check_mark:|:x:|
|Ordinateur|Consulter les logs|:white_check_mark:|:x:|
|Utilisateur|Consulter les infos utilisateur|:white_check_mark:|:x:|
|Ordinateur|Consulter les infos de l'ordinateur|:white_check_mark:|:x:|


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
