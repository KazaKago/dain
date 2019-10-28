import 'package:dain/error/no_scope_found_error.dart';
import 'package:dain/error/scope_already_exists_error.dart';
import 'package:dain/module/module.dart';
import 'package:dain/scope/scope.dart';

class ScopeResolver {
  static Map<String, Scope> _scopeMap = {};

  ScopeResolver._();

  static Scope createScope(final List<Module> modules, final String scopeId, final String scopeName) {
    var scope = _resolveScope(scopeId);
    if (scope != null) throw ScopeAlreadyExistsError(scopeId);
    scope = Scope(modules, scopeId, scopeName, ScopeResolver._closeScope);
    _scopeMap[scopeId] = scope;
    return scope;
  }

  static Scope getScope(final String scopeId) {
    final scope = _resolveScope(scopeId);
    if (scope == null) throw NoScopeFoundError(scopeId);
    return scope;
  }

  static Scope getOrCreateScope(final List<Module> modules, final String scopeId, final String scopeName) {
    final scope = _resolveScope(scopeId);
    if (scope != null) {
      return getScope(scopeId);
    } else {
      return createScope(modules, scopeId, scopeName);
    }
  }

  static void _closeScope(final String scopeId) {
    _scopeMap.remove(scopeId);
  }

  static Scope _resolveScope(final String scopeId) {
    final scope = _scopeMap[scopeId];
    if (scope?.isClose == false) {
      return scope;
    } else {
      return null;
    }
  }
}
