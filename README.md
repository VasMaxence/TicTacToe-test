# TicTacToe-test

## Falvors :

Gestion des environnements (DEV, STAGING et PROD) via le package flutter_flavorizr :

- Configuration des environnements se fait au lancement de l'application.
- Aucune logique métier n'est liée aux flavors.

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
# Récupérer les dépendances
flutter pub get

# Lancer la génération de code (Build Runner)
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
