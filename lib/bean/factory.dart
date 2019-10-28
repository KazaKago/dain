import 'package:dain/bean/bean.dart';

class Factory<T> extends Bean<T> {
  Factory(final T Function() createInstance) : super(createInstance);

  @override
  T getOrCreateInstance({final String scopeId, final String scopeName}) {
    return createInstance();
  }
}
