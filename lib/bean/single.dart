import 'package:dain/bean/bean.dart';

class Single<T> extends Bean<T> {
  Single(final T Function() createInstance) : super(createInstance);

  T _sharedInstance;

  @override
  T getOrCreateInstance({final String scopeId, final String scopeName}) {
    return _sharedInstance ??= createInstance();
  }
}
