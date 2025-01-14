# Projet 2

## 1. Installer et configurer SSH sur la machine distante

### Assure-toi que le service SSH est installé et activé sur les machines Ubuntu distantes.

![image](https://github.com/user-attachments/assets/b1651343-ea8d-47de-88ce-857f3f4b8195)

sudo apt update && sudo apt install openssh-server
sudo systemctl enable ssh
sudo systemctl start ssh


### Teste l'accès SSH depuis ta machine Debian vers chaque machine Ubuntu.

ssh user@machine_ip

## 2. Authentification par clé SSH :

Pour éviter de taper le mot de passe à chaque fois, configure une authentification par clé SSH :

ssh-keygen -t rsa<br>
ssh-copy-id user@machine_ip

![image (1)](https://github.com/user-attachments/assets/6be3dd73-d292-4d88-a93e-73fbbd758e02)

Après suppression / réinstallation de la VM CLININ01 et réinstallation de SSH avec les mêmes paramètres réseau, la clé ssh avait chang, elle n'était plus reconnue par Debian qui refusait de se connecter. Pour solutionner ça, il a fallu supprimer la clé SSH de Debian stockée dans le fichier known_hosts, et relancer la connexion SSH pour enregistrer la nouvelle clé.



![install-ubuntu-p2-10-confirmation-ssh-installé](https://github.com/user-attachments/assets/88ab18a8-5069-4c14-bc25-b97710c449e9)

![install-ubuntu-p2-3-ligne-code-fichier-pour-ne-pas-rentrer-le-mot-de-passe](https://github.com/user-attachments/assets/fcee238b-015b-421c-b1ec-170a62a77c75)

![install-debian-p2-1-probleme-apt-update](https://github.com/user-attachments/assets/add6e166-2308-497a-8766-1c4cacccbdf5)

![install-debian-p2-2-resolution du probleme](https://github.com/user-attachments/assets/a6c9e615-2b6f-4931-ae3c-2134209ef150)

![install-debian-p2-2-connexion-avec-cle-ssh](https://github.com/user-attachments/assets/4c0a3394-a288-4da7-b329-e9ff2ac017e4)

![install-debian-p2-2-confirmation-connexion-avec-cle-ssh](https://github.com/user-attachments/assets/182516bb-b4a9-4feb-81f6-18f1d2b58eac)

![install-debian-p2-10-ligne-code-fichier-pour-ne-pas-rentrer-le-mot-de-passe](https://github.com/user-attachments/assets/60456c59-62ad-4240-9a07-5b9a45bc3ec9)

![install-windows-2022-01-desactiver-firewall](https://github.com/user-attachments/assets/f21ff5e4-2f68-4738-b401-c08a6e61ebcf)

![install-windows-2022-02-installation-ssh](https://github.com/user-attachments/assets/b116a281-5a9e-40c9-ada1-7e57ca19b0f4)

![install-windows-2022-03-installation-ssh](https://github.com/user-attachments/assets/9392b495-b1c3-4dac-a009-56fd8783be38)

![install-windows-2022-04-installation-ssh](https://github.com/user-attachments/assets/acf04a60-258d-43dc-b547-d08e94436e25)

![install-windows-2022-05-demarrage-ssh](https://github.com/user-attachments/assets/2b1ebbf7-3a79-47ce-ae1e-334c278581ea)

![install-windows-2022-05-cle-ssh](https://github.com/user-attachments/assets/beef416e-e17c-4ea7-aa9b-cf91d5f15e9f)

![install-windows-2022-05-reussite-connexion-ssh](https://github.com/user-attachments/assets/b6ef6ea9-d5e4-4ef6-b727-ec62a601a23d)


