abstract class Bean<T> {
  final Type type = T;
  T Function() createInstance;

  Bean(T createInstance()) {
    this.createInstance = createInstance;
  }

  T getOrCreateInstance({final String scopeId, final String scopeName});
}
