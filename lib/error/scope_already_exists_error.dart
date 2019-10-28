class ScopeAlreadyExistsError extends Error {
  final String _scopeId;

  ScopeAlreadyExistsError(this._scopeId);

  @override
  String toString() {
    return "$runtimeType: Scope id '$_scopeId' is already created";
  }
}
