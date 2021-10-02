# Devoir GSSI 

## Introduction

Voici le repository du projet VPN du cours GSSI. Ce projet n'est pas à utiliser en production : aucun credentials n'est généré à aucun endroit et la quasi-totalité des variables est laissée par défaut.

## Sommaire

- [Construitre l'image](#construire-limage)
- [Initialisation](#initialisation)
- [Démarrer le serveur](#d%C3%A9marrer-le-serveur)
- [Ajouter un utilisateur](#ajouter-un-utilisateur)
- [Supprimer un utilisateur](#supprimer-un-utilisateur)

## Construire l'image

```Bash
docker build --tag=openvpn_gssi .
```

## Initialisation

```Bash
docker volume create --name openvpn_data
docker run -v openvpn_data:/etc/openvpn --rm openvpn_gssi gen_pki
```

## Démarrer le serveur

:warning: Si c'est la première utilisation du serveur sur ce volume Docker, la procédure d'initialisation sera faite par défaut :warning:

```Bash
docker run -v openvpn_data:/etc/openvpn --cap-add=NET_ADMIN --device=/dev/net/tun -p 1194:1194/udp -it --rm -d openvpn_gssi
```

## Ajouter un utilisateur

:warning: Pour l'instant ne gère pas le cas où l'utilisateur est déjà existant. Par ailleurs, le script ne génère pas de .ovpn valide ou quoique ce soit (pour le moment) :warning:

```Bash
docker run -v openvpn_data:/etc/openvpn --rm openvpn_gssi add_user $USER_NAME
```

## Supprimer un utilisateur

// TODO
