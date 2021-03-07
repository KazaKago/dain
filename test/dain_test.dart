import 'package:dain/dain.dart';
import 'package:test/test.dart';

import 'di/test_module.dart';
import 'models/scoped_model.dart';

void main() {
  setUp(() {
    Dain.start([
      TestModule(),
    ]);
  });

  test('adds one to input values', () {
    final scope1_1 = Dain.createScope('scope1', 'MY_SCOPE');
    final instance1_1_1 = scope1_1.inject<ScopedModel>(parameters: <String, String>{'param': 'Hi!'});
    final instance1_1_2 = scope1_1.inject<ScopedModel>();
    expect(instance1_1_1.hashCode, equals(instance1_1_2.hashCode));

//    final scope2 = Dain.createScope("scope2", "MY_SCOPE");
//    final instance2 = scope2.inject<MyPageViewModel>();
//    print(instance2.hashCode);
//
//    final scope1_2 = Dain.getScope("scope1");
//    final instance1_2 = scope1_2.inject<MyPageViewModel>();
//    print(instance1_2.hashCode);
//    print(instance1_2.hoge);
//
//    scope2.close();
//
//    scope1_1.close();
//    final scope1_3 = Dain.createScope("scope1", "MY_SCOPE");
//    final instance1_3 = scope1_3.inject<MyPageViewModel>();
//    print(instance1_3.hashCode);
//    print(instance1_3.hoge);
//    scope1_3.close();

//
//    final calculator = Calculator();
//    expect(calculator.addOne(2), 3);
//    expect(calculator.addOne(-7), -6);
//    expect(calculator.addOne(0), 1);
//    expect(() => calculator.addOne(null), throwsNoSuchMethodError);
  });
}
