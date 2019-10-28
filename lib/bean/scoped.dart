import 'package:dain/bean/bean.dart';
import 'package:dain/error/scope_id_not_allowed_null_error.dart';
import 'package:dain/error/scope_name_not_allowed_null_error.dart';
import 'package:dain/scope/singleton_scope.dart';

class Scoped<T> extends Bean<T> {
  final Map<String, T> _sharedInstanceMap = {};
  final String _scopeName;

  Scoped(this._scopeName, final T Function() createInstance) : super(createInstance) {
    if (_scopeName == null) throw ScopeNameNotAllowedNullError();
  }

  @override
  T getOrCreateInstance({final String scopeId, final String scopeName}) {
    if (scopeId == null) throw ScopeIdNotAllowedNullError();
    if (scopeName == null) throw ScopeNameNotAllowedNullError();
    if (scopeId == SingletonScope.SCOPE_ID) return null;
    if (scopeName != this._scopeName) return null;

    var sharedInstance = _sharedInstanceMap[scopeId];
    if (sharedInstance == null) {
      sharedInstance = createInstance();
      _sharedInstanceMap[scopeId] = sharedInstance;
    }
    return sharedInstance;
  }

  void close(final String scopeId) {
    if (scopeId == null) throw ScopeIdNotAllowedNullError();
    _sharedInstanceMap.remove(scopeId);
  }
}
