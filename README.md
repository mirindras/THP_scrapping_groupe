
# Projet de groupe THP
​
[![NPM Version][npm-image]][npm-url]
[![Build Status][travis-image]][travis-url]
[![Downloads Stats][npm-downloads]][npm-url]
​
@axelletrt
@ambroiseau
@Arnaud-jn
@Nicolas G (Gervais)
@Stephane Mlv
@Victorian Roques
@PaulDIP
​
​
Le projet consiste en 3 parties :
​
1. Scrap de mails des maries des départements HAUTE-VIENNE, HAUTE-LOIRE et ILLE—ET-VILAINE.
2. Conception d’un programme d’emailing.
3. Création d’un bot Twitter afin de follow les comptes des mairies.
​
​
​
![](header.png)
​
## Installation
​
OS X & Linux:
​
```sh
bundle install
```

Pour faire tourner les programmes, lancer individuellement dans lib/app/ :
- townhalls_follower.rb	: follow twitter
- townhalls_mailer.rb : mass-mailing
- townhalls_scrapper.rb : récupère les emails de 3 départements

​
## Structure
​
├── .gitignore <br>
├── README.md <br>
├── Gemfile <br>
├── Gemfile.lock <br>
├── app.rb <br>
├── db <br>
│  └── townhalls.csv <br>
└── lib <br>
..  ├── app <br>
  │  ├── townhalls_scrapper.rb <br>
  │  ├── townhalls_mailer.rb <br>
  │  ├── townhalls_adder_to_db.rb <br>
  │  └── townhalls_follower.rb <br>
  └── views <br>
    ├── done.rb <br>
    └── index.rb <br>

## Gems

1. ’rubocop'
2. 'dotenv'
3. ‘pry'
4. 'nokogiri'
5. 'rubysl-open-uri', '~> 2.0'
6. 'json'
​
​
## Release History

* 0.2.1
  * ajout readme
* 0.2.0
  * ajout de follower.rb
* 0.1.1
  * ajout du mailer.rb
* 0.1.0
  * Ajout scrapper + Json de toutes les mairies (email, ville, département)
* 0.0.1
  * Initial
​
## Mail
​
Template de l’email envoyé :
​
		Subject: The Hacking Project x « mairie » 3 mois pour apprendre à coder
​
Bonjour,
Je m'appelle Igor, je suis élève à The Hacking Project, une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique. La pédagogie de notre école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous.
Déjà 500 personnes sont passées par The Hacking Project. Est-ce que la mairie de #{i["ville"]} veut changer le monde avec nous ?
Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80")
​
## Info
​
Nombre de villes touchées par le mailing : 
​
1. 260 dans la HAUTE-LOIRE
2. 352 dans l’ILLE-ET-VILAINE
3. 201 dans la HAUTE-VIENNE
​
​
Handle Twitter utilisé : « Fuck ».
