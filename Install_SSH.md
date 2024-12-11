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
