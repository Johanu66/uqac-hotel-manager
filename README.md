# A. Motivation, concept

Union de "development" et "operations", DevOps est un ensemble de pratiques qui met l’accent sur la collaboration et la communication entre les développeurs et les équipes d'exploitation, en automatisant le processus de livraison de logiciels et les changements d’infrastructure. 
DevOps vise à créer un environnement dans lesquels la conception, les tests et la diffusion de logiciels peuvent être réalisés rapidement, fréquemment et efficacement. 

Historiquement, les équipes de développement (Dev) et d’exploitation (Ops) travaillaient de manière séparée :
- Les développeurs créaient les applications
- Les opérateurs s'occupaient de la mise en production et la maintenance des systèmes.

Ce cloisonnement peut entrainer des conflits d’objectifs, une mauvaise communication, des délais de livraison importants et une baisse de qualité. C'est pour répondre à ces problèmes que la démarche DevOps est née.


# B. Caractéristiques innovantes et étapes de DevOps

## Caractéristiques innovantes

Voici certaines caractéristiques innovantes de la démarche DevOps : 

- Équipe intégrée : Les développeurs ne sont plus séparés des opérationnels. Ils sont tous intégrés dans une seule équipe de développement et d’opérations.

- Intégration continue : L’intégration continue, ou CI, et la pratique de développement qui oblige les développeurs à intégrer du code dans un dépôt partagé plusieurs fois par jour. Chaque vérification ou branche est ensuite vérifiée par une compilation automatisée, ce qui permet aux équipes de détecter les problèmes dès le début, garantissant ainsi que la branche de code principale est toujours viable et prête pour la production. Cela garantit la détection rapide des erreurs.

- Livraison continue : La livraison continue, ou CD, est le fait que chaque modification validée est prête à être déployée automatiquement en production après validation. Cela réduit considérablement les risques de déploiement.

- Automatisation complète du pipelin: Toutes les étapes sont automatisées via des outils comme GitLab CI/CD, Ansible, Docker, ou Kubernetes par exemple.

- Infrastructure as Code (IaC) : L’infrastructure (serveurs, réseaux, configurations) est décrite sous forme de code (Terraform par exemple). Cela rend l’environnement reproductible et versionné.

## Etapes

Voici le cycle de vie DevOps : 
- Plan : définir les exigences, les fonctionnalités, la planification. (outils : Jira...).
- Code : écrire le code et le versionner (outils : Git, GitHub, GitLab).
- Build : compiler, tester le code source (outils : Maven, Gradle...).
- Test : exécuter les tests unitaires, d’intégration et automatisés (outils : JUnit...).
- Release : préparer la mise en production (outils : Jenkins...).
- Deploy : déployer automatiquement sur les serveurs ou conteneurs (outils : Docker, Kubernetes).
- Operate : surveiller la performance, la disponibilité (outils : Grafana...).
- Monitor : collecter des métriques, logs, retours utilisateurs.

<img width="1982" height="1020" alt="7602 1513404277" src="https://github.com/user-attachments/assets/95824d36-d828-47f2-98d0-b06ad2de27b8" />


# C. Application pratique des étapes DevOps : Système de gestion d'hôtel

Dans le cadre de ce projet, nous avons développé une application de gestion d'hôtel en appliquant rigoureusement toutes les étapes de la méthodologie DevOps. Voici comment chaque phase a été mise en œuvre :

## 1. Plan - Planification et conception

**Objectif** : Définir les exigences fonctionnelles et techniques de l'application de gestion d'hôtel.

**Réalisations** :
- Analyse des besoins : gestion des chambres, réservations, types de chambres
- Conception de l'architecture : application Rails 8 avec ActiveAdmin pour l'interface d'administration
- Choix technologiques : Ruby on Rails, MySQL/SQLite, ActiveAdmin, Devise pour l'authentification
- Planification des fonctionnalités : CRUD complet pour chambres, réservations, et types de chambres

## 2. Code - Développement et versioning

**Objectif** : Écrire le code source et le versionner efficacement.

**Réalisations** :
- **Repository Git** : Création du repository GitHub `uqac-hotel-manager`
- **Structure MVC** : Modèles (Chambre, Reservation, TypeChambre, User), Contrôleurs, Vues
- **ActiveAdmin** : Interface d'administration complète pour la gestion des entités
- **Authentification** : Intégration de Devise pour la gestion des utilisateurs
- **Base de données** : Migrations pour créer les tables et relations
- **Code source** : Développement en Ruby on Rails 8.0.3 avec les bonnes pratiques

