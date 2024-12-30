import 'package:singleton_macro/singleton_macro.dart';
import 'package:test/test.dart';

@Singleton()
class MySingletonClass {
  String name = "foo";
}

void main() {
  test('Singleton macro test', () {
    // Create the first instance
    final instance1 = MySingletonClass();
    expect(instance1.name, equals("foo"));

    // Modify the instance
    instance1.name = "bar";

    // Create the second instance
    final instance2 = MySingletonClass();
    expect(instance2.name, equals("bar"));

    // Check that both instances are the same
    expect(instance1, same(instance2));
  });
}
