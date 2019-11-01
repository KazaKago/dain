import 'package:dain/dain.dart';

import 'di/example_module.dart';
import 'model/example_model.dart';

void main() {
  _setupDI();
  _basicUsage();
}

void _setupDI() {
  Dain.start([
    ExampleModule(),
  ]);
}

void _basicUsage() {
  final exampleModel = Dain.inject<ExampleModel>();
  exampleModel.sayHello(); // print "Hello World!"
}
