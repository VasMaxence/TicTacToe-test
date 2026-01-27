# Documentation CI & Git Hooks

La qualité du code est assurée par deux systèmes complémentaires : un processus d'intégration continue (CI) distant et une protection locale via des Git Hooks.

## 🤖 Intégration Continue (GitHub Actions)

Un workflow est configuré dans `.github/workflows/test.yml`. Il s'exécute automatiquement lors de chaque **push** ou **pull request** sur les branches `main`, `master` et `dev`.

### Étapes du pipeline :

1. **Checkout** : Récupération du code source.
2. **Setup Flutter** : Installation de l'environnement Flutter (canal stable).
3. **Dependencies** : Installation des packages via `flutter pub get`.
4. **Code Generation** : Lancement de `build_runner` pour générer les fichiers nécessaires (routes, persistence, etc.).
5. **Tests** : Exécution de `flutter test`. Le pipeline échoue si un seul test ne passe pas.

## 🛡️ Protection Locale (Git Hooks)

Pour éviter d'envoyer du code cassé sur le serveur et gagner du temps (feedback immédiat), un hook `pre-push` a été mis en place.

### Fonctionnement :

- Avant chaque `git push`, le script `scripts/git/pre-push` est lancé automatiquement.
- Il exécute la commande `flutter test`.
- Si les tests échouent, le push est **annulé**. Vous devez corriger les erreurs avant de pouvoir retenter l'envoi.

### ⚙️ Installation (Requis pour les développeurs) :

Chaque développeur doit activer ce système localement une seule fois après avoir cloné le projet :

```bash
sh scripts/setup_hooks.sh
```

Ce script va :

1. Copier le script `pre-push` dans votre dossier local `.git/hooks/`.
2. Donner les permissions d'exécution nécessaires.
