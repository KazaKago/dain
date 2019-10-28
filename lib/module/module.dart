import 'package:dain/bean/bean.dart';
import 'package:dain/bean/factory.dart';
import 'package:dain/bean/scoped.dart';
import 'package:dain/bean/single.dart';

abstract class Module {
  List<Bean> _beans;
  T Function<T>() get = (<T>() => null);
  Map<String, dynamic> parameters = {};

  List<Bean> register();

  List<Bean> beans() {
    if (_beans == null) _beans = register();
    return _beans;
  }

  Single single<T>(final T Function() createInstance) {
    return Single<T>(createInstance);
  }

  Factory factory<T>(final T Function() createInstance) {
    return Factory<T>(createInstance);
  }

  Scoped scoped<T>(final String scopeName, final T Function() createInstance) {
    return Scoped<T>(scopeName, createInstance);
  }
}
