class BeanInstanceCreationException implements Exception {
  const BeanInstanceCreationException(this.bean) : super();

  final Type bean;

  @override
  String toString() {
    return "$runtimeType: Can't create definition for '$bean'";
  }
}
