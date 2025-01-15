
#       ██████╗  ██████╗ ██╗    ██╗███████╗██████╗ ███████╗██╗  ██╗███████╗██╗     ██╗         ███████╗ ██████╗██████╗ ██╗██████╗ ████████╗
#       ██╔══██╗██╔═══██╗██║    ██║██╔════╝██╔══██╗██╔════╝██║  ██║██╔════╝██║     ██║         ██╔════╝██╔════╝██╔══██╗██║██╔══██╗╚══██╔══╝
#       ██████╔╝██║   ██║██║ █╗ ██║█████╗  ██████╔╝███████╗███████║█████╗  ██║     ██║         ███████╗██║     ██████╔╝██║██████╔╝   ██║   
#       ██╔═══╝ ██║   ██║██║███╗██║██╔══╝  ██╔══██╗╚════██║██╔══██║██╔══╝  ██║     ██║         ╚════██║██║     ██╔══██╗██║██╔═══╝    ██║   
#       ██║     ╚██████╔╝╚███╔███╔╝███████╗██║  ██║███████║██║  ██║███████╗███████╗███████╗    ███████║╚██████╗██║  ██║██║██║        ██║   
#       ╚═╝      ╚═════╝  ╚══╝╚══╝ ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝    ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝   
                                                                                                                                     

#       ████████╗███████╗ █████╗ ███╗   ███╗    ██████╗ 
#       ╚══██╔══╝██╔════╝██╔══██╗████╗ ████║    ╚════██╗
#          ██║   █████╗  ███████║██╔████╔██║     █████╔╝
#          ██║   ██╔══╝  ██╔══██║██║╚██╔╝██║     ╚═══██╗
#          ██║   ███████╗██║  ██║██║ ╚═╝ ██║    ██████╔╝
#          ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝    ╚═════╝ 





# Fonction pour journaliser les evenements
function Journaliser-Evenement {
    param (
        [string]$Evenement
    )
    $FichierJournal = "C:\Windows\System32\LogFiles\journal_evt.log"
    $Horodatage = Get-Date -Format "yyyyMMdd-HHmmss"
    $Utilisateur = $env:USERNAME
    "$Horodatage - $Utilisateur - $Evenement" | Out-File -Append -FilePath $FichierJournal
}

Journaliser-Evenement "********Debut du Script********"

# Fonction pour afficher un menu avec fzf
function Afficher-Menu {
    param (
        [string]$Titre,
        [array]$Options
    )

    Write-Host "`n$Titre" -ForegroundColor Cyan
    $choix = $Options | fzf --prompt "Selectionnez une option : " --height 40% --reverse

    return $Options.IndexOf($choix) + 1
}

# Fonction d'execution distante via SSH
function Executer-Distant {
    param (
        [string]$Ordinateur,
        [string]$Commande
    )

    ssh wilder@$Ordinateur $Commande
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Erreur lors de l'execution de la commande sur $Ordinateur" -ForegroundColor Red
    }
}

