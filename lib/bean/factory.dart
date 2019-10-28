import 'package:dain/bean/bean.dart';

class Factory<T> extends Bean<T> {
  Factory(T createInstance()) : super(createInstance);

  @override
  T getOrCreateInstance({final String scopeId, final String scopeName}) {
    return createInstance();
  }
}
