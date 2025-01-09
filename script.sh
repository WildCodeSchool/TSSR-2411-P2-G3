#!/bin/bash

# Fonction pour récupérer les logs

log_event() {
	local_event="$1"
	local_log_file="/var/log/log_evt.log"
	local_timestamp="$(date '+%Y%m%d-%H%M%S')"
	local_user="$(whoami)"
	echo "$local_timestamp-$local_user-$local_event" >> "$local_log_file"
}

log_event "********StartScript********"



##############################

# MENU PRINCIPAL

##############################

BLACK_BG="\e[40m"



show_menu() {
    while true; do
        choix=$(dialog --clear --stdout \
            --title "Menu Principal" \
            --menu "Choisissez une option" 15 50 4 \
            1 "Gestion des utilisateurs" \
            2 "Gestion des ordinateurs" \
            3 "Collecter des informations" \
            4 "Quitter")

        case $choix in
            1) log_event "A navigué dans le menu Gestion des utilisateurs"; gerer_utilisateur ;;
            2) log_event "A navigué dans le menu Gestion des ordinateurs"; gerer_ordinateur ;;
            3) log_event "A navigué dans le menu Collecter des informations"; collecter_infos ;;
            4) log_event "A quitté le menu"; log_event "********EndScript********"; dialog --msgbox "Au revoir !" 6 20; clear; exit 0 ;;
            *) log_event "A saisi un choix invalide"; dialog --msgbox "Choix invalide" 6 20 ;;
        esac
    done
}


##############################

# 1) SOUS MENU GERER LES UTILISATEURS

##############################


gerer_utilisateur() {
    while true; do
        action=$(dialog --clear --stdout \
            --title "Gestion des utilisateurs" \
            --menu "Choisissez une action" 15 50 5 \
            1 "Afficher la liste des utilisateurs" \
            2 "Créer un utilisateur" \
            3 "Modifier le mot de passe d'un utilisateur" \
            4 "Supprimer un utilisateur" \
            5 "Retour au menu principal")

        case $action in
            1) log_event "A navigué dans le menu Afficher la liste des utilisateurs"; display_user ;;
            2) log_event "A navigué dans le menu Créer un utilisateur"; create_user ;;
            3) log_event "A navigué dans le menu Modifier le mot de passe d'un utilisateur"; modify_user ;;
            4) log_event "A navigué dans le menu Supprimer un utilisateur"; delete_user ;;
            5) break ;;
            *) dialog --msgbox "Action invalide." 6 20 ;;
        esac
    done
}

##############################

# FONCTIONS MENU GERER LES UTILISATEURS

##############################


# Fonction pour afficher la liste des utilisateur

display_user() {
    # Boîte de saisie pour l'adresse IP
    computer=$(dialog --inputbox "Entrez l'adresse IP de l'ordinateur :" 10 40 3>&1 1>&2 2>&3 3>&-)

    # Vérification si une adresse IP a été fournie
    if [ -z "$computer" ]; then
        dialog --msgbox "Aucune adresse IP fournie. Annulation de l'opération." 10 40
        return
    fi

    # Fichier temporaire pour stocker le résultat
    temp_file=$(mktemp)

    # Exécuter la commande SSH pour récupérer les utilisateurs et rediriger la sortie vers le fichier temporaire
    ssh -t wilder@"$computer" "sudo column -t -s ':' /etc/passwd" > "$temp_file" 2>&1

    # Vérification si le fichier est vide
    if [ ! -s "$temp_file" ]; then
        dialog --msgbox "Aucun utilisateur trouvé ou erreur lors de l'exécution de la commande." 10 40
        rm -f "$temp_file"
        return
    fi

    # Forcer l'utilisation du fichier temporaire en passant son contenu à dialog
    temp_fixed=$(mktemp)
    cat "$temp_file" > "$temp_fixed"

    # Afficher le contenu du fichier temporaire dans une boîte
    dialog --textbox "$temp_fixed" 20 50

    # Supprimer les fichiers temporaires après utilisation
    rm -f "$temp_file" "$temp_fixed"

    # Enregistrer l'événement dans les logs
    log_event "A affiché la liste des utilisateurs sur le PC $computer"
}

   

# Fonction pour créer un utilisateur