**Résultats** :
  <img width="1687" height="960" alt="Screenshot from 2025-10-07 14-42-46" src="https://github.com/user-attachments/assets/d4de585d-820e-4933-a2fb-b092e9a5f057" />
  <img width="1958" height="992" alt="Screenshot from 2025-10-07 14-43-22" src="https://github.com/user-attachments/assets/c64683db-0c80-4bc2-9fe9-ce3388efd2af" />
  <img width="1978" height="985" alt="Screenshot from 2025-10-07 14-43-54" src="https://github.com/user-attachments/assets/213075d6-a561-4d97-af01-834950801ffc" />
  <img width="1978" height="985" alt="Screenshot from 2025-10-07 14-44-09" src="https://github.com/user-attachments/assets/8cb45cbc-ee7c-493a-8c2b-115382be528f" />
  <img width="1978" height="985" alt="Screenshot from 2025-10-07 14-44-22" src="https://github.com/user-attachments/assets/4d029437-9504-4eac-a81b-f00aa269af5f" />
  <img width="1978" height="985" alt="Screenshot from 2025-10-07 14-44-50" src="https://github.com/user-attachments/assets/d1f4e6ee-21a4-4e6c-aec4-0fc20a663c71" />





## 3. Build - Compilation et construction

**Objectif** : Compiler et empaqueter l'application pour le déploiement.

**Réalisations** :
- **Dockerfile** : Containerisation de l'application avec image Ruby 3.4.6
- **Gemfile** : Gestion des dépendances Ruby (Rails, ActiveAdmin, Devise, etc.)
- **Assets pipeline** : Précompilation automatique des assets CSS/JS
- **Build automatisé** : GitHub Actions compile l'image Docker à chaque push
- **Registry Docker** : Publication automatique sur Docker Hub (`johanu66/hotel_manager`)

## 4. Test - Tests automatisés

**Objectif** : Garantir la qualité du code par des tests exhaustifs.

**Réalisations** :
- **Tests unitaires** (12 tests) : Validation des modèles (AdminUser, Chambre, Reservation, TypeChambre)
- **Tests d'intégration** (9 tests) : Vérification des routes et configurations ActiveAdmin
- **Tests système** (6 tests) : Tests end-to-end avec Capybara pour l'interface utilisateur
- **Total** : 27 tests automatisés couvrant toutes les fonctionnalités
- **CI/CD** : Exécution automatique des tests dans GitHub Actions avec base MySQL

<img width="1114" height="717" alt="Screenshot from 2025-10-07 02-56-13" src="https://github.com/user-attachments/assets/685ad288-b2b8-4e00-9415-79ca746a2803" />


## 5. Release - Préparation à la production

**Objectif** : Préparer et valider la version pour la mise en production.

**Réalisations** :
- **Pipeline CI** : 4 jobs automatisés (scan_ruby, scan_js, lint, test)
- **Analyse sécurité** : Brakeman pour Rails, audit des dépendances JavaScript
- **Linting** : RuboCop pour maintenir la qualité du code
- **Validation** : Tous les tests doivent passer avant le déploiement
- **Versioning** : Tags Git automatiques pour chaque release

### **ARCHITECTURE DEVOPS IMPLÉMENTÉE**

```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│   DÉVELOPPEUR   │───▶│  GITHUB ACTIONS  │───▶│   AWS EC2 PROD  │
│                 │    │                  │    │                 │
│ ▪ Code Rails 8  │    │ ▪ Tests (27)     │    │ ▪ Docker        │
│ ▪ Tests ActiveAdmin  │ ▪ Sécurité       │    │ ▪ Kamal         │
│ ▪ Git push      │    │ ▪ Linting        │    │ ▪ MySQL        │
│                 │    │ ▪ Déploiement    │    │ ▪ ActiveAdmin   │
└─────────────────┘    └──────────────────┘    └─────────────────┘
```


## 6. Deploy - Déploiement automatisé

**Objectif** : Déployer automatiquement l'application sur l'infrastructure cloud.

**Réalisations** :
- **Infrastructure** : Instance AWS EC2 (Ubuntu 24.04, t3.micro)
- **Kamal** : Outil de déploiement moderne remplaçant Capistrano
- **Docker** : Déploiement containerisé avec orchestration automatique
- **Proxy** : Kamal-proxy pour la gestion du trafic HTTP
- **Base de données** : Mysal en production pour simplifier le déploiement
- **Déploiement automatique** : Trigger sur push vers branche `deploy`

