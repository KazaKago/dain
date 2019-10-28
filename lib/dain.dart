import 'package:dain/module/module.dart';
import 'package:dain/scope/scope.dart';
import 'package:dain/scope/scope_resolver.dart';
import 'package:dain/scope/singleton_scope.dart';

class Dain {
  static List<Module> _modules = [];

  Dain._();

  static start(final List<Module> modules) {
    _modules = modules;
    SingletonScope.setCreateModules(modules);
  }

  static T inject<T>({final Map<String, dynamic> parameters}) {
    return SingletonScope.inject<T>(parameters: parameters);
  }

  static Scope createScope(final String scopeId, final String scopeName) {
    return ScopeResolver.createScope(_modules, scopeId, scopeName);
  }

  static Scope getScope(final String scopeId) {
    return ScopeResolver.getScope(scopeId);
  }

  static Scope getOrCreateScope(final String scopeId, final String scopeName) {
    return ScopeResolver.getOrCreateScope(_modules, scopeId, scopeName);
  }
}
