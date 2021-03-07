import 'package:dain/bean/bean.dart';
import 'package:dain/dain.dart';
import 'package:dain/module/module.dart';

void main() {
  Dain.start([
    ExampleModule(),
  ]);

  Dain.inject<ExampleService>().sayHello(); // print "Hello World!"
}

abstract class ExampleService {
  void sayHello();
}

//Implementation class
class ExampleServiceImpl extends ExampleService {
  @override
  void sayHello() {
    print('Hello World!');
  }
}

//Bean registration class
class ExampleModule extends Module {
  @override
  List<Bean> register() {
    return [
      single<ExampleService>(() => ExampleServiceImpl()),
    ];
  }
}