# Gestion des utilisateurs
function Gerer-Utilisateurs {
    cls
    $options = @("Lister les utilisateurs", "Creer un utilisateur", "Changer un mot de passe", "Supprimer un utilisateur", "Retour au menu principal")
    while ($true) {
        $choix = Afficher-Menu -Titre "Gestion des utilisateurs" -Options $options
        switch ($choix) {
            1 {
                $ordinateur = Read-Host "Entrez l'adresse IP de l'ordinateur"
               
                # Recuperer la liste des utilisateurs
                $listeUtilisateurs = Executer-Distant -Ordinateur $ordinateur -Commande "Powershell Get-LocalUser" | Out-String

                # Utiliser fzf pour selectionner un utilisateur
                $utilisateurSelectionne = $listeUtilisateurs | fzf --prompt "Selectionnez un utilisateur : " --height 40% --reverse

                if ($utilisateurSelectionne) {
                    Write-Host "Utilisateur selectionne : $utilisateurSelectionne"
                    Journaliser-Evenement "Utilisateur selectionne : $utilisateurSelectionne sur $ordinateur"
                } else {
                    Write-Host "Aucun utilisateur selectionne"
                }
            }
            2 {
                $nomUtilisateur = Read-Host "Entrez le nom de l'utilisateur"
                $ordinateur = Read-Host "Entrez l'adresse IP de l'ordinateur"
                $motDePasse = Read-Host "Entrez le mot de passe pour $nomUtilisateur" -AsSecureString
                $motDePasseTexte = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto(
                    [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($motDePasse))
                Executer-Distant -Ordinateur $ordinateur -Commande "net user $nomUtilisateur $motDePasseTexte /add"
                Journaliser-Evenement "Creation de l'utilisateur $nomUtilisateur sur $ordinateur"
            }
            3 {
                $nomUtilisateur = Read-Host "Entrez le nom de l'utilisateur"
                $ordinateur = Read-Host "Entrez l'adresse IP de l'ordinateur"
                $motDePasse = Read-Host "Entrez le nouveau mot de passe pour $nomUtilisateur" -AsSecureString
                $motDePasseTexte = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto(
                    [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($motDePasse))
                Executer-Distant -Ordinateur $ordinateur -Commande "net user $nomUtilisateur $motDePasseTexte"
                Journaliser-Evenement "Changement du mot de passe pour $nomUtilisateur sur $ordinateur"
            }
            4 {
                $nomUtilisateur = Read-Host "Entrez le nom de l'utilisateur a supprimer"
                $ordinateur = Read-Host "Entrez l'adresse IP de l'ordinateur"
                Executer-Distant -Ordinateur $ordinateur -Commande "net user $nomUtilisateur /delete"
                Journaliser-Evenement "Suppression de l'utilisateur $nomUtilisateur sur $ordinateur"
            }
            5 { 
                cls 
                Menu-Principal }
            Default {
                Write-Host "Selection non valide" -ForegroundColor Red
            }
        }
    }
}

# Gestion des Ordinateurs
function Gerer-Ordinateurs {
      cls
    $options = @("Gerer les services","Mettre a jour le systeme ","Arreter un ordinateur","Redemarrer un ordinateur", "Retour au menu principal")
    while ($true) {        $choix = Afficher-Menu -Titre "Gestion des Ordinateurs" -Options $options
        switch ($choix) {
            1 {
                Journaliser-Evenement "Navigation vers Gerer les services"
                
                Gerer-services
            }
             2 {
                      

                $ordinateur = Read-Host "Entrez l'adresse IP de l'ordinateur a mettre a jour"
   
    try {
        $updates = Executer-Distant -Ordinateur $ordinateur -Commande "Powershell Import-Module PSWindowsUpdate && Powershell Get-WindowsUpdate -AcceptAll"
       
        if ($updates) {
            Write-Host "Mises a jour disponibles sur $ordinateur :" -ForegroundColor Yellow
            $updates | Format-Table -Property Title, KB, Size
           
            if ((Read-Host "Installer toutes les mises a jour ? (O/N)") -eq 'O') {
                Executer-Distant -Ordinateur $ordinateur -Commande "Powershell Start-Process powershell -ArgumentList '-Command Install-WindowsUpdate -AcceptAll -AutoReboot -Verbose' -Verb RunAs"
                Write-Host "Installation des mises a jour sur $ordinateur" -ForegroundColor Green
            }
        } else {
            Write-Host "Aucune mise a jour disponible pour $ordinateur" -ForegroundColor Green
        }
    } catch {
        Write-Host "Erreur lors de la recherche ou de l'installation des mises a jour : $_" -ForegroundColor Red
    }
   
    Journaliser-Evenement "Recherche et installation de mises a jour sur $ordinateur"


              }

            3 {
                $ordinateur = Read-Host "Entrez l'adresse IP de l'ordinateur a arreter"
                 Executer-Distant -Ordinateur $ordinateur -Commande "Powershell Stop-Computer -Force "
                 Write-Host "Arret de l'ordinateur $ordinateur" -ForegroundColor Red
                 Journaliser-Evenement "Navigation vers Arreter un ordinateur " 
                
                
            }
            4 {
                
                 $ordinateur = Read-Host "Entrez l'adresse IP de l'ordinateur a redemarrer"
                 Executer-Distant -Ordinateur $ordinateur -Commande "Powershell Restart-Computer -Force "
                 Write-Host "Redemarrer de l'ordinateur $ordinateur" -ForegroundColor Yellow
                 Journaliser-Evenement "Navigation vers Redemarrer un ordinateur "


            }
             5 {
                Journaliser-Evenement "Navigation vers Retour au menu principal "
                cls
                Menu-Principal
            }
            Default {
                Write-Host "Selection non valide" -ForegroundColor Red
            }
        }
    }



}    


# Gerer les services
function gerer-services {
    cls
    $options = @("Lister,Demarrer ou Arreter les services ","Afficher les partitions des disques", "Retour au menu Gestion des ordinateurs ")
    while ($true) {        $choix = Afficher-Menu -Titre "Gerer les services" -Options $options
        switch ($choix) {
            1 {
                  $ordinateur = Read-Host "Entrez l'adresse IP de l'ordinateur"
    if (-not $ordinateur) {
        Write-Host "Aucune adresse IP fournie. Annulation de l'operation." -ForegroundColor Red
        return
    }

    try {
        # Commande pour lister tous les services
        # | Powershell Select-Object DisplayName, Name, Status, StartType | Powershell Format-Table -AutoSize | Powershell Out-String
        $commande = "Powershell Get-Service"
        $resultat = Executer-Distant -Ordinateur $ordinateur -Commande $commande

        if ($resultat) {
            Write-Host "`nServices recuperes sur $ordinateur :" -ForegroundColor Cyan
            # Afficher la liste des services avec fzf pour la navigation
            $selection = $resultat | fzf --ansi --header "Selectionnez un service (Esc pour annuler)" --preview "echo {}"

            if ($selection) {
                # Extraire le nom du service selectionne
                $serviceName = ($selection -split '\s+')[1]  # Supposons que le nom est en 2e colonne

                # Proposer une action
                $action = Read-Host "Que voulez-vous faire avec le service '$serviceName' ? (start/stop/none)"
                switch ($action.ToLower()) {
                    "start" {
                        $commandeStart = "Powershell Start-Service -Name $serviceName"
                        Executer-Distant -Ordinateur $ordinateur -Commande $commandeStart
                        Write-Host "Le service '$serviceName' a ete demarre sur $ordinateur." -ForegroundColor Green
                        Journaliser-Evenement "Service '$serviceName' demarre sur $ordinateur"
                    }
                    "stop" {
                        $commandeStop = "Powershell Stop-Service -Name $serviceName -Force"
                        Executer-Distant -Ordinateur $ordinateur -Commande $commandeStop
                        Write-Host "Le service '$serviceName' a ete arrete sur $ordinateur." -ForegroundColor Green
                        Journaliser-Evenement "Service '$serviceName' arrete sur $ordinateur"
                    }
                    "none" {
                        Write-Host "Aucune action effectuee pour le service '$serviceName'." -ForegroundColor Yellow
                        Journaliser-Evenement "Aucune action effectuee pour le service '$serviceName'. "
                    }
                    default {
                        Write-Host "Action non reconnue. Annulation." -ForegroundColor Red
                    }
                }
            } else {
                Write-Host "Aucune selection effectuee." -ForegroundColor Yellow
            }
        } else {
            Write-Host "Aucun service trouve ou erreur lors de la recuperation des donnees." -ForegroundColor Red
        }
    } catch {
        Write-Host "Erreur lors de la recuperation des services : $_" -ForegroundColor Red
    }
                 Journaliser-Evenement "Navigation vers Lister les Services"
            }
          
            2 {
                cls
                 Journaliser-Evenement "Navigation vers Afficher les partitions des disques"
                
                 $ordinateur = Read-Host "Entrez l'adresse IP de l'ordinateur "
                 Write-Host "Afficher les Partitions de l'ordinateur $ordinateur" -ForegroundColor Yellow
                 Executer-Distant -Ordinateur $ordinateur -Commande "Powershell Get-PSDrive -PSProvider FileSystem "
                 Journaliser-Evenement "Navigation vers Afficher les Partitions "
            }
            3 {
                 Journaliser-Evenement "Navigation vers Retour au menu Gestion des ordinateurs"
                  cls
                  Gerer-Ordinateurs
                  
            }

            Default {
                Write-Host "Selection non valide" -ForegroundColor Red
            }
        }
    }
}


# Collecter des informations
function Collecter-informations {
    cls
    $options = @("Informations sur utilisateur","Informations sur ordinateur","Consulter les infos","Retour au menu principal ")
    while ($true) {        $choix = Afficher-Menu -Titre "Collecter des informations" -Options $options
        switch ($choix) {
            1 {
                          $ordinateur = Read-Host "Entrez l'adresse IP de l'ordinateur"
                          $nomUtilisateur = Search-User-Autocomplete -ordinateur $ordinateur

 
            }
             2 {

                $ordinateur = Read-Host "Entrez l'adresse IP de l'ordinateur"
                $versionOS = Executer-Distant -Ordinateur $ordinateur -Commande "Powershell (Get-WmiObject -Class Win32_OperatingSystem).Caption"

                # Affichage de la version de l'OS
                Write-Host "Version de l'OS sur l'ordinateur $ordinateur : $versionOS" -ForegroundColor Cyan

                # Enregistrement dans un fichier
                $dateRecueil = Get-Date -Format "yyyyMMdd"
                $fichier = "$env:USERPROFILE\Documents\info_${ordinateur}_${dateRecueil}.txt"
                "Version de l'OS sur l'ordinateur $ordinateur : $versionOS" | Out-File -FilePath $fichier
                Journaliser-Evenement "Navigation vers Informations sur ordinateur"
                Journaliser-Evenement "Enregistrement des informations sur l'ordinateur $ordinateur dans le fichier $fichier"

               
                
            }

            3 {
                 Journaliser-Evenement "Navigation vers Consulter les infos"
                
                consult-info
            }
            4 {
                 Journaliser-Evenement "Navigation vers Retour au menu principal"
                 cls
                Menu-Principal
                
            }
           

            Default {
                Write-Host "Selection non valide" -ForegroundColor Red
            }
        }
    }
}

# Consulter infos & logs
function consult-info {
    cls
    $options = @("Consulter les logs","Consulter les infos utilisateur","Consulter les infos ordinateur","Retour au menu collecter les infos ")
    while ($true) {        $choix = Afficher-Menu -Titre "Consulter les infos & logs" -Options $options
        switch ($choix) {
            1 {

                
                  # Logs
                $fichierJournal = "C:\Windows\System32\LogFiles\journal_evt.log"
                if (Test-Path $fichierJournal) {
                    $logs = Get-Content $fichierJournal
                    if ($logs) {
                        $logSelectionne = $logs | fzf --prompt "Selectionnez un log : " --height 40% --reverse
                    
                    } else {
                        Write-Host "Le fichier journal est vide." -ForegroundColor Yellow
                    }
                } else {
                    Write-Host "Fichier journal non trouve : $fichierJournal" -ForegroundColor Red
                }
                 Journaliser-Evenement "Navigation vers Consulter les logs "
                cls
               
            }
             2 {
                 $nom_utilisateur = Read-Host "Entrez le Nom de l'utilisateur"
                 $fichierUtilisateur = "C:\Users\Administrateur\Documents\info_$nom_utilisateur*"
                  
                 if (Test-Path $fichierUtilisateur) {
                     Get-Content $fichierUtilisateur | Select-Object -Skip 3
                 } else {
                    Write-Host "Fichier non trouve." -ForegroundColor Red
                 }
                Journaliser-Evenement "Navigation vers Consulter les infos utilisateur:  $nom_utilisateur "
              
            }

            3 {


                  $ip_ordinateur = Read-Host "Entrez l'Adresse Ip de l'ordinateur"
                  $fichierOrdinateur = "C:\Users\Administrateur\Documents\info_$ip_ordinateur*"
                 if (Test-Path $fichierOrdinateur) {
                    Get-Content $fichierOrdinateur 
                } else {
                   Write-Host "Fichier non trouve." -ForegroundColor Red
                }
                 Journaliser-Evenement "Navigation vers Consulter les infos ordinateur"
                
              
            }
            4 {
                 Journaliser-Evenement "Navigation vers Retour au menu Collecter les infos"
                 cls
               Collecter-informations
                
            }
           

            Default {
                Write-Host "Selection non valide" -ForegroundColor Red
            }
        }
    }
}

# AutoCompletion

function Search-User-Autocomplete {
    param (
        [string]$computer
    )

    $partial_username = ""
    
    while ($true) {
        # Demander une chaine partielle pour le nom d'utilisateur
        $partial_username = Read-Host "Entrez une partie du nom d'utilisateur (Autocompletion active)"
        
        # Verifier si une chaine a ete saisie
        if (-not $partial_username) {
            Write-Host "Aucune chaine saisie. Operation annulee."
            return
        } 

       # | Powershell  Format-Table -HideTableHeaders | Powershell Out-String
 $file_content  = Executer-Distant -Ordinateur $ordinateur -Commande "Powershell Get-LocalUser "
        # Recuperer les utilisateurs correspondants depuis la machine distante
        try {
            
            $user_list  = $file_content | Where-Object { ($_ -split ":")[0] -match "^$partial_username" }
        }
        catch {
            Write-Host "Erreur lors de la recuperation des utilisateurs depuis la machine distante."
            return
        }

        # Verifier si des correspondances ont ete trouvees
        if (-not $user_list) {
            Write-Host "Aucun utilisateur ne correspond à '$partial_username'. Essayez à nouveau."
            continue
        }

        # Si plusieurs utilisateurs sont trouves ou un seul, utiliser fzf pour la selection
        $selected_user = $user_list | fzf --prompt="Selectionnez un utilisateur :"

        if ($selected_user) {
            Write-Host "Utilisateur selectionne : $selected_user"
            $selected_user = $selected_user -replace "\s.*", ""
         
         $dateDerniereConnexion = Executer-Distant -Ordinateur $ordinateur -Commande "Powershell (Get-LocalUser -Name '$selected_user').LastLogon"
        Write-Host "Derniere connexion de l'utilisateur $selected_user : $dateDerniereConnexion" -ForegroundColor Cyan
         # Enregistrement dans un fichier
        $dateRecueil = Get-Date -Format "yyyyMMdd"
        $fichier = "$env:USERPROFILE\Documents\info_${selected_user}_${dateRecueil}.txt"
        "Dernière connexion de l'utilisateur $selected_user : $dateDerniereConnexion" | Out-File -Append -FilePath $fichier

        # Journalisation des événements
        Journaliser-Evenement "Navigation vers Informations sur l'utilisateur"
        Journaliser-Evenement "Enregistrement des informations sur l'utilisateur $selected_user dans le fichier $fichier"
       #  Collecter-informations
        #Journaliser-Evenement "Navigation vers Collecter-informations"
        

        } else {
            Write-Host "Aucun utilisateur selectionne. Operation annulee."
            return
        }
    }
}






# Menu principal
function Menu-Principal {
    $options = @("Gestion des utilisateurs","Gestion des Ordinateurs","Collecter des informations", "Quitter")
    while ($true) {        $choix = Afficher-Menu -Titre "Menu principal" -Options $options
        switch ($choix) {
            1 {
                Journaliser-Evenement "Navigation vers la gestion des utilisateurs"
                Gerer-Utilisateurs
            }
             2 {
                Journaliser-Evenement "Navigation vers la gestion des Ordinateurs"
                Gerer-Ordinateurs
            }
            3 {
                Journaliser-Evenement "Navigation vers Collecter des informations"
                Collecter-informations

            }

            4 {
                Journaliser-Evenement "********Fin du Script********"
                Write-Host "Au revoir !" -ForegroundColor Green
                Exit
            }
            Default {
                Write-Host "Selection non valide" -ForegroundColor Red
            }
        }
    }
}

# Executer le menu principal
Menu-Principal
