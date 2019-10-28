class ClosedScopeError extends Error {
  final String _scopeId;

  ClosedScopeError(this._scopeId);

  @override
  String toString() {
    return "$runtimeType: Scope id '$_scopeId' is closed";
  }
}
