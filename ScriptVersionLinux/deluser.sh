#!/bin/bash


# Suppression compte Utilisateur

id=$(cut -f1 -d: /etc/passwd | grep -o 'Utilisateur_[0-9]')

echo "$id"

sudo userdel -r $id

exit 0

