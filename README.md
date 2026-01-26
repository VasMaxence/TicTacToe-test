# 🎮 Tic-Tac-Toe Ultimate

Un jeu de Morpion (Tic-Tac-Toe) moderne, robuste et extensible, développé avec **Flutter**. Cette application a été conçue comme un test technique démontrant des pratiques de développement de haute qualité, incluant une architecture propre, des tests automatisés et une gestion d'état réactive.

## 🚀 Fonctionnalités

### 🧠 Intelligence Artificielle (Minimax)

Jouez contre l'ordinateur avec trois niveaux de difficulté :

- **Facile** : Débutant, coups aléatoires.
- **Moyen** : Un défi équilibré avec une vision à court terme.
- **Difficile** : L'IA utilise l'algorithme Minimax pour garantir qu'elle ne perdra jamais.

### 👥 Local PvP & Personnalisation

- Jouez contre un ami sur le même téléphone.
- **Choix du camp** : En mode IA, choisissez de commencer avec les **X** ou les **O**.
- **IA réactive** : Si vous choisissez de jouer second, l'IA joue son coup instantanément.

### 📂 Historique & Statistiques

- Suivez vos victoires, défaites et matchs nuls.
- Historique détaillé incluant le mode de jeu (IA ou PvP) et la difficulté.
- Persistance locale sécurisée avec **Hive**.

### 🌍 Internationalisation (i18n)

- Support complet du **Français** et de l'**Anglais**.
- Détection automatique de la langue et changement dynamique depuis les paramètres.

---

## 🛠 Architecture Technique

L'application suit les principes de la **Clean Architecture** pour assurer la maintenabilité et la testabilité :

- **Domain** : Entités métier et Use Cases (Logique pure).
- **Data** : Modèles Hive, Repositories et Datasources.
- **Presentation** : Gestion d'état avec **Riverpod** et UI responsive.

### Stack Technique

- **State Management** : Riverpod.
- **Navigation** : AutoRoute (Génération de routes typées).
- **Persistence** : Hive CE (NoSQL rapide).
- **Traductions** : Easy Localization.
- **Design** : Système de design personnalisé avec dégradés vibrants et micro-animations.

---

## 💻 Installation & Développement

### Pré-requis

- Flutter SDK (v3.19.0+)
- Dart SDK

### Lancer le projet

```bash
flutter pub get

# Configurer les Git Hooks locaux (OBLIGATOIRE pour pusher)
sh scripts/setup_hooks.sh

flutter pub run build_runner build --delete-conflicting-outputs

# Lancer l'application (Flavor Dev)
flutter run --flavor dev -t lib/main.dart
```

### Tests

```bash
# Lancer tous les tests unitaires et d'intégration
flutter test
```

---

## 🗺 Prochaines Évolutions

Voici les prochaines étapes prévues pour enrichir l'expérience :

- [ ] **Mode En Ligne** : Jouer contre des amis à distance via Firebase ou WebSockets.
- [ ] **Animations UI** : Ajouter des effets de particules et des transitions fluides lors des victoires.
- [ ] **Personnalisation** : Thèmes de couleurs et icônes personnalisés pour les joueurs (X/O).
- [ ] **Statistiques Avancées** : Graphiques de progression et taux de victoire par difficulté.
- [ ] **Sons & Retours Haptiques** : Ajouter une immersion sonore et des vibrations lors des coups.
- [ ] **Achat In App** : Ajouter des achats in-app pour des thèmes ou des fonctionnalités premium.
