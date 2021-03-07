class ClosedScopeException implements Exception {
  const ClosedScopeException(this._scopeId);

  final String _scopeId;

  @override
  String toString() {
    return "$runtimeType: Scope id '$_scopeId' is closed";
  }
}
