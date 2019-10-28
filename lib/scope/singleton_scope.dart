import 'package:dain/module/module.dart';
import 'package:dain/scope/scope.dart';

class SingletonScope {
  static const String SCOPE_ID = "LIBRARY_RESERVED_SINGLETON_SCOPE_ID";
  static const String SCOPE_NAME = "LIBRARY_RESERVED_SINGLETON_SCOPE_NAME";
  static Scope _instance;

  SingletonScope._();

  static void setCreateModules(final List<Module> modules) {
    _instance?.close();
    _instance = Scope(modules, SCOPE_ID, SCOPE_NAME, (_) => _instance = null);
  }

  static T inject<T>({final Map<String, dynamic> parameters}) {
    return _instance.inject<T>(parameters: parameters);
  }
}