create_user() {

  # Utilisation de dialog pour demander le nom de l'utilisateur
  username=$(dialog --title "Création d'utilisateur" \
    --inputbox "Entrez le nom de l'utilisateur :" 10 40 3>&1 1>&2 2>&3)

  # Si l'utilisateur annule la saisie
  if [[ -z "$username" ]]; then
    dialog --msgbox "Opération annulée. Aucune donnée fournie." 10 40
    return
  fi

  # Utilisation de dialog pour demander l'adresse IP de l'ordinateur
  computer=$(dialog --title "Création d'utilisateur" \
    --inputbox "Entrez l'adresse IP de l'ordinateur :" 10 40 3>&1 1>&2 2>&3)

  # Si l'utilisateur annule la saisie
  if [[ -z "$computer" ]]; then
    dialog --msgbox "Opération annulée. Aucune adresse IP fournie." 10 40
    return
  fi

  # Afficher un message de début d'opération
  dialog --infobox "Création de l'utilisateur $username sur l'ordinateur $computer..." 10 40

  # Création de l'utilisateur à distance
  ssh -t wilder@$computer "sudo useradd -m -s /bin/bash $username" \
    && dialog --msgbox "Utilisateur $username créé avec succès." 10 40 \
    || dialog --msgbox "Échec de la création de l'utilisateur $username." 10 40

  # Demander un mot de passe pour l'utilisateur via dialog
  password=$(dialog --title "Définir un mot de passe" \
   --passwordbox "Entrez le mot de passe pour l'utilisateur $username :" 10 40 3>&1 1>&2 2>&3)
 
  # Si l'utilisateur annule la saisie
  if [[ -z "$password" ]]; then
    dialog --msgbox "Opération annulée. Aucun mot de passe fourni." 10 40
    return
  fi

  # Définir le mot de passe à l'aide de chpasswd, de manière non interactive
  ssh -t wilder@$computer "echo '$username:$password' | sudo chpasswd"  && dialog --msgbox "Mot de passe défini pour $username avec succès." 10 40 || dialog --msgbox "Échec de la définition du mot de passe." 10 40
#  dialog --msgbox "$(ssh -t $username@$computer &&  dialog --msgbox "conx avec succée ssh $username")"
 # exit 0   
  # Copier la clé SSH dans le répertoire .ssh de l'utilisateur
  #dialog --infobox "Copie de la clé SSH..." 10 40
 # ssh-copy-id $username@$computer && dialog --msgbox "Clé SSH copiée avec succès pour $username." 10 40 || dialog --msgbox "Échec de la copie de la clé SSH." 10 40

  # Ajouter un événement dans les logs (fonction log_event à définir ailleurs dans votre script)
  log_event "A créé l'utilisateur $username sur la machine avec l'adresse $computer"
}




# Fonction pour modifier  un utilisateur 

modify_user() {

    # Demander le nom de l'utilisateur avec une boîte de saisie
    username=$(dialog --inputbox "Entrez le nom de l'utilisateur :" 10 60 3>&1 1>&2 2>&3 3>&-)

    # Vérifier si un nom d'utilisateur a été saisi
    if [ -z "$username" ]; then
        dialog --msgbox "Aucun nom d'utilisateur saisi. Opération annulée." 8 60
        return
    fi

    # Demander l'adresse IP de l'ordinateur avec une boîte de saisie
    computer=$(dialog --inputbox "Entrez l'adresse IP de l'ordinateur :" 10 60 3>&1 1>&2 2>&3 3>&-)

    # Vérifier si une adresse IP a été saisie
    if [ -z "$computer" ]; then
        dialog --msgbox "Aucune adresse IP saisie. Opération annulée." 8 60
        return
    fi
 # Demander un mot de passe pour l'utilisateur via dialog
  password=$(dialog --title "Définir un mot de passe" \
   --passwordbox "Entrez le nouveau  de passe pour l'utilisateur $username :" 10 40 3>&1 1>&2 2>&3)
 
  # Si l'utilisateur annule la saisie
  if [[ -z "$password" ]]; then
    dialog --msgbox "Opération annulée. Aucun mot de passe fourni." 10 40
    return
  fi

    # Exécuter les commandes sur l'ordinateur distant
      ssh -t wilder@$computer "echo '$username:$password' | sudo chpasswd"  && dialog --msgbox "Mot de passe modifié pour $username avec succès..." 10 40
    # Afficher un message de confirmation
    dialog --msgbox "Utilisateur $username a été modifié sur la machine avec l'adresse $computer." 8 60

    # Enregistrer l'événement
    log_event "A modifié l'utilisateur $username sur la machine avec l'adresse $computer"
}


