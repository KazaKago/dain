import 'package:dain/bean/bean.dart';

class Factory<T> extends Bean<T> {
  Factory(final T Function() createInstance) : super(createInstance);

  @override
  T? getOrCreateInstance({required final String scopeId, required final String scopeName}) {
    return createInstance();
  }
}
