# Documentation des Flavors

Ce projet utilise des **flavors** pour gérer différents environnements (Développement, Staging, Production). La configuration est automatisée à l'aide de l'outil `flutter_flavorizr`.

## Flavors Disponibles

Trois environnements sont configurés :

| Flavor      | Nom de l'application | Application ID (Android/iOS) | Description                             |
| :---------- | :------------------- | :--------------------------- | :-------------------------------------- |
| **dev**     | TicTacToe [Dev]      | `com.hlcb.tictactoe.dev`     | Environnement de développement local.   |
| **staging** | TicTacToe [Staging]  | `com.hlcb.tictactoe.staging` | Environnement de test / pré-production. |
| **prod**    | TicTacToe            | `com.hlcb.tictactoe`         | Version finale destinée au store.       |

## Fonctionnement Technique

### Initialisation

Le choix de l'environnement se fait au démarrage de l'application dans `lib/main.dart`.

1. Le framework Flutter injecte automatiquement le nom du flavor actuel dans la variable globale `appFlavor` (provenant de `package:flutter/services.dart`).
2. Cette valeur est utilisée pour initialiser la classe `F` (définie dans `lib/flavors.dart`).
3. Selon le flavor détecté, une configuration spécifique (`EnvironmentConfig`) est chargée depuis `lib/core/env/env_config.dart`.
4. La configuration est partagée dans toute l'application via Riverpod (`envConfigProvider`).

### Gestion des Configurations

Chaque environnement possède ses propres paramètres (ex: activation des logs) définis dans `lib/core/env/env_config.dart`.

```dart
const Map<EnvironmentType, EnvironmentConfig> environmentConfigs = {
  EnvironmentType.dev: EnvironmentConfig(enableLogs: true),
  EnvironmentType.staging: EnvironmentConfig(enableLogs: true),
  EnvironmentType.prod: EnvironmentConfig(enableLogs: false),
};
```

## Commandes Utiles

### Lancer l'application

Pour lancer l'application avec un flavor spécifique :

```bash
# Développement
flutter run --flavor dev -t lib/main.dart

# Staging
flutter run --flavor staging -t lib/main.dart

# Production
flutter run --flavor prod -t lib/main.dart
```

### Compiler l'application

```bash
# APK Android (Production)
flutter build apk --flavor prod -t lib/main.dart

# App Bundle Android (Production)
flutter build appbundle --flavor prod -t lib/main.dart

# iOS (Production)
flutter build ios --flavor prod -t lib/main.dart
```

## Modification des Flavors

Si vous devez modifier la structure des flavors (noms, IDs, icônes), éditez la section `flavorizr` dans le fichier `pubspec.yaml`, puis lancez la commande suivante pour régénérer les fichiers natifs :

```bash
flutter pub run flutter_flavorizr
```

> [!IMPORTANT]
> L'utilisation de `flutter_flavorizr` impacte les dossiers natifs `android/` et `ios/`. Assurez-vous de vérifier les changements dans ces dossiers après avoir lancé l'outil.