**Configuration Infrastructure as Code** :
```yaml
# config/deploy.yml
service: hotel_manager
image: johanu66/hotel_manager
servers:
  web: [15.223.68.69]
registry:
  username: johanu66
  password: [KAMAL_REGISTRY_PASSWORD]
```
<img width="1114" height="717" alt="Screenshot from 2025-10-07 11-47-36" src="https://github.com/user-attachments/assets/80c8aadf-b062-4cda-960b-73c2987613de" />



## 7. Operate - Exploitation et surveillance

**Objectif** : Maintenir l'application en fonctionnement optimal.

**Réalisations** :
- **Monitoring conteneurs** : Surveillance Docker via Kamal
- **Logs centralisés** : Collecte des logs applicatifs et proxy
- **Health checks** : Vérification automatique de l'état de l'application
- **Restart policies** : Redémarrage automatique en cas de panne
- **Backup automatique** : Volumes persistants pour les données MySQL

## 8. Monitor - Surveillance et métriques

**Objectif** : Collecter des métriques et surveiller les performances.

**Réalisations** :
- **Logs applicatifs** : Rails logs avec niveau de détail configuré
- **Métriques proxy** : Kamal-proxy logs avec détails des requêtes
- **GitHub Actions** : Historique des déploiements et temps d'exécution
- **Alertes** : Notifications automatiques en cas d'échec de déploiement
- **Performance** : Monitoring des temps de réponse et codes d'état HTTP

## Outils et technologies utilisés

**Développement** :
- Ruby on Rails 8.0.3, ActiveAdmin 3.3.0, Devise
- Git, GitHub pour le versioning

**CI/CD** :
- GitHub Actions pour l'intégration continue
- Brakeman (sécurité), RuboCop (qualité), Capybara (tests système)

**Déploiement** :
- Docker pour la containerisation
- Kamal pour l'orchestration de déploiement
- AWS EC2 pour l'infrastructure cloud
- Docker Hub comme registry d'images

**Surveillance** :
- Docker logs, Kamal monitoring
- GitHub Actions pour le suivi des déploiements

## Résultats obtenus

- **Application fonctionnelle** : Système complet de gestion d'hôtel avec interface d'administration
- **Déploiement automatisé** : Pipeline DevOps de bout en bout
- **Qualité assurée** : 27 tests automatisés, analyse de sécurité
- **Infrastructure reproductible** : Configuration as Code avec Kamal
- **Temps de déploiement** : Moins de 10 minutes de commit à production
- **Accès public** : Application déployée sur http://uqac-hotel-manager.randever.com/admin
  Si votre navigateur redirige automatiquement vers le HTTPS et que cela ne fonctionne pas, essayez d’utiliser le HTTP. (C’est une contrainte liée à la version gratuite des ressources utilisées pour le deploiement)

### 🌐 **ACCÈS APPLICATION**
- **URL Production** : http://uqac-hotel-manager.randever.com/admin
- **Identifiants Manager** : (Acces total)
  - Email: `manager@hotel.com`
  - Mot de passe: `password`
- **Identifiants Receptionist** : (Acces plus restraints)
  - Email: `receptionist@hotel.com`
  - Mot de passe: `password`


# D. Avantages et inconvénients

## Avantages

- Livraison rapide : Mises à jour fréquentes des produits.
- Amélioration continue	: Retours d'expériences intégrés au cycle de développement.
- Réduction des erreurs humaines grâce à l’automatisation.
- Collaboration améliorée : Meilleure communication entre les équipes Dev et Ops.
- Meilleure qualité logicielle : Tests continus, supervision...
- Flexibilité et scalabilité : Environnements reproductibles.

## Inconvénients

- Mise en œuvre difficile : Nécessite des compétences techniques avancées et une réorganisation interne.
- Coût initial élevé : Formation, outils, et automatisation représentent un investissement.
- Résistance au changement : Certaines équipes peuvent avoir du mal à adopter la culture DevOps.

## Conclusion

La méthode DevOps est un changement majeur dans la façon dont on développe des logiciels.
Elle rapproche les équipes de développement et d’exploitation, favorise la communication, l’automatisation et l’amélioration continue.
En adoptant DevOps, les entreprises peuvent accélérer la livraison de leurs produits, réduire les coûts et améliorer la satisfaction client.


# Références

https://unity.com/fr/topics/devops-lifecycle
https://eleven-labs.com/blog/mise-en-place-devops/
https://www.qrpinternational.fr/blog/gestion-des-services-informatiques/integration-continue-et-deploiement-continu-ci-cd-dans-devops/
https://azure.microsoft.com/fr-ca/resources/cloud-computing-dictionary/what-is-devops
https://www.atlassian.com/fr/devops/what-is-devops/how-to-start-devops
https://www.alter-solutions.fr/blog/etapes-devops
