extension ListExtensions on List {
  T? max<T>(int Function(T a, T b) compare) {
    if (isEmpty) return null;
    var max = this[0];
    for (var i = 1; i < length; i++) {
      if (compare(max, this[i]) < 0) {
        max = this[i];
      }
    }
    return max;
  }

  bool areListsEqual(List<dynamic> list2) {
    if (length != list2.length) {
      return false;
    }

    for (int i = 0; i < length; i++) {
      if (this[i] != list2[i]) {
        return false;
      }
    }

    return true;
  }
}

/// {@category Extension}
/// Extension of [Iterable] :
///
/// - [firstWhereOrNull] : Return the first element that satisfies a predicate, else return a null value.
/// - [lastWhereOrNull] : Return the last element that satisfies a predicate, else return a null value.
///
extension IterableExtensions<T> on Iterable<T> {
  /// Return the first element that satisfies a predicate, else return a null value.
  ///
  /// [Function] predicate: Function to test each element for a condition.
  ///
  T? firstWhereOrNull(bool Function(T) predicate) {
    final val = where((element) => predicate(element));
    return val.isNotEmpty ? val.first : null;
  }

  /// Return the last element that satisfies a predicate, else return a null value.
  ///
  /// [Function] predicate: Function to test each element for a condition.
  ///
  T? lastWhereOrNull(bool Function(T) predicate) {
    final val = where((element) => predicate(element));
    return val.isNotEmpty ? val.last : null;
  }
}
