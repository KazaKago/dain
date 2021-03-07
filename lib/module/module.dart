import 'package:dain/bean/bean.dart';
import 'package:dain/bean/factory.dart';
import 'package:dain/bean/scoped.dart';
import 'package:dain/bean/single.dart';

abstract class Module {
  List<Bean<dynamic>>? _beans;
  T Function<T>()? get;
  Map<String, dynamic> parameters = <String, dynamic>{};

  List<Bean<dynamic>> register();

  List<Bean<dynamic>> beans() {
    return _beans ??= register();
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
