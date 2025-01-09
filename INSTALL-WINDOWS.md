# Sommaire
1. [Prérequis technique](#1-prérequis-technique)
2. [Installation de base des systèmes et de leur environnement](#2-installation-de-base-des-systèmes-et-de-leur-environnement)
   1. [Machine client sous Windows 10](#1-machine-client-sous-windows-10)
      1. [Installation de Windows 10](#1-installation-de-windows-10)
      2. [Renommage du PC](#2-renommage-du-pc-windows-10)
      3. [Mises à jour Windows Update](#3-mises-à-jour-windows-update-windows-10)
      4. [Configuration d'une IP fixe](#4-configuration-dune-ip-fixe-windows-10)
   2. [Machine administrateur sous Windows Server 2022](#2-machine-administrateur-sous-windows-server-2022)
      1. [Installation de Windows Server 2022](#1-installation-de-windows-server-2022)
      2. [Renommage du PC](#2-renommage-du-pc-windows-server-2022)
      3. [Ajout du compte Administrator](#3-ajout-du-compte-administrator)
      4. [Mises à jour Windows Update](#4-mises-à-jour-windows-update-windows-server-2022)
      5. [Configuration d'une IP fixe](#5-configuration-dune-ip-fixe-windows-server-2022)
3. [Pour aller plus loin dans la configuration](#3-pour-aller-plus-loin-dans-la-configuration)
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


# 3. Pour aller plus loin dans la configuration

# 4. FAQ
<p align="center">:arrow_forward: Cette section n'a pas encore été complétée par notre équipe</p>