# Fonction pour supprimer un utilisateur


delete_user() {
    # Demander le nom d'utilisateur avec une boîte de saisie
    username=$(dialog --inputbox "Entrez le nom d'utilisateur à supprimer :" 10 60 3>&1 1>&2 2>&3 3>&-)
   
    # Vérifier si une adresse IP a été saisie

    if [ -z "$username" ]; then
        dialog --msgbox "Aucun nom d'utilisateur saisie. Opération annulée." 8 60
        return
    fi

# Demander l'adresse Ip avec une boîte de saisie
      computer=$(dialog --inputbox "Entrez l'adresse Ip :" 10 60 3>&1 1>&2 2>&3 3>&-)

# Vérifier si l'adresse Ip a été saisi
     if [ -z "$computer" ]; then
         dialog --msgbox "Aucun adresse Ip  saisi. Opération annulée." 8 60
         return
     fi


    # Supprimer l'utilisateur
       ssh -t wilder@$computer  sudo deluser  --remove-home  $username

   
    # Vérifier le résultat de la commande
    if [ $? -eq 0 ]; then
        dialog --msgbox "L'utilisateur $username a été supprimé avec succès." 8 60
        log_event "A supprimé l'utilisateur $username avec succès"
    else
        dialog --msgbox "Erreur lors de la suppression de l'utilisateur $username." 8 60
        log_event "Échec de la suppression de l'utilisateur $username"
    fi
}

#################################

# 2) SOUS MENU GERER LES ORDINATEURS

#################################


gerer_ordinateur() {
    while true; do
        action=$(dialog --clear --stdout \
            --title "Gestion des ordinateurs" \
            --menu "Choisissez une action" 15 50 5 \
            1 "Gérer les services" \
            2 "Mettre à jour le système" \
            3 "Arrêter un ordinateur" \
            4 "Redémarrer un ordinateur" \
            5 "Retour au menu principal")

        case $action in
            1) log_event "A navigué dans le menu Gérer les services"; gerer_services ;;
            2) log_event "A navigué dans le menu Mettre à jour le système"; maj_systeme ;;
            3) log_event "A navigué dans le menu Arrêter un ordinateur"; arreter_machine ;;
            4) log_event "A navigué dans le menu Redémarrer un ordinateur"; redemarrer_machine ;;
            5) break ;;
            *) dialog --msgbox "Action invalide." 6 20 ;;
        esac
    done
}




#################################

# 2-1) SOUS SOUS MENU GERER LES SERVICES

#################################

gerer_services() {
    while true; do
        action=$(dialog --clear --stdout \
            --title "Gestion des services" \
            --menu "Choisissez une action" 15 50 5 \
            1 "Lister les services actifs" \
            2 "Démarrer un service" \
            3 "Arrêter un service" \
            4 "Afficher les partitions des disques" \
            5 "Retour au menu Gestion des ordinateurs")

        case $action in
            1) lister_services ;;
            2) démarrer_service ;;
            3) arreter_service ;;
            4) afficher_disques ;;
            5) break ;;
            *) dialog --msgbox "Action invalide." 6 20 ;;
        esac
    done
}

##################################################################


