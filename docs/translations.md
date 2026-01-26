# Documentation du Système de Traduction

Ce projet utilise le package [easy_localization](https://pub.dev/packages/easy_localization) pour gérer le support multi-langues (Internationalisation).

## Structure des Fichiers

Les fichiers de traduction se trouvent dans le dossier `assets/translations/` au format JSON :

- `assets/translations/en.json` : Traductions pour l'anglais.
- `assets/translations/fr.json` : Traductions pour le français.

## Configuration Technique

### 1. Initialisation

L'initialisation se fait dans `lib/main.dart` :

- `EasyLocalization.ensureInitialized()` garantit que les ressources sont chargées avant le lancement de l'application.
- Le widget `EasyLocalization` enveloppe l'application pour fournir le contexte de traduction.

### 2. Langues Supportées

Actuellement, l'application supporte deux langues :

- **Français (fr)** : Langue par défaut de l'utilisateur si détectée.
- **Anglais (en)** : Langue de secours (fallback).

## Utilisation dans le Code

### Traduction simple

Pour traduire une chaîne de caractères, utilisez l'extension `.tr()` sur la clé JSON :

```dart
Text('home.play'.tr())
```

### Traduction avec arguments

Certaines clés utilisent des paramètres (ex: `"victory": "Victoire de {}"`). Pour passer des valeurs :

```dart
"history.victory".tr(args: [playerNickname])
```

### Changement de langue

Le changement de langue s'effectue dynamiquement dans l'application (Sélecteur de langue dans les Paramètres) via la méthode `context.setLocale(Locale('...'))`.

## Ajout de Nouvelles Traductions

1. Ouvrez `en.json` et `fr.json`.
2. Ajoutez votre nouvelle clé dans la section appropriée.
3. Veillez à garder une structure cohérente et hiérarchisée (ex: `game.status.win`).
4. Lancez l'application pour voir les changements.

> [!TIP]
> Si les nouvelles clés ne s'affichent pas immédiatement lors d'un "Hot Reload", effectuez un "Hot Restart" pour recharger les fichiers JSON.
