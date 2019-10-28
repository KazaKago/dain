import 'package:dain/bean/bean.dart';

class Single<T> extends Bean<T> {
  T _sharedInstance;

  Single(T createInstance()) : super(createInstance);

  @override
  T getOrCreateInstance({final String scopeId, final String scopeName}) {
    if (_sharedInstance == null) _sharedInstance = createInstance();
    return _sharedInstance;
  }
}
