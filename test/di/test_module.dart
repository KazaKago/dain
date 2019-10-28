import 'package:dain/bean/bean.dart';
import 'package:dain/module/module.dart';

import '../models/scoped_model.dart';
import '../models/scoped_model_impl.dart';

class TestModule extends Module {
  @override
  List<Bean> register() {
    return [
      scoped<ScopedModel>("MY_SCOPE", () => ScopedModelImpl()),
    ];
  }
}
