# 🔔 INSTALL-WINDOWS.md
## ⏩ TSSR-2411-P2-G3 / The scripting project
# Sommaire
1. [Prérequis technique](#1-prérequis-technique)
2. [Installation de base des systèmes et de leur environnement](#2-installation-de-base-des-systèmes-et-de-leur-environnement)
   1. [Machine client sous Windows 10](#1-machine-client-sous-windows-10)
      1. [Installation de Windows 10](#1-installation-de-windows-10)
      2. [Renommage du PC](#2-renommage-du-pc-windows-10)
      3. [Mises à jour Windows Update](#3-mises-à-jour-windows-update-windows-10)
      4. [Configuration d'une IP fixe](#4-configuration-dune-ip-fixe-windows-10)
      5. [Installation et configuration de SSH](#5-installation-et-configuration-de-SSH)
   2. [Machine administrateur sous Windows Server 2022](#2-machine-administrateur-sous-windows-server-2022)
      1. [Installation de Windows Server 2022](#1-installation-de-windows-server-2022)
      2. [Renommage du PC](#2-renommage-du-pc-windows-server-2022)
      3. [Ajout du compte Administrator](#3-ajout-du-compte-administrator)
      4. [Mises à jour Windows Update](#4-mises-à-jour-windows-update-windows-server-2022)
      5. [Configuration d'une IP fixe](#5-configuration-dune-ip-fixe-windows-server-2022)
      6. [Installation et configuration de SSH](#6-installation-et-configuration-de-SSH)
      7. [Aller plus loin en se connectant en SSH sans mot de passe](#7-Aller-plus-loin-en-se-connectant-en-SSH-sans-mot-de-passe)
      8. [Installation de FZF](#8-Installation-de-FZF)
3. [Pour aller plus loin dans la configuration](#3-Pour-aller-plus-loin-dans-la-configuration)
4. [FAQ](#4-FAQ)

# 1. Prérequis technique

## Côté client
- OS : Windows 10 Professionnel version 22h2
- Machine virtuelle utilisée : Proxmox
- Configuration VM :
   - Processeur : 3 coeurs
   - RAM : 4 Go
   - Disque : 60 Go


## Côté serveur
- OS : Windows Server 2022 Standard Evaluation 21h2
- Machine virtuelle utilisée : Promox
- Configuration VM :
   - Processeur : 3 coeurs
   - RAM : 4 Go
   - Disque : 60 Go


# 2. Installation de base des systèmes et de leur environnement


## 1. Machine client sous Windows 10

### 1. Installation de Windows 10


<br><p align="center"><img width="60%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win10_complete/install%20windows%2010%20-%2006.png" alt=""></p>
<p align="center">:arrow_forward:  Choisissez la langue</p>
<br><p align="center"><img width="60%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win10_complete/install%20windows%2010%20-%2007.png" alt=""></p>
<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win10_complete/install%20windows%2010%20-%2008.png" alt=""></p>
<br><p align="center">:arrow_forward:  Pour activer Windows sans clé de produit, choisissez "Je n'ai pas de clé de produit (product key)"</p>
<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win10_complete/install%20windows%2010%20-%2009.png" alt=""></p>
<p align="center">:arrow_forward:  Choisissez "Windows 10 professionnel"</p>
<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win10_complete/install%20windows%2010%20-%2010.png" alt=""></p>
<p align="center">:arrow_forward:  Choisissez votre disque pour continuer l'installation</p>
<br><p align="center"><img src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win10_complete/install%20windows%2010%20-%2011.png" alt=""></p>
<p align="center">:arrow_forward:  Choisissez Configuration pour une utilisation personnelle</p>
<br><p align="center"><img src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win10_complete/install%20windows%2010%20-%2012.png" alt=""></p>
<p align="center">:arrow_forward:  Si vous n'avez pas de compte, choisissez "compte Hors connexion"</p>
<br><p align="center"><img src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win10_complete/install%20windows%2010%20-%2013.png" alt=""></p>
<p align="center">:arrow_forward:  Choisissez "Experience limitée" puis, cliquez sur suivant</p>
<br><p align="center"><img src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win10_complete/install%20windows%2010%20-%2014.png" alt=""></p>
<p align="center">:arrow_forward:  Nommez votre Utilisateur</p>
<br><p align="center"><img src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win10_complete/install%20windows%2010%20-%2015.png" alt=""></p>
<p align="center">:arrow_forward:  Créez un mot de passe afin de sécuriser votre accès</p>
<br><p align="center"><img src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win10_complete/install%20windows%2010%20-%2016.png" alt=""></p>
<p align="center">:arrow_forward:  Choisissez "Pas maintenant." puis, cliquez sur suivant</p>
<br><p align="center"><img src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win10_complete/install%20windows%2010%20-%2017.png" alt=""></p>
<p align="center">:arrow_forward:  Choissisez "non" puis, acceptez.</p>
<br><p align="center"><img src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win10_complete/install%20windows%2010%20-%2018.png" alt=""></p>
<p align="center">:arrow_forward:  Encore une fois "non " puis acceptez</p>
<br><p align="center"><img src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win10_complete/install%20windows%2010%20-%2019.png" alt=""></p>
<p align="center">:arrow_forward:  Choisissez" Envoyer les données de diagnostic obligatoires" puis, acceptez</p>
<br><p align="center"><img src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win10_complete/install%20windows%2010%20-%2020.png" alt=""></p>
<p align="center">:arrow_forward:  Choissisez "non" puis, acceptez.</p>
<br><p align="center"><img src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win10_complete/install%20windows%2010%20-%2021.png" alt=""></p>
<p align="center">:arrow_forward:  Encore une fois "non " puis acceptez</p>
<br><p align="center"><img src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win10_complete/install%20windows%2010%20-%2022.png" alt=""></p>
<p align="center">:arrow_forward:  Encore une fois "non " puis acceptez</p>
<br><p align="center"><img src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win10_complete/install%20windows%2010%20-%2023.png" alt=""></p>
<p align="center">:arrow_forward:  Vous êtes libre de personnaliser votre expérience, sinon ignorez cette étape</p>
<br><p align="center"><img src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win10_complete/install%20windows%2010%20-%2024.png" alt=""></p>
<p align="center">:arrow_forward:  Choisissez "Pas maintenant"</p>

### 2. Renommage du PC Windows 10
Si vous avez besoin de renommer votre utilisateur pc , voici comment procéder :


<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win10_complete/install%20windows%2010%20-%2025.png" alt=""></p>
<p align="center">:arrow_forward:  Choisissez "Système"</p>
<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win10_complete/install%20windows%2010%20-%2026.png" alt=""></p>
<p align="center">:arrow_forward:  Allez dans "A propos de"</p>
<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win10_complete/install%20windows%2010%20-%2027.png" alt=""></p>
<p align="center">:arrow_forward:  Et là, choisissez "renommer ce pc"</p>
<br><p align="center"><img width="50%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win10_complete/install%20windows%2010%20-%2028.png" alt=""></p>
<p align="center">:arrow_forward:  Donnez-lui le nom voulu</p>
<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win10_complete/install%20windows%2010%20-%2029.png" alt=""></p>
<p align="center">:arrow_forward:  Vous verrez donc le nouveau nom choisi quand vous reviendrez dans " A propos de"</p>
<br><p align="center"><img width="50%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win10_complete/install%20windows%2010%20-%2030.png" alt=""></p>
<p align="center">:arrow_forward:  L'ordinateur vous conseillera de redémarrer, acceptez et attendez le redémarrage.</p>


### 3. Mises à jour Windows Update Windows 10
Mettez bien à jour votre OS Windows 10 comme cela :

<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win10_complete/install%20windows%2010%20-%2032k.png" alt=""></p>
<p align="center">:arrow_forward:  Dans votre barre de recherche, tapez "Rechercher des mises à jour" et accédez au panneau de mises à jour. Choisissez "Recherche des mises à jour"</p>
<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win10_complete/install%20windows%2010%20-%2032l.png" alt=""></p>
<p align="center">:arrow_forward:  Si des mises à jour on été trouvées, téléchargez-les et redémarrez votre ordinateur</p>
<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win10_complete/install%20windows%2010%20-%2032m.png" alt=""></p>
<p align="center">:arrow_forward:  Vous êtes maintenant à jour !</p>

### 4. Configuration d'une IP fixe Windows 10
Pour configurer une IP fixe sur Windows 10 voici la procédure :

<br><p align="center"><img src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win10_complete/install%20windows%2010%20-%2033.png" alt=""></p>
<p align="center">:arrow_forward:  Tapez "cmd" dans la barre Windows pour accéder aux invites de commandes</p>
<br><p align="center"><img width="90%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win10_complete/install%20windows%2010%20-%2034.png" alt=""></p>
<p align="center">:arrow_forward:  Vous arrivez dans l'invite de commande. Tapez "ipconfig" et voyez ce que l'ordinateur vous affiche. Récupérez "l'adresse IPv4"</p>
<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win10_complete/install%20windows%2010%20-%2035.png" alt=""></p>
<p align="center">:arrow_forward:  Dans les paramètres, cherchez la section "réseaux et Internet" et choisissez " Ethernet". Cliquez sur "Modifier les options d'adaptateur"</p>
<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win10_complete/install%20windows%2010%20-%2036.png" alt=""></p>
<p align="center">:arrow_forward:  Faites un clic droit sur Ethernet0 et choisissez "propriétés"</p>
<br><p align="center"><img width="50%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win10_complete/install%20windows%2010%20-%2037.png" alt=""></p>
<p align="center">:arrow_forward:  Allez dans "Gestion de réseau" et choisissez" protocole internet version 4( TCP/IPv4)" puis "Propriétés"</p>
<br><p align="center"><img width="50%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win10_complete/install%20windows%2010%20-%2038.png" alt=""></p>
<p align="center">:arrow_forward:  Choisissez "Utiliser l'adresse IP suivante" et choisissez une adresse IP disponible.
Gardez bien cette adresse IP, car on va remettre cette même adresse au moment de la configuration IP du serveur, puis cliquez sur "ok"</p>
<br><p align="center"><img width="90%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win10_complete/install%20windows%2010%20-%2039.png" alt=""></p>
<p align="center">:arrow_forward:  Quand vous retournerez dans l'invite de commande et que vous taperez à nouveau la commande "ipconfig", vous vous apercevrez que l'adresse IPV4 aura changée. La configuration est terminée.</p>

## 5. Installation et configuration de SSH

### 1. Préparer le client Windows 10 pour SSH

Aller dans Paramètres > Applications > Applications et fonctionnalités > Fonctionnalités facultatives
Cliquer sur Ajouter une fonctionnalité.
Rechercher et installer OpenSSH Server.

<br><p align="center"><img width="50%" src="https://github.com/user-attachments/assets/503ee537-f31e-4c5e-a7b7-04d0cc1b4c41" alt=""></p>

Activer et démarrer le service SSH dans Powershell avec la commande suivante :<br>
``Get-Service -Name sshd``<br>
``Start-Service -Name sshd``<br>
``Set-Service -Name sshd -StartupType Automatic``<br>


Configurer le pare-feu pour SSH :
Ouvrez PowerShell en administrateur et exécutez la commande :
``New-NetFirewallRule -Name "SSH" -DisplayName "SSH" -Protocol TCP -LocalPort 22 -Action Allo``

## 2. Machine administrateur sous Windows Server 2022

### 1. Installation de Windows Server 2022
Voici la procédure pour installer votre serveur Windows 2022 :

<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win_server_2022_complete/install%20windows%20server%202022%20-%2006.png" alt=""></p>
<p align="center">:arrow_forward: Choisissez la langue</p>
<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win_server_2022_complete/install%20windows%20server%202022%20-%2007.png" alt=""></p>
<p align="center">:arrow_forward: Installez le logiciel</p>
<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win_server_2022_complete/install%20windows%20server%202022%20-%2008.png" alt=""></p>
<p align="center">:arrow_forward: Choisissez Windows server 2022 Standard Evaluation (expérience de bureau). C'est très important si vous voulez une interface graphique sur votre serveur </p>
<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win_server_2022_complete/install%20windows%20server%202022%20-%2009.png" alt=""></p>
<p align="center">:arrow_forward: Choisissez un emplacement pour installer le logiciel</p>
<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win_server_2022_complete/install%20windows%20server%202022%20-%2010.png" alt=""></p>
<p align="center">Choisissez vos paramètres de personnalisation (Nom d'utilisateur, Mot de passe, ect.)</p>
<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win_server_2022_complete/install%20windows%20server%202022%20-%2011.png" alt=""></p>
<p align="center">:arrow_forward:  L'installation est terminée</p>

### 2. Renommage du PC Windows Server 2022
Voici un process pour renommer votre PC :

<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win_server_2022_complete/install%20windows%20server%202022%20-%2012.png" alt=""></p>
<p align="center">:arrow_forward: Dans les paramètres de votre ordinateur, choisissez " à propos de" puis, "renommer ce pc"</p>
<br><p align="center"><img width="50%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win_server_2022_complete/install%20windows%20server%202022%20-%2013.png" alt=""></p>
<p align="center">:arrow_forward: Dans les paramètres de votre ordinateur, choisissez " à propos de" puis, "renommer ce pc"</p>
<br><p align="center"><img width="50%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win_server_2022_complete/install%20windows%20server%202022%20-%2014.png" alt=""></p>
<p align="center">:arrow_forward: L'ordinateur va vous demander de redémarrer pour finaliser le changement</p>
<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win_server_2022_complete/install%20windows%20server%202022%20-%2015.png" alt=""></p>
<p align="center">:arrow_forward: En retournant dans vos paramètres après le redémarrage, vous constatez comme sur la capture ci-dessus que le pc à bien été renommé !</p>

### 3. Ajout du compte Administrator
Voici comment procéder pour ajouter un compte administrateur :

<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win_server_2022_complete/install%20windows%20server%202022%20-%2016.png" alt=""></p>
<p align="center">:arrow_forward: Dans le panneau de configuration de votre ordinateur, choisissez "Comptes d'utilisateurs"</p>
<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win_server_2022_complete/install%20windows%20server%202022%20-%2017.png" alt=""></p>
<p align="center">:arrow_forward: Cliquez sur "Comptes d'utilisateurs"</p>
<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win_server_2022_complete/install%20windows%20server%202022%20-%2018.png" alt=""></p>
<p align="center">:arrow_forward:  Puis, "Gérer un autre compte"</p>
<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win_server_2022_complete/install%20windows%20server%202022%20-%2019.png" alt=""></p>
<p align="center">:arrow_forward:  Choisissez "Ajouter un compte d'utilisateur"</p>
<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win_server_2022_complete/install%20windows%20server%202022%20-%2020.png" alt=""></p>
<p align="center">:arrow_forward:  Ajouter vos informations (nom et mot de passe) puis "Suivant"</p>
<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win_server_2022_complete/install%20windows%20server%202022%20-%2021.png" alt=""></p>
<p align="center">:arrow_forward: Cliquez sur "Terminer"</p>
<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win_server_2022_complete/install%20windows%20server%202022%20-%2022.png" alt=""></p>
<p align="center">:arrow_forward: Cliquez sur votre compte fraichement créé</p>
<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win_server_2022_complete/install%20windows%20server%202022%20-%2023.png" alt=""></p>
<p align="center">:arrow_forward: Puis, "Modifier le type de compte"</p>
<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win_server_2022_complete/install%20windows%20server%202022%20-%2024.png" alt=""></p>
<p align="center">:arrow_forward: Choisissez "Administrateur" Puis, "Modifier le type de compte"</p>
<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win_server_2022_complete/install%20windows%20server%202022%20-%2025.png" alt=""></p>
<p align="center">:arrow_forward: Vous constaterez que votre compte à bien été modifié comme ci-dessus</p>
<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win_server_2022_complete/install%20windows%20server%202022%20-%2026.png" alt=""></p>
<p align="center">:arrow_forward: Déconnectez vous de votre ordinateur</p>
<br><p align="center"><img src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win_server_2022_complete/install%20windows%20server%202022%20-%2027.png" alt=""></p>
<p align="center">:arrow_forward: Choisissez et connectez vous à votre nouveau compte Admin et voilà !</p>

### 4. Mises à jour Windows Update Windows Server 2022
On va vérifier si notre serveur est bien à jour :

<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win_server_2022_complete/install%20windows%20server%202022%20-%2028b.png" alt=""></p>
<p align="center">:arrow_forward: Dans les paramètres du pc, choisissez "Windows update". Si des mises à jours sont en attentes, effectuées-les.</p>
<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win_server_2022_complete/install%20windows%20server%202022%20-%2028c.png" alt=""></p>
<p align="center">:arrow_forward: Vous devrez redémarrer votre pc pour que les mises à jours soient bien actives</p>
<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win_server_2022_complete/install%20windows%20server%202022%20-%2028d.png" alt=""></p>
<p align="center">:arrow_forward: Quand vous reviendrez dans vos paramètres, Windows sera à jour !</p>

### 5. Configuration d'une IP fixe Windows Server 2022
On vas également configurer l'adresse IP pour le serveur :

<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win_server_2022_complete/install%20windows%20server%202022%20-%2028.png" alt=""></p>
<p align="center">:arrow_forward: Pour ça , tapez "cmd" dans votre barre de recherche Windows. Cela vous ouvrir votre invitation de commande</p>
<br><p align="center"><img width="90%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win_server_2022_complete/install%20windows%20server%202022%20-%2029.png" alt=""></p>
<p align="center">:arrow_forward: Tapez ensuite "ipconfig". Nous allons changer l'adresse IPV4 afin d'assurer la connexion</p>
<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win_server_2022_complete/install%20windows%20server%202022%20-%2030.png" alt=""></p>
<p align="center">:arrow_forward: Rendez vous dans les paramètres de votre ordinateur et plus précisément dans "Réseau et Internet" et "Ethernet". Choisissez "Modifier les options d'adaptateur"</p>
<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win_server_2022_complete/install%20windows%20server%202022%20-%2031.png" alt=""></p>
<p align="center">:arrow_forward: Cliquez droit sur "Ethernet0" et choisissez "propriété"</p>
<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win_server_2022_complete/install%20windows%20server%202022%20-%2032.png" alt=""></p>
<p align="center">:arrow_forward: Dans l'onglet "Gestion de réseau" choisissez "Protocole internet version 4 (TCP/IPV4), puis, "Propriétés"</p>
<br><p align="center"><img width="70%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win_server_2022_complete/install%20windows%20server%202022%20-%2033.png" alt=""></p>
<p align="center">:arrow_forward:  Choisissez "Utiliser l'adresse IP suivante" Reprennez l'adresse IP que vous aviez choisi dans l'etape " configuration IP windows 10" et rentrer la. Puis, cliquez sur "ok"</p>
<br><p align="center"><img width="90%" src="https://github.com/WildCodeSchool/TSSR-2411-P1-G3/blob/main/images/install_win_server_2022_complete/install%20windows%20server%202022%20-%2034.png" alt=""></p>
<p align="center">:arrow_forward: Si vous revenez en arrière dans votre invitation de commande, votre adresse IPV4 aura été modifié avec succès !</p>

## 6. Installation et configuration de SSH

### 1. Préparer le serveur Windows 2022 pour SSH

Aller dans Paramètres > Applications > Applications et fonctionnalités > Fonctionnalités facultatives
Cliquer sur Ajouter une fonctionnalité.
Rechercher et installer OpenSSH Server si ce n'est pas encore fait.

<br><p align="center"><img width="90%" src="https://github.com/user-attachments/assets/503ee537-f31e-4c5e-a7b7-04d0cc1b4c41" alt=""></p>






<br><p align="center"><img width="70%" src="https://github.com/user-attachments/assets/9392b495-b1c3-4dac-a009-56fd8783be38" alt=""></p>
<br><p align="center"><img width="70%" src="https://github.com/user-attachments/assets/acf04a60-258d-43dc-b547-d08e94436e25" alt=""></p>
<br>Activer et démarrer le service SSH dans Powershell avec la commande suivante :<br>
``Get-Service -Name sshd``<br>
``Start-Service -Name sshd``<br>
``Set-Service -Name sshd -StartupType Automatic``<br>
<br><p align="center"><img width="70%" src="https://github.com/user-attachments/assets/2b1ebbf7-3a79-47ce-ae1e-334c278581ea" alt=""></p>
<br><p align="center"><img width="70%" src="https://github.com/user-attachments/assets/beef416e-e17c-4ea7-aa9b-cf91d5f15e9f" alt=""></p>
<br><p align="center"><img width="70%" src="https://github.com/user-attachments/assets/b6ef6ea9-d5e4-4ef6-b727-ec62a601a23d" alt=""></p>

**Tester la connectivité SSH**

Depuis le serveur Windows 2022, ouvrir PowerShell ou CMD et exécuter une commande ping pour tester la connectivité :<br>
``ping <IP_du_Client_Windows10>``
Dans notre cas : ``ping 172.16.10.20``<br>
Si le ping est OK, on tente de se connecter en SSH avec la commande suivante :<br>
ssh wilder@172.16.10.20²

Si la conexion est réussie on prend la main à distance sur le compte wilder du client Windows 10.

## 7. Aller plus loin en se connectant en SSH sans mot de passe
- D'abord taper la commande ``scp id_rsa.pub wilder@172.16.10.20:%programdata%/ssh`` pour envoyer le fichier contenant la clé ssh depuis le serveur vers le pc distant Windows 10 :
![ssh-sans-mdp-commande pour envoyer le fichier contenant la clé ssh depuis le serveur vers le pc Windows 10](https://github.com/user-attachments/assets/484932d4-e56d-442a-9819-13f7eeb74ea9)
- Sur le pc windows 10, ouvrir le fichier id_rsa.pub et copier la clé SSH :
![ssh-sans-mdp-Sur le pc windows 10, ouvrir le fichier id-rsa-pub et copier la clé](https://github.com/user-attachments/assets/b66d657e-a9a8-4ff6-a92d-195b6a848e1c)
- Lancer le bloc note en prenant soin de l'ouvrir en mode Administrateur :
![ssh-sans-mdp-Puis lancer le bloc note en prenant soin de l'ouvrir en tant qu'admin](https://github.com/user-attachments/assets/308280da-49ec-49cf-b2fa-baa751da5862)
- Sélectionner "Tous les fichiers", et repérer s'il y a le fichier ``authorized_keys``. S'il n'y a pas ce fichier, en créer un et le nommer ``administratos_authorized_keys`` :
![ssh-sans-mdp-penser à cocher tous les fichiers puis repérer le fichier authorized_keys - s'il n'y en a pas en créer un nommé administratos_authorized_keys](https://github.com/user-attachments/assets/ad2471fe-8ba1-47c9-8dc6-c0a35e0055f7)
- Très important, s'il y a déjà le fichier ``authorized_keys``, le renommer en ``administratos_authorized_keys`` :
![ssh-sans-mdp-très important s'il y a déjà une fichier authorized_keys, le renommer administrators_authorized_keys](https://github.com/user-attachments/assets/04702de9-8cb5-430b-bb21-c283bfe56f66)
- Ouvrir le fichier ``administratos_authorized_keys`` et coller la clé SSH qu'on a copiée dans le fichier id_rsa.pub :
![ssh-sans-mdp-ouvrir le fichier et copier la clé ssh](https://github.com/user-attachments/assets/7ea55dba-e263-4010-99a6-15dfd7288475)
- Sur le PC Windows 10, taper la commande suivante dans Powershell : ``icacls administrators_authorized_keys /inheritabce:r /grant "Administrators:F" /grant "SYSTEM:F"``
![ssh-sans-mdp-sur le PC windows 10, taper la commande suivante dans powershell](https://github.com/user-attachments/assets/58e67c69-ea33-4244-a49d-67e3706d7fc6)
- Ensuite, toujours sur le PC Windows 10, ouvir le fichier ``ssh_config`` en tant qu'admin et s'arrurer que ``PubkeyAuthentication`` est bien sur ``yes`` et décommenté, puis sauvegarder :
![ssh-sans-mdp-sur le PC windows 10, ouvir le fichier ssh_config en tant qu'en qu'admin et s'arrurer que PubkeyAuthentication est bien sur yes et que ce soit bien decommenté](https://github.com/user-attachments/assets/6eb0bee8-e351-42d7-8796-52f2a7e43e0a)
- Avant de poursuivre la modification du fichier, on ouvre les services en tant qu'admin :
![ssh-sans-mdp-sur le PC windows 10, ouvrir les services en tant qu'admin](https://github.com/user-attachments/assets/653da342-0d29-4901-aec3-a52e970e8313)
- Et on redémarre le service open SSH SSH Server :
![ssh-sans-mdp-sur le PC windows 10, et redemarrer le service open SSH SSH Server](https://github.com/user-attachments/assets/2e4f3e4a-1ccc-47ef-af86-ca49fd441e01)
- On retourne dans le fichier ``ssh_config`` en tant qu'admin et s'arrurer que ``PasswordAuthentication`` soit marqué ``no`` et décommenté :
![ssh-sans-mdp-sur le PC windows 10, retourner dans le fichier sshd_config (toujours en tant qu'admin) et s'assurer que PasswordAuthentication soit décommenté et marqué no](https://github.com/user-attachments/assets/4b88af32-47c5-40b1-894e-f08b30c2308f)
- Enfin, redémarrer une nouvelle fois le service open SSH SSH Server :
![ssh-sans-mdp-sur le PC windows 10, relancer une seconde fois le service OpenSSH SSH Server](https://github.com/user-attachments/assets/52ad468f-537c-4e71-bcb2-a0f6e1ca5d60)

Une fois ces étapes effectuées, la connexion via SSH sans mot de passe a pu être établie.

## 8. Installation de FZF
Nous avons fait l'installation de FZF via Scoop, voici les commandes à taper dans powershell :<br>
``iwr -useb get.scoop.sh | iex``<br>
``scoop --version``  (vérifie que scoop est bien installé)<br>
``scoop install fzf``<br>
``fzf --version`` (vérifie que fzf est bien installé)<br>
<br><p align="center"><img width="70%" src="https://github.com/user-attachments/assets/941f5f88-f92a-44c5-8135-2532b1933885" alt=""></p>

# 3. Pour aller plus loin dans la configuration
### <br><p align="center">:arrow_forward: Cette section n'a pas encore été complétée par notre équipe</p><br>
# 4. FAQ
### <br><p align="center">:arrow_forward: Cette section n'a pas encore été complétée par notre équipe</p><br>
