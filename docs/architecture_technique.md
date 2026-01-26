# Documentation Technique - TicTacToe Test

Ce document explique le fonctionnement technique de l'application TicTacToe Test, son architecture, et ses choix technologiques.

## Architecture Globale

L'application suit les principes de la **Clean Architecture**, organisée en couches pour assurer la maintenabilité et la testabilité :

1.  **Domain (Domaine)** : Contient les entités métier, les interfaces de repository et les cas d'utilisation (use cases). C'est le cœur de l'application, indépendant des frameworks.
2.  **Data (Données)** : Implémente les repositories, définit les modèles de données (modèles Hive) et gère les sources de données (datasources).
3.  **Presentation (Présentation)** : Contient les écrans (screens), les widgets et les contrôleurs d'état (StateNotifiers, Providers).

## Gestion d'État (State Management)

L'application utilise **Riverpod** pour la gestion d'état :

- **Providers** : Utilisés pour exposer les use cases et les repositories de manière immuable.
- **StateNotifierProvider** : Utilisé pour le `GameController` afin de gérer la logique complexe du jeu.
- **FutureProvider** : Utilisé pour les opérations asynchrones, comme le chargement de l'historique (`scoreHistoryProvider`). L'utilisation de `.autoDispose` garantit la fraîcheur des données à chaque navigation.

## Stockage Local (Persistence)

**Hive CE** est utilisé pour le stockage local :

- Les scores sont persistés dans une "box" nommée `scores`.
- **Adaptateurs** : Des adaptateurs personnalisés (`ScoreModelAdapter`, `DifficultyAdapter`) sont générés via `build_runner` pour permettre à Hive de sérialiser les objets complexes.
- **Initialisation** : La base de données est initialisée au démarrage (`main.dart`) pour garantir que les boîtes sont ouvertes avant l'accès par les providers.

## Navigation

La navigation est gérée par **AutoRoute** :

- Les routes sont définies dans `AppRouter`.
- La génération de code (`build_runner`) crée les classes de routes nécessaires (`HomeRoute`, `GameRoute`, `ScoreHistoryRoute`).

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
