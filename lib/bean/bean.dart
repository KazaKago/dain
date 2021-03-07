abstract class Bean<T> {
  Bean(this.createInstance);

  final Type type = T;
  final T Function() createInstance;

  T getOrCreateInstance({final String scopeId, final String scopeName});
}