lister_services() {

    # Boîte de saisie pour l'adresse IP
    computer=$(dialog --inputbox "Entrez l'adresse IP de l'ordinateur :" 10 40 3>&1 1>&2 2>&3 3>&-)

    # Vérification si une adresse IP a été fournie
    if [ -z "$computer" ]; then
        dialog --msgbox "Aucune adresse IP fournie. Annulation de l'opération." 10 40
        return
    fi

    # Fichier temporaire pour stocker le résultat
    temp_file=$(mktemp)

    # Exécuter la commande SSH pour récupérer les utilisateurs et rediriger la sortie vers le fichier temporaire
    ssh -t wilder@"$computer" sudo SYSTEMD_COLORS=0 systemctl --no-pager list-units --type=service --state=active | awk '{print $1, $2, $3, $4 }'  | column -t   > "$temp_file" 2>/dev/null

#    ssh -t wilder@"$computer" sudo systemctl --no-pager list-units --type=service --state=active > "$temp_file" 2>/dev/null
   

 # Vérification si le fichier est vide
    if [ ! -s "$temp_file" ]; then
        dialog --msgbox "Aucun utilisateur trouvé ou erreur lors de l'exécution de la commande." 10 40
        rm -f "$temp_file"
        return
    fi

    # Forcer l'utilisation du fichier temporaire en passant son contenu à dialog
    temp_fixed=$(mktemp)
    cat "$temp_file" > "$temp_fixed"
    
    # Afficher le contenu du fichier temporaire dans une boîte
    dialog  --title  "Liste des services actifs"  --textbox "$temp_fixed" 30 100

    # Supprimer les fichiers temporaires après utilisation
    rm -f "$temp_file" "$temp_fixed"

    # Enregistrer l'événement dans les logs
    log_event "A affiché la liste des utilisateurs sur le PC $computer"
}

démarrer_service() {
 

   # Demander l'adresse IP de l'ordinateur avec une boîte de saisie
    computer=$(dialog --inputbox "Entrez l'adresse IP de l'ordinateur :" 10 60 3>&1 1>&2 2>&3 3>&-)

    # Vérifier si une adresse IP a été saisie
    if [ -z "$computer" ]; then
        dialog --msgbox "Aucune adresse IP saisie. Opération annulée." 8 60
        return
    fi

    # Demander le nom du service à démarrer avec une boîte de saisie
    name_service=$(dialog --inputbox "Entrez le nom du service à démarrer :" 10 60 3>&1 1>&2 2>&3 3>&-)

    # Vérifier si un nom de service a été saisi
    if [ -z "$name_service" ]; then
        dialog --msgbox "Aucun nom de service saisi. Opération annulée." 8 60
        return
    fi

    # Exécuter la commande pour démarrer le service
    ssh -t wilder@$computer "sudo systemctl start $name_service"

    # Afficher un message de confirmation dans une boîte de dialogue
    dialog --msgbox "$name_service est maintenant actif sur la machine $computer." 8 60

    # Enregistrer l'événement
    log_event "A Démarré le service $name_service sur la machine avec l'adresse $computer"
}


arreter_service() {
    # Demander l'adresse IP de l'ordinateur avec une boîte de saisie
    computer=$(dialog --inputbox "Entrez l'adresse IP de l'ordinateur :" 10 60 3>&1 1>&2 2>&3 3>&-)

    # Vérifier si une adresse IP a été saisie
    if [ -z "$computer" ]; then
        dialog --msgbox "Aucune adresse IP saisie. Opération annulée." 8 60
        return
    fi

    # Demander le nom du service à arrêter avec une boîte de saisie
    name_service=$(dialog --inputbox "Entrez le nom du service à arrêter :" 10 60 3>&1 1>&2 2>&3 3>&-)

    # Vérifier si un nom de service a été saisi
    if [ -z "$name_service" ]; then
        dialog --msgbox "Aucun nom de service saisi. Opération annulée." 8 60
        return
    fi

    # Exécuter la commande pour arrêter le service
    ssh -t wilder@$computer "sudo systemctl stop $name_service"

    # Afficher un message de confirmation dans une boîte de dialogue
    dialog --msgbox "Le service $name_service est maintenant arrêté sur la machine $computer." 8 60

    # Enregistrer l'événement
    log_event "A arrêté le service $name_service sur la machine avec l'adresse $computer"
}



afficher_disques() {
    # Demander l'adresse IP de l'ordinateur avec une boîte de saisie
    computer=$(dialog --inputbox "Entrez l'adresse IP de l'ordinateur :" 10 60 3>&1 1>&2 2>&3 3>&-)

    # Vérifier si une adresse IP a été saisie
    if [ -z "$computer" ]; then
        dialog --msgbox "Aucune adresse IP saisie. Opération annulée." 8 60
        return
    fi

    # Exécuter la commande pour afficher les partitions du disque
    disk_info=$(ssh -t wilder@$computer "sudo df -h" | column -t  2>&1)

    # Vérifier si la commande a échoué
    if [ $? -ne 0 ]; then
        dialog --msgbox "Erreur lors de la récupération des informations des disques sur $computer." 8 60
        return
    fi

#Afficher les informations des partitions dans une boîte de dialogue
   dialog --msgbox "$(echo -e "Partition des disques  $computer: \n\n $disk_info")" 15 80
    
    # Enregistrer l'événement
    log_event "A affiché les partitions de la machine avec l'adresse $computer"
}
#################################

