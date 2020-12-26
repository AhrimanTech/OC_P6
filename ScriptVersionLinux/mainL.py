#!/usr/bin/env python3
#coding: utf-8

import tkinter
import tkinter.scrolledtext
import webbrowser
import subprocess, sys
import os
from os import path 

#Fonction pour lancer le bash et récupérer les informations système
def info():
    dirname = os.path.dirname(os.path.abspath(__file__))
    cmd = os.path.join(dirname, 'infosys.sh')
    subprocess.call(cmd)

#Fonction ajout d'un utilisateur (Création de compte avec nom et mot de passe)
def ajouter():
    dirname = os.path.dirname(os.path.abspath(__file__))
    cmd = os.path.join(dirname, 'adduser.sh')
    subprocess.call(cmd)

#Fonction suppression du compte de l'utilisateur
def supprimer():
    dirname = os.path.dirname(os.path.abspath(__file__))
    cmd = os.path.join(dirname, 'deluser.sh')
    subprocess.call(cmd)

#Fonction pour afficher les informations 
def resultat():
    dirname = os.path.dirname(os.path.abspath(__file__))
    cmd = os.path.join(dirname, 'info.html')
    opener ="open" if sys.platform == "darwin" else "xdg-open"
    subprocess.call([opener, cmd])
    
#Fonction pour créer la fenêtre fille, à propos
def apropos():    
    about_window = tkinter.Toplevel(app)
    about_window.title("À propos")
    screen_x = (app.winfo_screenwidth())
    screnn_y = (app.winfo_screenheight())
    window_x = 170
    window_y = 80
    posX = (screen_x // 2) - (window_x // 2)
    posY = (screnn_y // 2) - (window_y // 2)
    geo = "{}x{}+{}+{}".format(window_x, window_y, posX, posY)
    about_window.resizable(width = False, height = False)
    about_window.geometry(geo)
    about_window.title("À propos")
    lb = tkinter.Label(about_window, text="François PARIZAD \n OpenClasserooms \n Projet 6", width = 20,)
    lb.grid()
    
#Fenêtre de l'application
app = tkinter.Tk()
app.configure(bg='black')
app.title("Module d'aide pour l'AIC")
screen_x = (app.winfo_screenwidth())
screnn_y = (app.winfo_screenheight())
window_x = 650
window_y = 200
posX = (screen_x // 2) - (window_x // 2)
posY = (screnn_y // 2) - (window_y // 2)
geo = "{}x{}+{}+{}".format(window_x, window_y, posX, posY)
app.resizable(width = False, height = False)
app.geometry(geo)

#Le label
label = tkinter.Label(app, text="       Bienvenue  ", bg="black", fg="yellow")
label.grid(sticky="w")

#barre de défilement vertical
text_area = tkinter.scrolledtext.ScrolledText(app, height = 10, width = '70', bg = "white", font = "Helvetica", fg = "black", relief = 'sunken') 
text_area.grid(column = 0, pady = 5, padx = 5) 

#Insertion de texte
text_area.insert(tkinter.INSERT, 
"""==============================
              AIDE
----------------------------------------------------------------------------------------------------------------------
Lors de la récupération des informations système, ces 12 éléments seront recueillies :
----------------------------------------------------------------------------------------------------------------------
1 - Version du Linux
2 - Système d'exploitation
3 - Informations détaillées sur le processeur
4 - Architecture du processeur
5 - Mémoire libre & utilisée
6 - Informations détaillées sur les périphériques du bus PCI
7 - Liste caractéristique des disques et de leurs partitions
8 - Disque usage
9 - Interface ethernet
10 - Table de routage
11 - Paquets envoyés & reçus
12 - Liste des fichiers ouverts
---------------------------------------------------------------------------------------------------------------------
Création & suppression de comptes :
---------------------------------------------------------------------------------------------------------------------
Création de l'utilisateur sous forme de utilisateur_'nombre aléatoire' et 
mot de passe aléatoire à 4 caractères. Le tout sera affiché dans la fenêtre du terminal. 
""") 

#Lecture de texte seulement 
text_area.configure(state ='disabled') 

#Création de menu
mainmenu = tkinter.Menu(app)

premier_menu = tkinter.Menu(mainmenu)
premier_menu.add_command(label="Récupérer les informations", command=info)
premier_menu.add_command(label="Afficher le résultat", command=resultat)

deuxieme_menu = tkinter.Menu(mainmenu)
deuxieme_menu.add_command(label="Création de l'utilisateur", command=ajouter)
deuxieme_menu.add_command(label="Suppression de l'utilisateur", command=supprimer)

troisieme_menu = tkinter.Menu(mainmenu)
troisieme_menu.add_command(label="À propos", command=apropos)

quatrieme_menu = tkinter.Menu(mainmenu)
quatrieme_menu.add_command(label="quitter", command=app.quit)

mainmenu.add_cascade(label="Données", menu=premier_menu)
mainmenu.add_cascade(label="Utilisateurs", menu=deuxieme_menu)
mainmenu.add_cascade(label="À propos", menu=troisieme_menu)
mainmenu.add_cascade(label="Quitter", menu=quatrieme_menu)

#Boucle principale
app.config(menu=mainmenu)
app.mainloop()
