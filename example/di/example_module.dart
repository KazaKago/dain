import 'package:dain/bean/bean.dart';
import 'package:dain/module/module.dart';

import '../model/example_model.dart';
import '../model/example_model_impl.dart';

class ExampleModule extends Module {
  @override
  List<Bean> register() {
    return [
      single<ExampleModel>(() => ExampleModelImpl()),
    ];
  }
}