# 2-2) SOUS SOUS MENU METTRE A JOUR LE SYSTEME

#################################


maj_systeme() {
    dialog --clear --title "Mettre à jour le système" \
    --menu "Choisissez une action:" 15 50 5 \
    1 "Version du système" \
    2 "Rechercher et appliquer les mises à jour" \
    3 "Lister les mises à jour" \
    4 "Mettre à jour le système" \
    5 "Retour au menu principal" 2>menu_choice.txt

    action=$(<menu_choice.txt)

    case $action in
        1) log_event "A navigué dans le menu Version du système" ; version_systeme ;;
        2) log_event "A navigué dans le menu Rechercher et appliquer les mises à jour" ; recherche_maj ;;
        3) log_event "A navigué dans le menu Lister les mises à jour" ; lister_maj ;;
        4) log_event "A navigué dans le menu Mettre à jour le système" ; mise_jour_système ;;
        5) log_event "A affiché le menu principal" ; show_menu ;;
        *) log_event "A saisi un choix invalide" ; dialog --msgbox "Action invalide." 6 40 ; maj_systeme ;;
    esac
}


version_systeme() {
    # Demander l'adresse IP de l'ordinateur avec une boîte de saisie
    computer=$(dialog --inputbox "Entrez l'adresse IP de l'ordinateur :" 10 60 3>&1 1>&2 2>&3 3>&-)

    # Vérifier si une adresse IP a été saisie
    if [ -z "$computer" ]; then
        dialog --msgbox "Aucune adresse IP saisie. Opération annulée." 8 60
        return
    fi

    # Récupérer la version du système sur la machine distante
    version_info=$(ssh -t wilder@$computer "sudo lsb_release -a" 2>&1)

    # Afficher les informations de version dans une boîte de message
    
    dialog --msgbox "$(echo -e "Version du système pour $computer :\n\n$version_info")" 15 80

    # Enregistrer l'événement
    log_event "A demandé la version du système de la machine avec l'adresse $computer"

maj_systeme
} 

recherche_maj() {
  computer=$(dialog --inputbox "Entrez l'adresse IP de l'ordinateur:" 10 50 3>&1 1>&2 2>&3 3>&-)
  clear
  if ssh -t wilder@$computer "sudo apt update"; then
    dialog --msgbox "Recherche de mises à jour effectuée avec succès pour $computer." 10 50
    log_event "A recherché des mises à jour système sur la machine avec l'adresse $computer"
  else
    dialog --msgbox "Échec de la recherche de mises à jour pour $computer." 10 50
  fi
maj_systeme
}

mise_jour_système() {
  computer=$(dialog --inputbox "Entrez l'adresse IP de l'ordinateur:" 10 50 3>&1 1>&2 2>&3 3>&-)
  clear
  if ssh -t wilder@$computer "sudo apt upgrade"; then
    dialog --msgbox "Mise à jour du système effectuée avec succès pour $computer." 10 50
    log_event "A effectué la mise à jour du système de la machine avec l'adresse $computer"
  else
    dialog --msgbox "Échec de la mise à jour du système pour $computer." 10 50
  fi

maj_systeme
}

lister_maj() {
  computer=$(dialog --inputbox "Entrez l'adresse IP de l'ordinateur:" 10 50 3>&1 1>&2 2>&3 3>&-)
  clear
  if  ssh  -t wilder@$computer   "sudo apt list --upgradable" | sed  -E 's/\x1b\[[0-9;]*m//g; s/\\^//g; s/\\n//g' | grep -v 'En train de lister... Fait'  > temp_file
  then
    dialog --title "Liste des mises a jour " --msgbox "$( cat "/home/groupe3/Documents/temp_file")" 15 80

#    dialog --msgbox "Liste des mises à jour affichée avec succès pour $computer." 10 50
    log_event "A listé les mises à jour système sur la machine avec l'adresse $computer"
  else
    dialog --msgbox "Échec de la liste des mises à jour pour $computer." 10 50
  fi


maj_systeme
}

