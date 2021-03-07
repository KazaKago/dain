import 'package:dain/module/module.dart';
import 'package:dain/scope/scope.dart';

class SingletonScope {
  const SingletonScope._();

  static const String scopeId = 'LIBRARY_RESERVED_SINGLETON_SCOPE_ID';
  static const String scopeName = 'LIBRARY_RESERVED_SINGLETON_SCOPE_NAME';
  static Scope? _instance;

  static void setCreateModules(final List<Module> modules) {
    _instance?.close();
    _instance = Scope(modules, scopeId, scopeName, (_) => _instance = null);
  }

  static T inject<T>({final Map<String, dynamic>? parameters}) {
    return _instance!.inject<T>(parameters: parameters);
  }
}
