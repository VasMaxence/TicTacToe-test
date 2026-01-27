# Documentation Technique - TicTacToe Test

Ce document explique le fonctionnement technique de l'application TicTacToe Test, son architecture, et ses choix technologiques.

## Environnement

L'application est développée avec Flutter et utilise les flavors pour gérer les différents environnements (dev, staging, prod).

## Architecture Globale

L'application suit les principes de la **Clean Architecture**, organisée en couches pour assurer la maintenabilité et la testabilité :

1.  **Domain (Domaine)** : Contient les entités métier, les interfaces de repository et les cas d'utilisation (use cases). C'est le cœur de l'application, indépendant des frameworks.
2.  **Data (Données)** : Implémente les repositories, définit les modèles de données (modèles Hive) et gère les sources de données (datasources).
3.  **Presentation (Présentation)** : Contient les écrans (screens), les widgets et les contrôleurs d'état (StateNotifiers, Providers).

### ❓ Pourquoi cette architecture ?

Même pour un projet de taille réduite, le choix de la Clean Architecture garantit une base solide et évolutive :

- **Testabilité** : La logique métier est isolée.
- **Découplage** : Les couches sont indépendantes ; par exemple, le passage de Hive à une autre solution de stockage n'impacte pas le cœur de l'application.
- **Maintenabilité** : La structure facilite la localisation des bugs et l'ajout de fonctionnalités futures sans régression.
- **Standardisation** : Elle impose une rigueur de développement qui simplifie la compréhension du code pour tout nouveau développeur.

## Gestion d'État (State Management)

L'application utilise **Riverpod 3** pour la gestion d'état :

- **Providers** : Utilisés pour exposer les use cases et les repositories de manière immuable.
- **StateNotifierProvider** : Utilisé pour le `GameController` afin de gérer la logique complexe du jeu.
- **FutureProvider** : Utilisé pour les opérations asynchrones, comme le chargement de l'historique (`scoreHistoryProvider`). L'utilisation de `.autoDispose` garantit la fraîcheur des données à chaque navigation.

### ❓ Pourquoi Riverpod 3 ?

- **Réduction du Boilerplate** : Contrairement à BLoC, Riverpod ne nécessite pas la création systématique de classes d'événements et d'états complexes pour chaque interaction, ce qui rend le code plus concis, lisible et accélère le développement de la solution.

- **Sécurité au Runtime** : Riverpod élimine les erreurs courantes liées au `BuildContext` en rendant les providers accessibles de manière globale.

- **Gestion de l'Asynchronisme** : Avec `FutureProvider` et `StreamProvider`, la gestion des états de chargement et d'erreur est intégrée nativement, simplifiant la récupération des données (ex: historique des scores).

- **Performance** : La possibilité de filtrer les reconstructions de widgets avec `.select()` permet une optimisation fine des performances sans effort supplémentaire.

## Stockage Local (Persistence)

**Hive CE** est utilisé pour le stockage local :

- Les scores sont persistés dans une "box" nommée `scores`.
- **Adaptateurs** : Des adaptateurs personnalisés (`ScoreModelAdapter`, `DifficultyAdapter`) sont générés via `build_runner` pour permettre à Hive de sérialiser les objets complexes.
- **Initialisation** : La base de données est initialisée au démarrage (`main.dart`) pour garantir que les boîtes sont ouvertes avant l'accès par les providers.

### ❓ Pourquoi Hive ?

- **Performance** : Hive est une base de données NoSQL très rapide dû à sa gestion asynchrones de l'écriture sur disque. Elle offre des performances quasi instantanées, et est donc invisible pour l'utilisateur.

- **Simplicité** : Contrairement à SQLite, Hive ne nécessite pas de schémas complexes ou de langage SQL. La manipulation des données se fait directement avec des objets Dart, ce qui réduit le code boilerplate.

- **Flexibilité** : Le système d'adaptateurs permet de stocker des objets métier complexes tout en conservant un typage.

## Navigation

La navigation est gérée par **AutoRoute** :

- Les routes sont définies dans `AppRouter`.
- La génération de code (`build_runner`) crée les classes de routes nécessaires (`HomeRoute`, `GameRoute`, `ScoreHistoryRoute`, `settingsRoute`).

### ❓ Pourquoi AutoRoute ?

- **Sécurité du Typage** : Contrairement à la navigation native ou `go_router`, AutoRoute génère des classes de routes spécifiques. Les paramètres sont passés via le constructeur de ces classes, ce qui permet de détecter les erreurs de paramètres manquants ou de mauvais types dès la compilation plutôt qu'au runtime.

- **Gestion des Paramètres** : L'extraction des arguments dans les pages de destination est automatique. Plus besoin de manipuler manuellement le `ModalRoute.of(context)`, ce qui rend le code plus propre et moins sujet aux erreurs.

- **Génération de Code** : En utilisant `build_runner`, la navigation devient synchronisée avec la structure du projet, réduisant considérablement le code "boilerplate" nécessaire pour enregistrer chaque écran.

## Fonctionnalités Clés

### Jeu (Game)

Le `GameController` orchestre le déroulement d'une partie. Il utilise le use case `PlayMove` pour valider chaque coup et détecte la fin de la partie (victoire ou nul). En fin de partie, il déclenche automatiquement la sauvegarde du score.

### Historique (Score History)

L'historique est chargé depuis Hive via une datasource locale. Le `scoreHistoryProvider` expose ces données à l'interface utilisateur. La page d'historique affiche les résultats (victoire/nul) avec des codes couleurs et des icônes pour une lecture rapide.

## Tests

L'application intègre une suite de tests complète :

- **Tests Unitaires** : Couvrent la logique du domaine (use cases) et les transformations de modèles.
- **Tests de Présentation** : Vérifient que le `GameController` déclenche les bonnes actions au bon moment (ex: sauvegarde du score).
- **Tests d'Intégration (Hive)** : Valident la lecture et l'écriture réelle dans une instance Hive temporaire pour garantir l'intégrité des données persistées.

Pour lancer les tests :

```bash
flutter test
```