# Fonction arrêter la machine

arreter_machine() {
    # Demander l'adresse IP de l'ordinateur avec une boîte de saisie
    computer=$(dialog --inputbox "Entrez l'adresse IP de l'ordinateur :" 10 60 3>&1 1>&2 2>&3 3>&-)

    # Vérifier si une adresse IP a été saisie
    if [ -z "$computer" ]; then
        dialog --msgbox "Aucune adresse IP saisie. Opération annulée." 8 60
        return
    fi

    # Exécuter la commande pour arrêter la machine
    ssh -t wilder@$computer "sudo shutdown -h now" &>/dev/null

    # Vérifier si la commande a réussi
    if [ $? -eq 0 ]; then
        dialog --msgbox "L'ordinateur $computer est arrêté." 8 60
        log_event "A arrêté la machine avec l'adresse $computer"
    else
        dialog --msgbox "Erreur lors de l'arrêt de l'ordinateur $computer." 8 60
    fi
}

# Fonction redémarrer la machine


redemarrer_machine() {
    # Demander l'adresse IP de l'ordinateur avec une boîte de saisie
    computer=$(dialog --inputbox "Entrez l'adresse IP de l'ordinateur :" 10 60 3>&1 1>&2 2>&3 3>&-)

    # Vérifier si une adresse IP a été saisie
    if [ -z "$computer" ]; then
        dialog --msgbox "Aucune adresse IP saisie. Opération annulée." 8 60
        return
    fi

    # Exécuter la commande pour redémarrer la machine via SSH
    ssh -t wilder@$computer "sudo reboot" &>/dev/null

    # Vérifier si la commande a réussi
    if [ $? -eq 0 ]; then
        dialog --msgbox "L'ordinateur $computer est redémarré." 8 60
        log_event "A redémarré la machine avec l'adresse $computer"
    else
        dialog --msgbox "Erreur lors du redémarrage de l'ordinateur $computer." 8 60
    fi
}

###############################

# 3) SOUS MENU COLLECTER LES INFORMATIONS

##############################

collecter_infos() {
    dialog --clear --title "Collecter des informations" \
    --menu "Choisissez une action:" 15 50 3 \
    1 "Informations sur un utilisateur" \
    2 "Informations sur un ordinateur" \
    3 "Consulter les infos " \
    4 "Retour au menu principal" 2>menu_choice.txt

    action=$(<menu_choice.txt)

    case $action in
        1) log_event "A navigué dans le menu Informations sur un utilisateur" ; collecte_utilisateurs_infos ;;
        2) log_event "A navigué dans le menu Informations sur un ordinateur" ; collecte_ordinateurs_infos ;;
        3) log_event "A navigué dans le menu consulte fichier" ; consulter_fichier ;;
        4) log_event "A affiché le menu principal" ; show_menu ;;
        *) log_event "A saisi un choix invalide" ; dialog --msgbox "Action invalide." 6 40 ; collecter_infos ;;
    esac
}


###############################

# FONCTIONS COLLECTER LES INFORMATIONS

##############################


