#!/bin/bash

HOSTNAME=$(hostname -s)		#Recupération du nom de notre Hostname en version courte -s
REP=$HOSTNAME				#Notre répertoire portera le nom du hostname dans la variable REP
mkdir -p $REP				#Création du dossier // les informations collectées seront stockées dans ce dossier

#Liste des commandes pour récupérer les informations:

lstopo --if svg $REP/$HOSTNAME.svg	#Topologie du système en format image SVG (Scalable Vector Graphics) sans perte de qualité.
cat /proc/cpuinfo > $REP/cpuinfo	#Informations sur le processeur
lscpu > $REP/lscpu					#Architecture du processeur
cat /proc/meminfo > $REP/meminfo	#Mémoire libre & utilisée
cat /proc/version > $REP/version	#Version du Linux
lsb_release -a > $REP/os			#Système d'exploitation
lsblk -a > $REP/lsblk				#Liste caractéristique des disques et de leurs partitions
df -h > $REP/diskinfo				#Disque usage
ip a > $REP/ipconfig				#Interfaces ethernet
netstat -rn > $REP/routetable		#Table de routage
ip -s -h -a link > $REP/paquets		#Paquets envoyés & reçus
lsof > $REP/ports					#Liste des fichiers ouverts
lspci -nn > $REP/lspci				#Informations détaillées sur les périphériques du bus PCI

#Toutes les informations seront stockées dans VAR et affichées sur info.html
VAR=info.html

#Message d'annonce dans le terminal
echo Ecriture en html dans info.html et le repertoire $REP

#CGI BASH
#>$VAR Création d'une nouvelle ligne
#>>$VAR Ajout par la suite
echo "<table>" > $VAR

echo "<tr>" >> $VAR
echo "<th colspan=\"1\"><p style='font-weight:bold;color:black;font-size:30px;text-shadow:1px 0 0 DBFEFF'>Information sur la machine $HOSTNAME</p></th>" >> $VAR
echo "</tr>" >> $VAR

echo "<tr>" >> $VAR
echo "<td><p style='font-family: sans-serif; color: blue;
    width: auto;
	padding: auto;
	text-align: center;
	border-radius: 2px'><a href=\"$REP/$HOSTNAME.svg\"><img src=\"$REP/$HOSTNAME.svg\" width=500></img></p></td>" >> $VAR
echo "</a></td>" >> $VAR
echo "</tr>" >> $VAR

echo "<tr>" >> $VAR
echo "<td><p style='font-family: sans-serif; color: blue;
	border: 2px solid blue;
	width: auto;
	padding: auto;
	text-align: center;
	background-color: DBFEFF;
	border-radius: 2px'><a href=\"$REP/version\">Version du Linux</p></td>" >> $VAR
echo "</a></p></td>" >> $VAR
echo "</tr>" >> $VAR

echo "<tr>" >> $VAR
echo "<td><p style='font-family: sans-serif; color: blue;
	border: 2px solid blue;
	width: auto;
	padding: auto;
	text-align: center;
	background-color: DBFEFF;
	border-radius: 2px'><a href=\"$REP/os\">Système d'exploitation</p></td>" >> $VAR
echo "</a></p></td>" >> $VAR
echo "</tr>" >> $VAR

echo "<tr>" >> $VAR
echo "<td><p style='font-family: sans-serif; color: blue;
	border: 2px solid blue;
	width: auto;
	padding: auto;
	text-align: center;
	background-color: DBFEFF;
	border-radius: 2px'><a href=\"$REP/cpuinfo\">Informations sur le processeur</p></td>" >> $VAR
echo "</a></td>" >> $VAR
echo "</tr>" >> $VAR

echo "<tr>" >> $VAR
echo "<td colspan=\"2\"><p style='font-family: sans-serif; color: blue;
	border: 2px solid blue;
	width: auto;
	padding: auto;
	text-align: center;
	background-color: DBFEFF;
	border-radius: 2px'><a href=\"$REP/lscpu\">Architecture du processeur</p></td>" >> $VAR
echo "</a></p></td>" >> $VAR
echo "</tr>" >> $VAR

echo "<tr>" >> $VAR
echo "<td><p style='font-family: sans-serif; color: blue;
	border: 2px solid blue;
	width: auto;
	padding: auto;
	text-align: center;
	background-color: DBFEFF;
	border-radius: 2px'><a href=\"$REP/meminfo\">Mémoire libre & utilisée</p></td>" >> $VAR
echo "</a></p></td>" >> $VAR
echo "</tr>" >> $VAR

echo "<tr>" >> $VAR
echo "<td colspan=\"2\"><p style='font-family: sans-serif; color: blue;
	border: 2px solid blue;
	width: auto;
	padding: auto;
	text-align: center;
	background-color: DBFEFF;
	border-radius: 2px'><a href=\"$REP/lspci\">Informations détaillées sur les périphériques du bus PCI</p></td>" >> $VAR
echo "</a></p></td>" >> $VAR
echo "</tr>" >> $VAR

echo "<tr>" >> $VAR
echo "<td colspan=\"2\"><p style='font-family: sans-serif; color: blue;
	border: 2px solid blue;
	width: auto;
	padding: auto;
	text-align: center;
	background-color: DBFEFF;
	border-radius: 2px'><a href=\"$REP/lsblk\">Liste caractéristique des disques et de leurs partitions</p></td>" >> $VAR
echo "</a></p></td>" >> $VAR
echo "</tr>" >> $VAR

echo "<tr>" >> $VAR
echo "<td colspan=\"2\"><p style='font-family: sans-serif; color: blue;
	border: 2px solid blue;
	width: auto;
	padding: auto;
	text-align: center;
	background-color: DBFEFF;
	border-radius: 2px'><a href=\"$REP/diskinfo\">Disque usage</p></td>" >> $VAR
echo "</a></p></td>" >> $VAR
echo "</tr>" >> $VAR

echo "<tr>" >> $VAR
echo "<td><p style='font-family: sans-serif; color: blue;
	border: 2px solid blue;
	width: auto;
	padding: auto;
	text-align: center;
	background-color: DBFEFF;
	border-radius: 2px'><a href=\"$REP/ipconfig\">Interfaces ethernet</p></td>" >> $VAR
echo "</a></p></td>" >> $VAR
echo "</tr>" >> $VAR

echo "<tr>" >> $VAR
echo "<td><p style='font-family: sans-serif; color: blue;
	border: 2px solid blue;
	width: auto;
	padding: auto;
	text-align: center;
	background-color: DBFEFF;
	border-radius: 2px'><a href=\"$REP/routetable\">Table de routage</p></td>" >> $VAR
echo "</a></p></td>" >> $VAR
echo "</tr>" >> $VAR

echo "<tr>" >> $VAR
echo "<td><p style='font-family: sans-serif; color: blue;
	border: 2px solid blue;
	width: auto;
	padding: auto;
	text-align: center;
	background-color: DBFEFF;
	border-radius: 2px'><a href=\"$REP/paquets\">Paquets envoyés & reçus</p></td>" >> $VAR
echo "</a></p></td>" >> $VAR
echo "</tr>" >> $VAR

echo "<tr>" >> $VAR
echo "<td><p style='font-family: sans-serif; color: blue;
	border: 2px solid blue;
	width: auto;
	padding: auto;
	text-align: center;
	background-color: DBFEFF;
	border-radius: 2px'><a href=\"$REP/ports\">Liste des fichiers ouverts</p></td>" >> $VAR
echo "</a></p></td>" >> $VAR
echo "</tr>" >> $VAR

echo "</table>" >> $VAR
