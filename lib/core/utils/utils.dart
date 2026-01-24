import 'dart:async' show FutureOr;
import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe_test/core/extensions/list.extensions.dart';

/// {@category Utils}
/// Permet d'executer une fonction après le build de la page.
void execAfterBuildMethod(Function fn) => WidgetsBinding.instance.addPostFrameCallback((_) => fn());

/// {@category Utils}
/// Permet de récupérer la valeur d'une enum sous forme de [String].
String enumToString<T>(T actual) => actual.toString().split(".").last;

/// {@category Utils}
/// Permet de récupérer la valeur d'une [String] sous forme de l'enum [T].
T? stringToEnum<T>(List<T> values, String? value) => values.firstWhereOrNull((element) => enumToString(element) == value);

/// Permet d'executer une fonction en fonction de la plateforme.
T execInCaseOfPlatfom<T>(Function fnWeb, Function fnMobile) {
  if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
    return fnMobile();
  } else {
    return fnWeb();
  }
}

FutureOr<T?> execInCasOfOs<T>(Function fnAndroid, Function fnIos) {
  if (Platform.isAndroid) {
    return fnAndroid();
  } else if (Platform.isIOS) {
    return fnIos();
  }
  return null;
}

/// Permet de récupérer la valeur en fonction de la plateforme.
T? getValueForPlatform<T>(T? val1, T? val2) => execInCaseOfPlatfom(() => val1, () => val2);
