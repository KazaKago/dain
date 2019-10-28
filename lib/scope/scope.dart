import 'package:dain/bean/scoped.dart';
import 'package:dain/error/bean_instance_creation_error.dart';
import 'package:dain/error/closed_scope_error.dart';
import 'package:dain/error/scope_id_not_allowed_null_error.dart';
import 'package:dain/error/scope_name_not_allowed_null_error.dart';
import 'package:dain/module/module.dart';

class Scope {
  final List<Module> _modules;
  final String _scopeId;
  final String _scopeName;
  final void Function(String scopeId) _closeSelfFunc;
  bool isClose = false;

  Scope(this._modules, this._scopeId, this._scopeName, this._closeSelfFunc) {
    if (_scopeId == null) throw ScopeIdNotAllowedNullError();
    if (_scopeName == null) throw ScopeNameNotAllowedNullError();
  }

  T inject<T>({final Map<String, dynamic> parameters}) {
    _modules.forEach((module) {
      module.get = _dispatchInject;
      module.parameters = parameters ?? {};
    });
    final instance = _dispatchInject<T>();
    _modules.forEach((module) {
      module.get = (<T>() => null);
      module.parameters = {};
    });
    return instance;
  }

  void close() {
    if (isClose) throw ClosedScopeError(_scopeId);
    isClose = true;
    _modules.forEach((module) {
      module.beans().forEach((bean) {
        if (bean is Scoped) {
          bean.close(_scopeId);
        }
      });
    });
    _closeSelfFunc(_scopeId);
  }

  T _dispatchInject<T>() {
    if (isClose) throw ClosedScopeError(_scopeId);
    for (var i = 0; i < _modules.length; i++) {
      final T resolvedInstance = _resolve(_modules[i]);
      if (resolvedInstance != null) return resolvedInstance;
    }
    throw BeanInstanceCreationError(T);
  }

  T _resolve<T>(final Module module) {
    final bean = module.beans().firstWhere((bean) => (T == bean.type), orElse: () => null);
    return bean?.getOrCreateInstance(scopeId: _scopeId, scopeName: _scopeName);
  }
}
