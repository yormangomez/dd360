enum FlavorType {
  dev,
  stg,
  prd,
}

class Flavor {
  Flavor._internal();
  static final Flavor _instance = Flavor._internal();
  static Flavor get instance => _instance;

  FlavorType _flavor = FlavorType.dev;
  set setFlavor(FlavorType flavor) => _flavor = flavor;
  FlavorType get value => _flavor;

  String get api {
    switch (_flavor) {
      case FlavorType.dev:
        return 'https://gateway.marvel.com/v1/public';
      case FlavorType.prd:
        return 'https://gateway.marvel.com/v1/public';
      case FlavorType.stg:
        return 'https://gateway.marvel.com/v1/public';
    }
  }

  String get dynamicLink {
    switch (_flavor) {
      case FlavorType.dev:
        return 'https://gateway.marvel.com/v1/public';
      case FlavorType.prd:
        return 'https://gateway.marvel.com/v1/public';
      case FlavorType.stg:
        return 'https://gateway.marvel.com/v1/public';
    }
  }

  bool get showChuck {
    switch (_flavor) {
      case FlavorType.dev:
        return true;
      case FlavorType.prd:
        return true;
      case FlavorType.stg:
        return false;
    }
  }
}
