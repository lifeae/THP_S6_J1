# The Eventbrite Project

[![forthebadge](https://forthebadge.com/images/badges/made-with-ruby.svg)![forthebadge](http://forthebadge.com/images/badges/built-with-love.svg)](http://forthebadge.com)

## Salut à toi Correcteur !

J'ai une bonne nouvelle pour toi ! La correction devrait aller vite ! ;)

Je suis méga à la bourre sur le programme parce que je galère grave.
Mais j'avance tous les jours et suis toujours chaud ! :muscle:

Tu as sous les yeux le travail que l'on devait rendre hier.
J'imagine que le nom du repo t'avait déjà mit la puce à l'oreille. :wink:

Et je n'ai réussi qu'à aller au `'2.2.4. Construction de la base de données'` là je dois pusher l'application sur Heroku.
Le push sur Heroku fonctionne mais j'ai un gros stop :

`The page you were looking for doesn't exist.
You may have mistyped the address or the page may have moved.
If you are the application owner check the logs for more information.`

J'ai appliqué quelques trucs que j'ai vu sur StackOverflow pour régler le problème, je sais pas d'où vient le problème, je pensais que ça venait du config/routes.rb qui ne propose aucune route (même pas le root) et donc que c'est normal qu'il n'affiche même pas une view.
Mais quand on lance une app Rails normalement on a ça quoi qu'il arrive non !?

![Yay! You're on Rails!](https://cloud.google.com/ruby/images/new-rails-app-screenshot.png "Yay! You're on Rails!")

Donc je sais pas d'où vient encore le problème et il se fait tard. Je vais sacrifier un joker pour aller me coucher et éviter que je sois une larve pour le reste de la semaine !

A demain matin ! :fire:


## Comment faire fonctionner ce bin's :
* Place toi avec ton terminal dans un dossier qui va bien.
* `git clone git@github.com:lifeae/THP_S6_J1.git`
* `cd THP_S6_J1`
* Vérifie dans le gemfile que tu possède déjà la version de ruby et de toutes ses gems dont on va avoir besoin. Si certaines te manquent, tu les installes.
* `bundle install`,
* `rails db:migrate`
* `rails db:seed`
* `rails server`
* Ouvre l'application sur ton serveur local : http://localhost:3000
* Lien Heroku : https://lifeae-eventbrite.herokuapp.com/

# Consignes

Projet : Eventbrite : introduction et backend

1. Introduction

Cette semaine tu vas faire un projet fil rouge qui t'accompagnera tout du long. À la fin tu auras une application fonctionnelle en production, que tu pourras utiliser. L'application sera une sorte d'Eventbrite appliqué à ta ville : les utilisateurs pourront créer des événements, fixer un prix, mettre en ligne une photo de profil, puis les visiteurs de l'application pourront rejoindre les événements en payant le prix. Bien entendu, il y aura une gestion d'utilisateurs avec login / logout, et on a même prévu une interface administrateur pour valider les événements de l'application.
2. Le projet
2.1. Les Spécifications du projet

L'application sera une version minimaliste (mais fonctionnelle, c'est le plus important) d'Eventbrite, un site qui propose plein d'événements que tu peux rejoindre. Les événements ne concernent qu'une seule ville, la ville où tu te trouves. Voici ce que tu peux faire :

    En arrivant sur la page d'accueil, un visiteur a accès aux événements. Un header donne un lien d'accès aux pages importantes : accueil, créer un événement, s'inscrire / se connecter, mon profil
    Il est possible de s'inscrire sur le site avec une adresse email
    Une personne inscrite sur le site peut proposer un événement. Il renseignera le titre, une description, une date de début, une durée, un prix
    Sur la page qui affiche les événements, tu verras les infos de l'événement (description, date, durée, prix, nombre de participants)
    Une personne connectée peut rejoindre un événement. Elle va cliquer sur un lien pour accéder à un formulaire d'inscription à un événement. Sur ce formulaire on donnera son prénom, nom, et on mettra son numéro de carte bleue pour payer l'événement
    Une personne qui a créé un événement peut accéder à une page qui affiche la liste des invités. À partir de cette page, ils peuvent accéder à une page pour éditer l'événement, voir avoir le bouton pour le supprimer
    Chaque utilisateur aura une page profil, avec ses informations de base (prénom, nom, description). Si un utilisateur est sur sa page profil, il a accès à deux liens : un pour éditer ses informations primordiales (email, mot de passe) avec le bouton pour supprimer son compte, l'autre pour éditer les informations de profil telles que le prénom, le nom, ou la description
    Actions impossibles à faire si la personne n'est pas connectée : rejoindre un événement, créer un événement, accéder à la page "mon profil"

Nous verrons jeudi et vendredi comment ajouter une photo de profil aux événements et aux utilisateurs, ainsi qu'une interface administrateur pour valider ou pas les événements proposés par les utilisateurs. En gros c'est juste un scaffold dans un scaffold. Mais si tu sais bien les implémenter, tu auras un site fonctionnel et prêt à l'utilisation. Tu seras prêt à concurrencer OnVaSortir !
2.2. Agenda de la semaine

Voici ce que nous attendrons de toi cette semaine :

    Lundi : avant de faire les champions des views, tu vas créer la base de données. Ensuite tu vas brancher un mailer pour avoir un système d'emails fonctionnel en production
    Mardi : nous allons mettre en place un système de gestion d'utilisateurs avec Devise (sessions, logins, inscription, etc), puis tu vas faire les premières views du site. En gros, tu feras en une journée ce que tu as mis une semaine à faire lors de The Gossip Project. Quel champion !
    Mercredi : tu vas rendre l'inscription à un événement possible, de plus, nous allons te montrer comment brancher une API avec le système de paiement de Stripe.
    Jeudi : tu vas mettre un peu de front en voyant l'Asset Pipeline, puis nous allons te montrer comment faire des uploads de photo avec Active Storage.
    Vendredi : pour finir cette semaine en beauté, tu mettras en place une interface administrateur où les administrateurs du site pourront faire des choses d'administrateur. Héhé.

2.2. Aujourd'hui : une base de données bien faite

Pour cette base de données, nous voyons trois models :

    Un model User, qui représente les utilisateurs de notre site
    Un model Event, qui représente les événements de notre site
    Un model Attendance, qui représente la participation à un événement. C'est la table de jointure entre les événements et les participants à un événement (un peu comme les rendez-vous entre les docteurs et les patients)

Pas besoin de plus. On va te présenter chaque model : pour le moment, lis et ne code rien.
2.2.1. Les utilisateurs

Un utilisateur aura comme attributs :

    Un email, qui est un string (géré par la gem d'authentification que l'on verra demain)
    Un encrypted_password, qui est un string(géré par la gem d'authentification que l'on verra demain)
    Une description, qui est un text
    Un first_name, qui est un string
    Un last_name, qui est un string

Un utilisateur peut participer à plusieurs événements au travers des participations. Un utilisateur peut administrer plusieurs événements.

Demain nous allons voir Devise, une gem d'authentification très puissante. En théorie on ajoute les utilisateurs en base via Devise. Cependant, comme la journée est déjà bien chargée, nous préférons consacrer Devise à la journée de demain. Tout ce qui est email et encrypted_password sera donc géré demain. Nous allons donc te donner pour cet exercice la façon dont il faut ajout ces deux attributs :

t.string :email,              null: false, default: ""
t.string :encrypted_password, null: false, default: ""

Voilà, mets-les dans le fichier de migration qui va créer l'utilisateur, et le branchement de Devise se passera bien demain. Et ton cerveau n'explosera pas avec une journée triple qui t'attend demain.
2.2.2. Les événements

Les événements ont plusieurs attributs :

    Une start_date, qui est un datetime.
    Validations : sa présence est obligatoire, et il est impossible de créer ou modifier un événement dans le passé.
    Une duration, qui est un integer représentant le nombre de minutes que cet événement va durer.
    Validations : Sa présence est obligatoire et le nombre de minutes doit être un multiple de 5, et est strictement positif
    Un title qui est un string.
    Validations : Sa présence est obligatoire et doit faire au moins 5 caractères et maxi 140 caractères.
    Une description qui est un text.
    Validations : Sa présence est obligatoire et la description doit faire entre 20 et 1000 caractères.
    Un price qui est un integer. Ce price correspond au nombre d'euros que coûte l'événement.
    Validations : Sa présence est obligatoire et cet integer doit être compris entre 1 et 1000. (pas d'événement gratuit pour cette première version de l'application)
    Une location, qui est un string.
    Validations : Sa présence est obligatoire

Un événement a plusieurs participations, et plusieurs participants (utilisateurs) au travers des participations. Un événement appartient à un administrateur (utilisateur).
2.2.3. Les participations

Les participations ont un seul attribut :

    Une stripe_customer_id, qui est un string et qui est l'identifiant unique donné par Stripe au payeur (pratique pour aller chercher ses informations).

Une participation appartient à un utilisateur, et un événement.
2.2.4. Construction de la base de données

Maintenant que tu as toutes ces informations, créé une nouvelle app Rails et construis la base de données. Tu dois faire :

    Les trois models, avec leurs attributs
    Les validations
    Un petit seed de quelques utilisateurs ayant des adresses @yopmail.com

Pousse le tout sur Heroku. C'est toujours une bonne pratique de pousser très vite ton app avant qu'elle devienne ton complexe (et donc qu'elle génère de nombreux bugs).

Pense à la pousser souvent afin de rapidement détecter tout bug de push : c'est plus simple de débugger quand on a en tête les derniers changements effectués entre le moment où ça marchait et le moment où ça ne marche plus.
2.3. Le mailer

Maintenant nous allons ajouter plusieurs mailers dans l'application. Ces e-mails doivent marcher en production (via Heroku, c'est à dire qu'ils doivent bien envoyer l'e-mail comme convenu.
2.2.1. Un e-mail à la création d'utilisateur

Quand un utilisateur est créé, envoie-lui un e-mail de bienvenue (indice : utiliser after_create)

Mets tranquillement en place tout ton mailer comme expliqué dans la ressource puis fait le test en local sur ton ordinateur : après le seed ou si tu créés un nouvel utilisateur depuis la console, il faut qu'un e-mail de bienvenue soit envoyé !

Ensuite fait de même via Heroku (tu peux lancer la console sur ton app Heroku avec $ heroku run rails console).
2.2.2. Un e-mail quand quelqu'un participe à l'événement

Quand un participant participe à un événement, envoie un e-mail au créateur de l'événement (indice : after_create à nouveau).

Concrètement cela veut dire que dès qu'une Attendance est créée, l'utilisateur reçoit un e-mail. Fait le test en local en créant une participation via la console. Idem sur Heroku
3. Rendu attendu

Une application avec le backend fonctionnel et le mailer qui marche en production (= sur Heroku).
