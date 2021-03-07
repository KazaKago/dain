class ScopeIdNotAllowedNullException implements Exception {
  const ScopeIdNotAllowedNullException();

  @override
  String toString() {
    return '$runtimeType: Scope ID is not allowed to be null';
  }
}
