class ScopeNameNotAllowedNullException implements Exception {
  const ScopeNameNotAllowedNullException();

  @override
  String toString() {
    return '$runtimeType: Scope Name is not allowed to be null';
  }
}
