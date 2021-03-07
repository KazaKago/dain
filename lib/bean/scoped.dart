import 'package:dain/bean/bean.dart';
import 'package:dain/scope/singleton_scope.dart';

class Scoped<T> extends Bean<T> {
  Scoped(this._scopeName, final T Function() createInstance) : super(createInstance);

  final Map<String, T?> _sharedInstanceMap = {};
  final String _scopeName;

  @override
  T? getOrCreateInstance({required final String scopeId, required final String scopeName}) {
    if (scopeId == SingletonScope.scopeId) return null;
    if (scopeName != _scopeName) return null;

    var sharedInstance = _sharedInstanceMap[scopeId];
    if (sharedInstance == null) {
      sharedInstance = createInstance();
      _sharedInstanceMap[scopeId] = sharedInstance;
    }
    return sharedInstance;
  }

  void close(final String scopeId) {
    _sharedInstanceMap.remove(scopeId);
  }
}
