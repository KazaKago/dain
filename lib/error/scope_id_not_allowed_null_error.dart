class ScopeIdNotAllowedNullError extends Error {
  @override
  String toString() {
    return "$runtimeType: Scope ID is not allowed to be null";
  }
}
