import 'package:dain/bean/bean.dart';

class Single<T> extends Bean<T> {
  Single(final T Function() createInstance) : super(createInstance);

  T? _sharedInstance;

  @override
  T? getOrCreateInstance({required final String scopeId, required final String scopeName}) {
    return _sharedInstance ??= createInstance();
  }
}
