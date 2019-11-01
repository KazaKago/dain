import 'package:dain/bean/bean.dart';
import 'package:dain/dain.dart';
import 'package:dain/module/module.dart';

void main() {
  Dain.start([
    ExampleModule(),
  ]);

  final exampleModel = Dain.inject<ExampleModel>();
  exampleModel.sayHello(); // print "Hello World!"
}

//Interface class
abstract class ExampleModel {
  void sayHello();
}

//Implementation class
class ExampleModelImpl extends ExampleModel {
  @override
  void sayHello() {
    print("Hello World!");
  }
}

//Bean registration class
class ExampleModule extends Module {
  @override
  List<Bean> register() {
    return [
      single<ExampleModel>(() => ExampleModelImpl()),
    ];
  }
}