# Fonction pour rechercher un utilisateur avec autocomplétion via un menu
# Fonction pour rechercher un utilisateur avec autocomplétion
search_user_autocomplete() {
    local computer=$1
    local partial_username=""
    local user_list
    local matched_users

    while true; do
        # Demander une chaîne partielle pour le nom d'utilisateur
        partial_username=$(dialog --inputbox "Entrez une partie du nom d'utilisateur :\n(Autocomplétion active)" 10 60 "$partial_username" 3>&1 1>&2 2>&3 3>&-)

        # Vérifier si une chaîne a été saisie
        if [ -z "$partial_username" ]; then
            dialog --msgbox "Aucune chaîne saisie. Opération annulée." 8 60
            return
        fi

        # Récupérer les utilisateurs correspondants depuis la machine distante
        user_list=$(ssh wilder@$computer "awk -F: '\$1 ~ /^$partial_username/ {print \$1}' /etc/passwd" 2>/dev/null)

        # Vérifier si des correspondances ont été trouvées
        if [ -z "$user_list" ]; then
            dialog --msgbox "Aucun utilisateur ne correspond à '$partial_username'. Essayez à nouveau." 8 60
            continue
        fi

        # Si une seule correspondance est trouvée, l'utiliser directement
        matched_users=$(echo "$user_list" | wc -l)
        if [ "$matched_users" -eq 1 ]; then
            echo "$user_list" 
            
            return
        fi

# Création du menu avec les utilisateurs numérotés
        selected_user=$(dialog --menu "Plusieurs correspondances trouvées. Sélectionnez un utilisateur :" 15 50 10 $(echo "$user_list" | awk '{print NR, $0}') 3>&1 1>&2 2>&3 3>&-)
        
        if [ -n "$selected_user" ]; then
            # Récupérer l'utilisateur sélectionné depuis la liste
            echo "$user_list" | sed -n "${selected_user}p"
            return
        fi
    done
}

        # Si plusieurs correspondances sont trouvées, demander une sélection
     #   partial_username=$(dialog --menu "Plusieurs correspondances trouvées. Sélectionnez un utilisateur :" 15 50 10 $(echo "$user_list" | awk '{print NR, $0}') 3>&1 1>&2 2>&3 3>&-)

        # Si un utilisateur est sélectionné, le retourner
      #  if [ -n "$partial_username" ]; then
       #     echo "$partial_username"
        #    return
      #  fi
  #  done
# }

# Fonction principale pour collecter les infos de l'utilisateur
collecte_utilisateurs_infos() {
    # Demander l'adresse IP de l'ordinateur avec une boîte de saisie
    computer=$(dialog --inputbox "Entrez l'adresse IP de l'ordinateur :" 10 60 3>&1 1>&2 2>&3 3>&-)

    # Vérifier si une adresse IP a été saisie
    if [ -z "$computer" ]; then
        dialog --msgbox "Aucune adresse IP saisie. Opération annulée." 8 60
        return
    fi

    # Rechercher un utilisateur avec la fonction search_user_autocomplete
    local username=$(search_user_autocomplete "$computer")

    # Vérifier si un utilisateur valide a été retourné
    if [ -z "$username" ]; then
        dialog --msgbox "Opération annulée. Aucun utilisateur valide sélectionné." 8 60
        return
    fi

    # Collecter les informations sur l'utilisateur sélectionné
    temp_file=$(mktemp)

    ssh -t wilder@$computer "sudo lastlog -u $username"  > "$temp_file" 2>/dev/null
    
    # Vérifier si le fichier est vide ou contient des erreurs
    if [ ! -s "$temp_file" ]; then
        dialog --msgbox "Aucune information trouvée pour l'utilisateur $username." 8 60
        rm -f "$temp_file"
        return
    fi

    # Afficher les informations collectées dans une boîte de message
    dialog --msgbox "$(cat "$temp_file")" 20 60
     ssh -t wilder@$computer "sudo lastlog -u $username" >> "/home/groupe3/Documents/info_${username}_$(date +%Y%m%d).txt"

    # Afficher un message indiquant où les informations ont été enregistrées
    dialog --msgbox "Les informations sur l'utilisateur $username ont bien été collectées et enregistrées dans /home/groupe3/Documents/info_${username}_$(date +%Y%m%d).txt" 8 80

    # Supprimer le fichier temporaire
    rm -f "$temp_file"

    # Enregistrer l'événement
    log_event "A collecté les infos de l'utilisateur $username de la machine avec l'adresse $computer"

collecter_infos
}


