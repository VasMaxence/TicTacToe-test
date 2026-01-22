enum Flavor {
  dev,
  staging,
  prod,
}

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'TicTacToe [Dev]';
      case Flavor.staging:
        return 'TicTacToe [Staging]';
      case Flavor.prod:
        return 'TicTacToe';
    }
  }

}
