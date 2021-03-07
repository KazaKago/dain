import 'package:dain/bean/scoped.dart';
import 'package:dain/error/bean_instance_creation_exception.dart';
import 'package:dain/error/closed_scope_exception.dart';
import 'package:dain/error/scope_id_not_allowed_null_exception.dart';
import 'package:dain/error/scope_name_not_allowed_null_exception.dart';
import 'package:dain/module/module.dart';

class Scope {
  Scope(this._modules, this._scopeId, this._scopeName, this._closeSelfFunc) {
    if (_scopeId == null) throw const ScopeIdNotAllowedNullException();
    if (_scopeName == null) throw const ScopeNameNotAllowedNullException();
  }

  final List<Module> _modules;
  final String _scopeId;
  final String _scopeName;
  final void Function(String scopeId) _closeSelfFunc;
  bool isClose = false;

  T inject<T>({final Map<String, dynamic> parameters}) {
    for (final module in _modules) {
      module
        ..get = _dispatchInject
        ..parameters = parameters ?? <String, dynamic>{};
    }
    final instance = _dispatchInject<T>();
    for (final module in _modules) {
      module
        ..get = (<T>() => null)
        ..parameters = <String, dynamic>{};
    }
    return instance;
  }

  void close() {
    if (isClose) throw ClosedScopeException(_scopeId);
    isClose = true;
    for (final module in _modules) {
      module.beans().forEach((bean) {
        if (bean is Scoped) {
          bean.close(_scopeId);
        }
      });
    }
    _closeSelfFunc(_scopeId);
  }

  T _dispatchInject<T>() {
    if (isClose) throw ClosedScopeException(_scopeId);
    for (var i = 0; i < _modules.length; i++) {
      final resolvedInstance = _resolve<T>(_modules[i]);
      if (resolvedInstance != null) return resolvedInstance;
    }
    throw BeanInstanceCreationException(T);
  }

  T _resolve<T>(final Module module) {
    final bean = module.beans().firstWhere((bean) => T == bean.type, orElse: () => null);
    return bean?.getOrCreateInstance(scopeId: _scopeId, scopeName: _scopeName) as T;
  }
}