collecte_ordinateurs_infos() {
    # Demander l'adresse IP de l'ordinateur avec une boîte de saisie
    computer=$(dialog --inputbox "Entrez l'adresse IP de l'ordinateur :" 10 60 3>&1 1>&2 2>&3 3>&-)

    # Vérifier si une adresse IP a été saisie
    if [ -z "$computer" ]; then
        dialog --msgbox "Aucune adresse IP saisie. Opération annulée." 8 60
        return
    fi

    # Collecter les informations de l'ordinateur via SSH et les enregistrer dans un fichier
    ssh -t wilder@$computer "sudo lsb_release -a" > "/home/groupe3/Documents/info_${computer}_$(date +%Y%m%d).txt"

    # Afficher un message indiquant où les informations ont été enregistrées
    dialog --msgbox "Les informations sur l'ordinateur $computer ont bien été collectées et enregistrées dans /home/groupe3/Documents/info_${computer}_$(date +%Y%m%d).txt" 8 80

    # Afficher les informations collectées dans une fenêtre de message
#    dialog --textbox "/home/groupe3/Documents/info_${computer}_$(date +%Y%m%d).txt" 20 60
    dialog  --title "Infos sur la version du OS de la machine d'adresse Ip:$computer"  --msgbox "$( cat "/home/groupe3/Documents/info_${computer}_$(date +%Y%m%d).txt")" 15 80
    # Enregistrer l'événement
    log_event "A collecté les infos de la machine avec l'adresse $computer"

collecter_infos

}

consulter_fichier() {

  dialog --clear --title "Consulter infos & logs" \
    --menu "Choisissez une action:" 15 50 3 \
    1 "Consulter les logs" \
    2 "Consulter les infos utilisateur" \
    3 "Consulter les infos de l'ordinateur" \
    4 "Retour au menu Collecter les infos" 2>menu_choice.txt

    action=$(<menu_choice.txt)

    case $action in
        1) log_event "A navigué dans le menu consulter les logs" ; consulte_logs ;;
        2) log_event "A navigué dans le menu consulter les infos d'utilisateur" ; infos_user ;;
        3) log_event "A navigué dans le menu consulter les infos d'ordinateur" ; infos_ordi ;;
        4) log_event "A affiché le menu Collecter les infos" ; collecter_infos ;;
        *) log_event "A saisi un choix invalide" ; dialog --msgbox "Action invalide." 6 40 ; consulter_fichier ;;
    esac


}

infos_user() {

username=$(dialog --inputbox "Entrez le nom d'utilisateur :" 10 60 3>&1 1>&2 2>&3 3>&-)
fichier_infos_user="/home/groupe3/Documents/info_${username}_*"

# Vérifier si au moins un fichier correspondant existe
if ! ls $fichier_infos_user 1>/dev/null 2>&1; then
    dialog --msgbox "Aucun fichier trouvé pour l'utilisateur ${username}." 10 40
    exit 1
fi

temp_file=$(mktemp)
# Concatenation des fichiers trouvés dans le fichier temporaire
cat $fichier_infos_user > "$temp_file"
# Vérifier si le fichier temporaire est vide
if [ ! -s "$temp_file" ]; then
    dialog --msgbox "Le fichier est vide." 10 40
    rm -f "$temp_file"
    exit 1
fi

# Affichage du contenu dans une boîte de dialogue
dialog --textbox "$temp_file" 40 80
rm -f "$temp_file"


consulter_fichier
}

infos_ordi() {
adresseip=$(dialog --inputbox "Entrez l'adresse ip :" 10 60 3>&1 1>&2 2>&3 3>&-)
# Vérifiez que l'adresse IP est définie
if [ -z "$adresseip" ]; then
   echo "Erreur : La variable adresseip n'est pas définie."
    exit 1
fi

# Chercher les fichiers correspondants
fichiers=$(ls /home/groupe3/Documents/info_${adresseip}_* 2>/dev/null)
if [ -z "$fichiers" ]; then
    echo "Erreur : Aucun fichier trouvé correspondant au motif info_${adresseip}_*."
    exit 1
fi

# Afficher les fichiers trouvés
for file in $fichiers; do
    temp_file=$(mktemp)
    cat "$file" > "$temp_file"

done
#dialog --msgbox "$(cat "$temp_file")" 20 60
dialog  --title "Infos sur la version du OS de la machine d'adresse Ip:$adresseip"  --msgbox "$( cat "$temp_file")" 15 80


consulter_fichier
}

consulte_logs() {

fichier_log="/var/log/log_evt.log"

if [ ! -f "$fichier_log" ]; then
	dialog --msgbox "Le fichier n'existe pas." 10 40
	return
fi

temp_file=$(mktemp)

cat "$fichier_log" > "$temp_file"

if [ !-s "$temp_file" ]; then
1	dialog --msgbox "Le fichier est vide." 10 40
       
	return
fi

dialog --textbox "$temp_file" 40 80

rm -f "$temp_file"

consulter_fichier
}



show_menu
