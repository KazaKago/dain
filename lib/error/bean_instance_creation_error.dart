class BeanInstanceCreationError extends Error {
  final Type bean;

  BeanInstanceCreationError(this.bean) : super();

  @override
  String toString() {
    return "$runtimeType: Can't create definition for '$bean'";
  }
}
