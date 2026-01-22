# TicTacToe-test

## Falvors :

Gestion des environnements (DEV, STAGING et PROD) via le package flutter_flavorizr :

- Configuration des environnements se fait au lancement de l'application.
- Aucune logique métier n'est liée aux flavors.

### How To Run :

```sh
# To run dev environment
flutter run --flavor dev --dart-define=FLAVOR=dev

# To run staging environment
flutter run --flavor staging --dart-define=FLAVOR=staging

# To run prod environment
flutter run --flavor prod --dart-define=FLAVOR=prod
```

### Why Flutter Flavorizr ?

_Le choix de flutter_flavorizr au lieu de flavors natifs => Pas gros projet, petit et rapide. Donc plus intéressant._
_Dans le cas d'un gros projet, il est plus intéressant d'utiliser les flavors natifs afin d'avoir plus de flexibilité._
