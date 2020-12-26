#!/bin/bash

#Création Utilisateur avec nom de session et mot de passe aléatoire

mdp=$(openssl rand -hex 2)
pass=$(perl -e 'print crypt($ARGV[0], "password")' $mdp)
id=Utilisateur_$((RANDOM%10))
sudo useradd -m -p $pass $id --create-home
echo "$id"
echo "$mdp"

exit 0


