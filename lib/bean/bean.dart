abstract class Bean<T> {
  final Type type = T;
  final T Function() createInstance;

  Bean(this.createInstance);

  T getOrCreateInstance({final String scopeId, final String scopeName});
}
