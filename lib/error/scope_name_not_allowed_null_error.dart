class ScopeNameNotAllowedNullError extends Error {
  @override
  String toString() {
    return "$runtimeType: Scope Name is not allowed to be null";
  }
}
