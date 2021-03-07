import 'package:dain/bean/bean.dart';
import 'package:dain/error/scope_id_not_allowed_null_exception.dart';
import 'package:dain/error/scope_name_not_allowed_null_exception.dart';
import 'package:dain/scope/singleton_scope.dart';

class Scoped<T> extends Bean<T> {
  Scoped(this._scopeName, final T Function() createInstance) : super(createInstance) {
    if (_scopeName == null) throw const ScopeNameNotAllowedNullException();
  }

  final Map<String, T> _sharedInstanceMap = {};
  final String _scopeName;

  @override
  T getOrCreateInstance({final String scopeId, final String scopeName}) {
    if (scopeId == null) throw const ScopeIdNotAllowedNullException();
    if (scopeName == null) throw const ScopeNameNotAllowedNullException();
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
    if (scopeId == null) throw const ScopeIdNotAllowedNullException();
    _sharedInstanceMap.remove(scopeId);
  }
}
