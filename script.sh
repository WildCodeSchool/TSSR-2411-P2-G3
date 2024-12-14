#!/bin/bash
show_menu() {
clear 
echo "=========================================="
echo "Menu Principal"
echo "=========================================="
echo "1. Gérer un utilisateur "
echo "2. Gérer un ordinateur"
echo "3. Rechercher des informations"
echo "4. Quitter"
echo "==========================================="
read -p "Selectionnez une option:" choix


case $choix in 
     1) gerer_utilisateur ;;
     2) gerer_ordinateur  ;;
     3) rechercher_info ;;
     4) echo "Au revoir!" 
        exit 0 ;;
esac
}




# Fonction pour gérer les utilsateurs

gerer_utilisateur() {
clear
echo "============================================="
echo "Gérer les utilisateurs"
echo "============================================="
echo "1. Afficher la liste des utilisateurs "
echo "2. Créer un utilisateur"
echo "3. Supprimer un utilisateur"
read -p  "Choisissez une action:"   action




case $action in 
      
      1) display_user  ;;
      2) create_user  ;;
      3) delete_user  ;;
      *) echo "Action invalide."  ;;
esac
}

# Fonction pour créer un utilisateur 

create_user() {

read -p "Entrez le nom de l'utilsateur (complet ou partiel): " username

read -p "Entrez l'adresse IP de l'ordinateur: " computer 

  ssh -t   wilder@$computer " sudo useradd -m -s  /bin/bash $username && sudo  passwd  $username  "  

echo "utilisateur $username a été  crée. "


#show_menu

}

# Fonction pour supprimer un utilisateur 

delete_user() {
read -p "Entrez le nom de l'utilsateur (complet ou partiel): " username

read -p "Entrez l'adresse IP de l'ordinateur: " computer 
sudo ssh -t   wilder@$computer "sudo deluser --remove-home  $username  " 

echo "Utilisateur $username supprimé "
}

# Afficher la liste des utilisateurs 
display_user() {

read -p "Entrez l'adresse IP de l'ordinateur: " computer 
 
sudo ssh -t   wilder@$computer   "sudo cut -d: -f1 /etc/passwd   " 

}



show_menu
