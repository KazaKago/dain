abstract class Bean<T> {
  Bean(this.createInstance);

  final Type type = T;
  final T Function() createInstance;

  T? getOrCreateInstance({required final String scopeId, required final String scopeName});
}
