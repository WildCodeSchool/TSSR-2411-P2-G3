# 🔔 INSTALL-LINUX.md
## ⏩ TSSR-2411-P2-G3 / The scripting project

# Sommaire<br>
1. [Prérequis de configuration](#1-Prérequis-de-configuration)
2. [Installation de base des systèmes et de leur environnement](#2-installation-de-base-des-systèmes-et-de-leur-environnement)
   1. [Machine client sous Ubuntu 24-04](#1-Machine-client-sous-Ubuntu-24-04)
      1. [Configuration de Proxmox pour VM Ubuntu](#1-Configuration-de-Proxmox-pour-VM-Ubuntu)
      2. [Installation de Ubuntu 24-04](#2-Installation-de-Ubuntu-24-04)
      3. [Configuration de Ubuntu 24-04](#3-Configuration-de-Ubuntu-24-04)
   2. [Machine administrateur sous Debian 12](#2-Machine-administrateur-sous-Debian-12)
      1. [Configuration de Proxmox pour VM Debian](#1-Configuration-de-Proxmox-pour-VM-Debian)
      2. [Installation de Debian 12](#2-Installation-de-Debian-12)
      3. [Installation et configuration de SSH sur Debian 12](#3-Installation-et-configuration-de-SSH-sur-Debian-12)
      4. [Installation de Dialog](#4-Installation-de-Dialog)
3. [Pour aller plus loin dans la configuration](#3-Pour-aller-plus-loin-dans-la-configuration)
4. [FAQ](#4-FAQ)



# 1. Prérequis de configuration

## 1. Client Windows
  * VM Proxmox
  * Nom : CLIWIN01
  * Compte utilisateur : wilder (dans le groupe des admins locaux)
  * Mot de passe : Azerty1*
  * Adresse IP fixe : 172.16.10.20/24

## 2. Client Ubuntu
  * VM Proxmox
  * Nom : CLILIN01
  * Compte utilisateur : wilder (dans le groupe sudo)
  * Mot de passe : Azerty1*
  * Adresse IP fixe : 172.16.10.30/24

## 3. Serveur Windows Server 2022
  * VM Proxmox
  * Nom : SRVWIN01
  * Compte : Administrator (dans le groupe des admins locaux)
  * Mot de passe : Azerty1*
  * Adresse IP fixe : 172.16.10.5/24

## 4. Serveur Debian 12
  * VM Proxmox
  * Nom : SRVLX01
  * Compte : root
  * Mot de passe : Azerty1*
  * Adresse IP fixe : 172.16.10.10/24

# 2. Installation de base des systèmes et de leur environnement
## 1. Machine client sous Ubuntu 24-04
### 1. Configuration de Proxmox pour VM Ubuntu
<br><p align="center"><img src="https://github.com/user-attachments/assets/bb5ad227-2577-4a39-ab3e-a8080ac3a552" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/18b2d7d9-2f6c-4baf-bd8d-38e6094ec552" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/e8ebbdef-ceb7-4ab7-a054-e6b82d12ba08" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/658e578c-6fbe-490a-92cb-237c58884ac5" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/3a7c00d4-ea60-458f-af8f-ae76d06a126c" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/7fa5abdf-fe27-4cdf-9187-a98e7a3b1eed" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/04665c78-67af-4f3b-82f1-962f4c4bbe97" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/3cd11dc0-8562-4d64-a9a3-c0480ed6c6a4" alt=""></p><br>
### 2. Installation de Ubuntu 24-04
<br><p align="center"><img src="https://github.com/user-attachments/assets/e3946b1b-c706-48a3-95e0-7cfc61f910ad" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/4445d955-dca0-4497-b60f-f38a9998430e" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/8ec0acc7-0264-4e26-b563-f4d0f18e88e1" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/3b798c32-fb3e-4275-912e-877300e7b50b" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/b02c0da8-49e0-425e-a098-b45a157e2d89" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/bb493785-ddd5-4b9e-8061-f7c5c6cb0b85" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/f5ec2356-2299-46b2-9a3e-ae7ebd4119b1" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/12ea141d-ff0d-423a-9e32-d7eb9222d9a8" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/3c67750e-6b77-4a0b-a85f-3f5b5b53f20f" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/1e89b233-6cc0-4c7b-a674-40de2a216a50" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/b3e07cdc-d1fd-4bd6-8889-fb8da277e7f0" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/ab0f952d-8ff5-497f-8321-b2acb4859d38" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/28c9769f-5406-441f-8641-6e469d388765" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/f94189a1-c9af-4122-a005-b98f2a37aef0" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/18f3e440-aec4-47c4-b6bb-7b3923a818cd" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/7462e405-9103-4d7d-b2b6-de6b67e0dad2" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/3fa1d4a5-43f5-4763-8e06-83068fc970eb" alt=""></p><br>
### 3. Configuration de Ubuntu 24-04
<br><p align="center"><img src="https://github.com/user-attachments/assets/3e446525-8f2d-41b6-a152-dbeb5035d862" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/08a09938-ce93-4f1e-ab03-2f741e48d6a6" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/d653e141-74c7-4279-b53f-8fe25d8559f0" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/4907454a-28b3-41f4-be17-7a12c3f6f422" alt=""></p><br>
## 2. Machine administrateur sous Debian 12
### 1. Configuration de Proxmox pour VM Debian
<br><p align="center"><img src="https://github.com/user-attachments/assets/0dee6b8b-45af-47f3-8153-bb7e4be6c1dd" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/a61241d1-e372-4022-8615-c6c8ea088e66" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/e8ebbdef-ceb7-4ab7-a054-e6b82d12ba08" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/658e578c-6fbe-490a-92cb-237c58884ac5" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/3a7c00d4-ea60-458f-af8f-ae76d06a126c" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/7fa5abdf-fe27-4cdf-9187-a98e7a3b1eed" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/04665c78-67af-4f3b-82f1-962f4c4bbe97" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/88034260-8c5d-4e01-9826-4956fb33d1d7" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/9214aa29-111c-4e1a-bd47-f2bda32d8398" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/6e9830f1-052c-4aa1-baf5-ee5ff4fa135a" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/2b46dee0-56fa-45b4-96aa-2e14e830c51e" alt=""></p><br>
### 2. Installation de Debian 12
<br><p align="center"><img src="https://github.com/user-attachments/assets/9ddaf695-e823-4334-89d6-988257aad44e" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/9c1a92c4-2718-4b42-ba7e-a13114817091" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/4b8802f2-3ba2-4218-a1f2-9d7a2d36f7a6" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/3076fe99-667a-4741-a6d2-e40d635d0642" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/35a28068-c741-4adc-b8d5-900dd8eac07c" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/6cd387be-9b84-485f-8482-d79d338b7757" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/65c1e280-a571-423e-9fe3-52589db061dd" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/a96a3198-b19a-48e8-92c5-2defc3e11e34" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/1abbfb70-b55c-401c-8d64-408842610032" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/8a085e8b-41d2-40bb-91c7-6494f89bb92d" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/2b3c54c3-2972-4b6f-8446-66bec5373e11" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/89dba28a-6f3b-486d-a7ad-3bb1fc307844" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/1d2825d7-1031-4b92-9380-3206b69c4757" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/22f2aea9-19bc-4d08-9a6a-b0eaab94d690" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/23d21ebd-9c2a-47e4-bcc5-6ed54d30df67" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/5e68c811-77ce-4589-aa43-7069e76413b9" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/038422af-6b38-4c17-9117-7cc11d2541e3" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/bf6d062a-26c2-412a-81e2-76ed8a291af8" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/0543fd30-b9d7-47b4-8497-926d869791e5" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/af9cfcbf-5846-4649-84e0-abefb4489549" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/c615bd46-2fdd-4270-8182-3b738e4988a5" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/ef8a35e2-a91e-4406-ba9e-237ccb0add82" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/8578024a-3de0-4d4e-ad43-5a358818cda1" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/ca07f5ba-6a34-4cbc-a4d1-fab87ad10875" alt=""></p><br>
<br><p align="center"><img src="(https://github.com/user-attachments/assets/b1ba080d-a322-4d78-98df-6a277aab203f" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/28bcd0a0-5de5-4143-9361-9f43aa24fd5c" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/7b003d45-a83f-4c70-a2ae-a6133dcee26a" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/5730332d-6c8d-460f-89cf-0df524ba72a7" alt=""></p><br>
### 3. Installation et configuration de SSH sur Debian 12

### Assure-toi que le service SSH est installé et activé sur les machines Ubuntu distantes.

<br><p align="center"><img src="https://github.com/user-attachments/assets/b1651343-ea8d-47de-88ce-857f3f4b8195" alt=""></p><br>

### Commandes utilisées
``sudo apt update && sudo apt install openssh-server``<br>
``sudo systemctl enable ssh``<br>
``sudo systemctl start ssh``<br>


### Tester l'accès de la connexion SSH

### Commandes utilisées
``ssh user@machine_ip``<br>

### Authentification par clé SSH :

Pour éviter de taper le mot de passe à chaque fois, configure une authentification par clé SSH :
``ssh-keygen -t rsa``<br>
``ssh-copy-id user@machine_ip``

<br><p align="center"><img src="https://github.com/user-attachments/assets/6be3dd73-d292-4d88-a93e-73fbbd758e02" alt=""></p><br>

### Note
Après suppression / réinstallation de la VM CLININ01 et réinstallation de SSH avec les mêmes paramètres réseau, la clé ssh avait changé, elle n'était plus reconnue par Debian qui refusait de se connecter. Pour solutionner ça, il a fallu supprimer la clé SSH de Debian stockée dans le fichier known_hosts, et relancer la connexion SSH pour enregistrer la nouvelle clé.

<br><p align="center"><img src="https://github.com/user-attachments/assets/88ab18a8-5069-4c14-bc25-b97710c449e9" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/fcee238b-015b-421c-b1ec-170a62a77c75" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/add6e166-2308-497a-8766-1c4cacccbdf5" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/a6c9e615-2b6f-4931-ae3c-2134209ef150" alt=""></p><br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/dfa5b9ad-6a6a-45b0-b63d-6743a6af6f25" alt=""></p><br>
### Note
Cette fois on peut se connecter directement à distance au compte "wilder" sans utiliser le mot de passe :<br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/4426ee0d-3d5b-4f13-8d45-6e7ae2919b91" alt=""></p><br>
<br>Cette fois on peut se connecter directement à distance au compte "wilder" sans utiliser le mot de passe :<br>
<br><p align="center"><img src="https://github.com/user-attachments/assets/4c48c4b6-656e-4521-ae1d-36fce785a3c9" alt=""></p><br>
### 4. Installation de Dialog
Voici les commandes à taper dans Bash :<br>
``sudo apt update``<br>
``sudo apt install dialog``<br>
``dialog --msgbox "Installation OK" 10 30`` (vérifie que Dialog est bien intallé)<br>
# 3. Pour aller plus loin dans la configuration
### <br><p align="center">:arrow_forward: Cette section n'a pas encore été complétée par notre équipe</p><br>
# 4. FAQ
### <br><p align="center">:arrow_forward: Cette section n'a pas encore été complétée par notre équipe</p><br>
