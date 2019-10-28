class NoScopeFoundError extends Error {
  final String _scopeId;

  NoScopeFoundError(this._scopeId);

  @override
  String toString() {
    return "$runtimeType: Scope id '$_scopeId' is not found";
  }
}
