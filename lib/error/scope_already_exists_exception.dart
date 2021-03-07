class ScopeAlreadyExistsException implements Exception {
  const ScopeAlreadyExistsException(this._scopeId);

  final String _scopeId;

  @override
  String toString() {
    return "$runtimeType: Scope id '$_scopeId' is already created";
  }
}
